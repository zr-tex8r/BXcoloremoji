use strict;
use JSON;
use utf8;

# emojione/emoji.json
# https://raw.githubusercontent.com/emojione/emojione/master/emoji.json
my $src_file = shift(@ARGV) or die;
my $out_file = shift(@ARGV) or die;
my $pdf_dir = '../emoji_images/twemoji-pdf';
my $out_info = '2020/06/14 v0.10';
my $prefix = 'bxce';
my $sector_size = 300;

my (@data, @file, %index);

sub main {
  load_data();
  scan_files();
  open(my $ho, '>', $out_file) or die;
  binmode($ho);
  print $ho (header());
  write_mapping($ho);
  write_index($ho);
  print $ho (footer());
}

sub convert_code_seq {
  local ($_) = @_; $_ = '-'.uc($_);
  s/-FE0\w//g; s/-0+/-/g; s/^-//; s/-/ /g;
  return $_;
}
sub convert_name {
  local ($_) = @_; s/^:(.*):$/$1/g;
  return $_;
}

sub make_file_name {
  local ($_) = @_; s/ /-/g;
  return $_;
}

sub load_data {
  local ($_, $/); @data = ();
  open(my $h, '<', $src_file) or die;
  $_ = <$h>; close($h);
  my $emoji = decode_json($_);
  foreach my $code (keys %$emoji) {
    my $entry = $emoji->{$code};
    my $name = convert_name($entry->{shortname});
    my $cseq = convert_code_seq($entry->{code_points}{output});
    push(@data, [$name, $cseq]);
  }
  @data = sort { $a->[0] cmp $b->[0] } (@data);
}

sub scan_files {
  @file = ();
  foreach my $f (glob("$pdf_dir/*.pdf")) {
    local $_ = $f; s|^.*/||; s|\.pdf$||;
    push(@file, $_);
  }
}

sub write_mapping {
  my ($ho) = @_;
  my %file = map { $_ => 1 } (@file);
  my ($sec, $idx, $ac) = (0, '', 0);
  print $ho ("\\ifcase\\$prefix\@ndindex %[$sec]\n");
  foreach (@data) {
    my ($name, $cseq) = @$_; my $na = '*';
    my $ok = (exists $file{make_file_name($cseq)});
    my $il = substr($name, 0, 1);
    if ($il ne $idx) {
      if ($ac >= $sector_size) {
        $sec += 1; $ac = 0;
        ($sec > 0) and print $ho ("\\or %[$sec]\n");
      }
      $idx = $il; $index{$idx} = $sec;
    }
    printf $ho ("\\%s\@do{%s}{%s}%s\n", $prefix, $name, $cseq,
      ($ok) ? '' : '%NA');
    $ac += 1;
  }
}

sub write_index {
  my ($ho) = @_;
  print $ho ("\\else\n");
  foreach my $idx (sort(keys %index)) {
    my $sec = $index{$idx};
    printf $ho ("\\%s\@do{%s}{%s}\n", $prefix, $idx, $sec);
  }
  print $ho ("\\fi\n");
}

sub header {
  local $_ = <<'EOT';
%%
%% This is file '%FILE%'.
%%
%% Copyright (c) 2017-2020 Takayuki YATO (aka. "ZR")
%%   GitHub:   https://github.com/zr-tex8r
%%   Twitter:  @zr_tex8r
%%
%% This package is distributed under the MIT License.
%%

%% file declaration
\ProvidesFile{%FILE%}[%INFO%]

%--------------------------------------- name mappings
EOT
  my $of = $out_file; $of =~ s|.*/||;
  s|%FILE%|$of|g; s|%INFO%|$out_info|g;
  return $_;
}

sub footer {
  local $_ = <<'EOT';
%--------------------------------------- done
%% EOF
EOT
  return $_;
}

main();
