#!/usr/bin/env perl
# install-image.pl
use strict;
use File::Copy 'copy';
use File::Glob 'bsd_glob';
my $program = "install-image";
my $src_png_dir = "72x72";
my $src_svg_dir = "svg";
my $dest_png_dir = "twemoji-png";
my $dest_pdf_dir = "twemoji-pdf";
my $inkscape = 'inkscape';
#
my ($src_dir, $dest_dir);

sub main {
  read_option();
  copy_png();
  convert_svg();
}

sub svg_to_pdf {
  my ($from, $to) = @_;
  (-f $from) or die;
  system(qq'$inkscape -A "$to" "$from"');
  ($? == 0) or info("WARNING", "conversion failed", $from);
}

sub copy_png {
  my $from = "$src_dir/$src_png_dir";
  info("copy PNG files from", $from);
  my $to = "$dest_dir/$dest_png_dir";
  info("to", $to);
  mkdir($to);
  my $c = 0;
  foreach my $sp (bsd_glob("$from/*.png")) {
    my $f = image_name($sp);
    copy($sp, "$to/$f.png");
    if (++$c % 500 == 0) { info("($c files)"); }
  }
  info("$c files done");
}

sub convert_svg {
  my $from = "$src_dir/$src_svg_dir";
  info("convert SVG files in", $from);
  my $to = "$dest_dir/$dest_pdf_dir";
  info("to PDF files and place them into", $to);
  mkdir($to);
  my $c = 0;
  foreach my $sp (bsd_glob("$from/*.svg")) {
    my $f = image_name($sp);
    svg_to_pdf($sp, "$to/$f.pdf");
    if (++$c % 50 == 0) { info("($c files)"); }
  }
  info("$c files done");
}
sub image_name {
  local ($_) = @_;
  s|^.*/||; s|\.\w+$||; s|-fe0[ef]||g;
  return 'twemoji-'.uc($_);
}

sub read_option {
  my $arg;
  if (!@ARGV || $ARGV[0] =~ m/^-/) {
    print(<<"EOT"); exit;
Usage: $program <twemoji_image_dir> <dest_dir>
  Here <twemoji_image_dir> is the base directory of twemoji repository
  where '$src_png_dir/' and '$src_svg_dir/' reside.
EOT
  }
  ($ARGV[0] !~ m/^\+/) or error("+MIDDLE spec is abolished");
  ($#ARGV == 1) or error("wrong number of arguments");
  $src_dir = unixy(shift(@ARGV));
  $dest_dir = unixy(shift(@ARGV));
  foreach ($src_dir, "$src_dir/$src_png_dir", "$src_dir/$src_svg_dir",
      $dest_dir) {
    (-d $_) or error("no such directory", $_);
  }
}

sub unixy {
  local ($_) = @_; s|\\|/|g; return $_;
}

sub info {
  print STDERR (join(": ", $program, @_), "\n");
}
sub error {
  info(@_); exit(1);
}

main();
# EOF
