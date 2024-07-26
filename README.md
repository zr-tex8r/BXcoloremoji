BXcoloremoji パッケージバンドル
===============================

LaTeX： カラー絵文字を出力する

### 前提環境

  * フォーマット： LaTeX
  * エンジン： e-TeX 拡張をサポートするもの
  * DVI ウェア（DVI 出力時）： 用いる画像形式に対応したもの
  * 依存パッケージ：
      - etoolbox
      - binhex（expl3が有効でない場合）

### インストール

  - `*.sty`/`*.def` → `$TEXMF/tex/latex/BXcoloremoji`
  - `emoji_images` のディレクトリをそのまま
    `$TEXMF/tex/latex/BXcoloremoji` の下に移動する。

### ライセンス

画像データについては以下が適用される：

Graphics work is licenced under:

CC-BY 4.0: (https://creativecommons.org/licenses/by/4.0/)
Copyright Twitter, Inc and other contributors

その他の著作物にはは以下が適用される：

Other work is licensed under:

the MIT License: (http://opensource.org/licenses/MIT)
Copyright 2017-2024 Takayuki YATO (aka. "ZR")


bxcoloremoji パッケージ
-----------------------

### パッケージ読込

DVI 出力の場合、事前に graphicx パッケージを読み込む必要がある。

※PDF 出力の場合、およびグローバルのドライバオプションが指定されている
場合は、自動的に graphicx がオプション無しで読み込まれる。

    \usepackage[dvipdfmx]{graphicx} % dvipdfmx の場合

また，昔の（2018-04-01 以前の）(pdf)LaTeX および pLaTeX の場合は，utf8
入力エンコーディングを有効化する必要がある。

    \usepackage[utf8]{inputenc}

その後に bxcoloremoji パッケージを読み込む。

    \usepackage[<オプション>]{bxcoloremoji}

利用可能なオプションは以下の通り。

  * 次節に挙げる設定パラメタ（例えば `twemoji-png` や `scale` 等）は
    パッケージオプションとしても指定できる。
  * `jatype=<値>`： 絵文字を和文文字として扱うか。  
    ※この値に関わらず、`*`付の命令（`\coloremoji*` 等）は常に和欧文中立
    な“画像”として扱われる。  
    ※和文扱いを行わない場合は`*`無と`*`付はどちらも“画像扱い”になるが
    `size`/`size*` 指定時は異なる出力になりうる。
      - `auto`（既定）： (u)pLaTeX であるかまたは LuaLaTeX で LuaTeX-ja
        が用いられている場合に和文扱いを行う。
      - `true`： 可能な限り、和文扱いを行うことを試みる。  
        ※現状では pdfLaTeX では効果がない。
      - `false`： 和文扱いを行わない。

以下は上級者向けの設定。

  * `nodvidriver`： ドライバ依存の動作を抑止する。具体的には、絵文字種別
    が `no-image` に固定される（絵文字は表示されない）。
  * `preload-names=<値>`： 短縮名と符号値の対応のデータをパッケージ読込時
    に一括して読み込むか。
      - `auto`（既定）： エンジンが XeLaTeX／LuaLaTeX／upLaTeX である
        場合は `true`、それ以外は `false`．
      - `true`： パッケージ読込時に全てのデータを読み込む。
      - `false`： 必要に応じて読み込む。
  * `bbparam=<値>`： 絵文字出力の `\includegraphics` に `bb` パラメタを
    指定するか。
      - `auto`（既定）： graphicx のドライバが dvipdfmx である場合にのみ
        指定する。  
        ※dvipdfmx の場合、`bb` を指定した方が動作が速い。
      - `true`/`false`： 常に指定する／しない。  
        ※`bb` 設定が禁止されているドライバもあるので注意。

### パラメタ設定

パラメタ設定は以下の方法で利用できる。

  - パッケージオプションに指定する。  
    `\usepackage[twemoji-png,scale=2]{bxcoloremoji}`
  - `\coloremojisetup` 命令の引数に指定する。その場で設定が変更されて、
    以降の絵文字出力命令に適用される。  
    `\coloremojisetup{twemoji-png,scale=2}`
  - 絵文字出力命令の先頭のオプション引数に指定する。その絵文字出力にのみ
    設定が適用される。  
    `\coloremoji[twemoji-png,scale=2]{☃}`

利用可能なパラメタは以下の通り。

  * 絵文字画像の種類を指定するもの。（既定値 = `twemoji-pdf`）
      - `twemoji-pdf`： twemoji の SVG 画像から変換した PDF 画像。
      - `twemoji-png`： twemoji の 72 ピクセルの PNG 画像。
      - `no-image`： 絵文字画像を使わず全てフォールバック出力にする。
      - `family=<名前>`： カスタムファミリ指定（後述）。
  * `size=<長さ>`： 絵文字のサイズ。
  * `size*=<長さ>`： `*`付命令での絵文字のサイズ。  
    ※`size` および `size*` の既定値は (u)pLaTeX では 1zw、
    LuaLaTeX + LuaTeX-ja では 1`\zw`、それ以外は 1em。この既定値は
    `jatype` の設定には影響されない。
  * `scale=<実数>`： 絵文字のサイズを、`size`/`size*` の値からさらに
     指定の倍率で変更する。（既定値 = 1）

### 使い方

命令・環境名が `[*]` 付で示されている（例えば `\coloremoji[*]`）場合、
実際には「`*`無」（`\coloremoji`）と「`*`付」（`\coloremoji*`）の変種が
存在することを示す。両者の違いは以下の通り。

  * `jatype` オプションにより和文扱いが有効になっている場合は、`*`無は
    和文扱いで、`*`付は和欧文中立な“画像扱い”になる。ただし数式中は
    両者ともに“画像扱い”になる。
  * `size` オプションは`*`無にのみ、`size*` オプションは`*`付にのみ適用
    される。（`scale` は両方に適用される。）

`[*]` 以外の `[...]` 表記はオプション引数で、これは実際に `[ ]` で
囲った形で指定する。

※本パッケージの命令については、必須引数を囲む `{}` は**省略できない**。

  * `\coloremojisetup{<設定>}`： パラメタ設定を変更する。  
    ※`<設定>` は `<キー>=<値>,...` の形のリスト。以降も同様。
  * `\coloremoji[*][<設定>]{<文字列>}`： 引数の文字列を絵文字として出力
    する。ただし，対象の画像がないなどの理由で絵文字として出力できない
    場合は，通常のテキスト出力にフォールバックする。  
  * `\coloremojicode[*][<設定>]{<符号値列>}`： 文字を「Unicode 符号値」
    または「JoyPixels の [emoji-toolkit] ライブラリで規定された短縮名」
    で入力してカラー絵文字を出力する。
    引数は、符号値で指定する場合はその16進表記、短縮名で指定する場合は
    `:短縮名:` の形式で入力し、複数文字を入力する場合は各文字の指定を
    を空白区切りで並べる。
    例： `\coloremojicode{:sushi: 23 20E3 1F643 :snowman:}`
  * `\coloremojiucs[*][<設定>]{<符号値列>}`： `\coloremojicode` の旧版
    における別名。  
    ※他の `coloremojicode～` の名前の命令・環境については、0.4 版以前
    から存在するものについては、同様に `coloremojiucs～` という別名が
    用意されている。

[emoji-toolkit]: https://github.com/joypixels/emoji-toolkit

#### キーキャップ絵文字を出力するカウンタ出力命令

0～10の整数値を、値に対応するキーキャップ絵文字（0️⃣～🔟）で出力する。  
※入力値が範囲外の場合はゲタ記号（〓）になる。

  * `\coloremojikeycapof[*][<設定>]{<整数>}`： 入力の整数値に対応する
    キーキャップ絵文字を出力する。
  * `\coloremojikeycap[*][<設定>]{<カウンタ名>}`： 指定のカウンタの現在
    の値に対応するキーキャップ絵文字を出力する。
  * `\pagenumbering{coloremojikeycap}`： ページ番号の形式をキーキャップ
    絵文字に変更する。

#### pifont パッケージ類似の機能

pifont パッケージの機能（`\dingfill` 命令、`dingautolist` 環境など）の
絵文字版に相当する、以下の命令が提供される。

※ここで挙げる機能の絵文字出力は、常に`*`付命令であるかのように動作する。
また、`*`やパラメタ設定オプションを付けることはできない。

  * `\coloremojifill{<文字列>}`： 充填命令（`\dotfill` の類）の一種で、
    `\coloremoji{<文字列>}` の出力を複数並べて行を充填する。
  * `\coloremojiline{<文字列>}`： 絵文字による飾り罫を出力する。すなわち
    `\coloremojifill{<文字列>}`の出力（ただし両端に若干の空きを入れる）
    のみを含む独立した行を出力する。
  * `\begin{coloremojilist}{<文字列>}`～`\end{coloremojilist}`：
    `\coloremoji{<文字列>}` の出力を項目ラベルとする箇条書きを出力する。
  * `\begin{coloremojiautolist}{<文字列>}`～`\end{coloremojiautolist}`：
    これも絵文字を項目ラベルとする箇条書きを出力する環境であるが、引数
    には何れかの「絵文字順序列」に含まれる絵文字の一つを指定する必要が
    ある。その文字から始まる順序列に従ってラベルを指定する。例えば、
    `\begin{coloremojiautolist}{♠}` の場合、先頭のラベルが「♠️」と
    なり、以下「♥️」「♦️」「♣️」と続く。  
    ※現状の実装では順序列の末尾に達した場合は先頭に戻る（つまり「♣️」
    の次は「♠️」になる）が、これは将来的に変更される可能性がある。
  * 以上の命令・環境について、引数に符号値列を指定する版も存在する。
      - `\coloremojicodefill{<符号値列>}`
      - `\coloremojicodeline{<符号値列>}`
      - `\begin{coloremojicodelist}{<符号値列>}`
      - `\begin{coloremojicodeautolist}{<符号値列>}`

現状では、以下に挙げる「絵文字順序列」が定められている。

  * ♈️→♉️→♊️→♋️→♌️→♍️→♎️→♏️→♐️→♑️→♒️→♓️
  * ♠️→♥️→♦️→♣️
  * 🕐️→🕑️→🕒️→🕓️→🕔️→🕕️→🕖️→🕗️→🕘️→🕙️→🕚️→🕛️
  * 0️⃣→1️⃣→2️⃣→3️⃣→4️⃣→5️⃣→6️⃣→7️⃣→8️⃣→9️⃣→🔟

### 絵文字の“短縮名”

`\coloremojicode` 中で用いる絵文字の短縮名については、JoyPixels（旧称
EmojiOne）の [emoji-toolkit] ライブラリで規定する名前が利用できる。
その他に以下に定める独自の短縮名が利用できる。
これらは emoji sequence の入力の便宜のためのものである。

    +           U+200D (ZWJ)
    !/red       U+1F9B0🦰（`+ !/red` で赤髪のhair style）
    !/curly     U+1F9B1🦱（`+ !/curly` で巻毛のhair style）
    !/bald      U+1F9B2🦲（`+ !/bald` で禿頭のhair style）
    !/white     U+1F9B3🦳（`+ !/white` で白髪のhair style）
    !black      U+2B1B⬛（`+ !black` で黒色の color indicator）
    !white      U+2B1C⬜（`+ !white` で白色の color indicator）
    !red        U+1F7E5🟥（`+ !red` で赤色の color indicator）
    !blue       U+1F7E6🟦（`+ !blue` で青色の color indicator）
    !orange     U+1F7E7🟧（`+ !orange` で橙色の color indicator）
    !yellow     U+1F7E8🟨（`+ !yellow` で黄色の color indicator）
    !green      U+1F7E9🟩（`+ !green` で緑色の color indicator）
    !purple     U+1F7EA🟪（`+ !purple` で紫色の color indicator）
    !brown      U+1F7EB🟫（`+ !brown` で茶色の color indicator）
    !female     U+2640♀ (`+ !female` で女性の gender indicator)
    !male       U+2642♂ (`+ !male` で男性の gender indicator)
    !flag       U+1F3F4🏴 (旗を表す tag sequence の base 文字)
    !<          U+2B05⬅ (`+ !<` で左の direction indicator)
    !>          U+27A1➡ (`+ !>` で右の direction indicator)
    !A .. !Z    U+1F1E6..1F1FF (flag sequence の構成要素)
    @           U+E007F (tag sequence の終端)
    @0 .. @9    U+E0030..E0039 (tag sequence の構成要素)
    @a .. @z    U+E0061..E007A (tag sequence の構成要素)

※独自の短縮名については名前を囲む `:～:` は省略可能である。  
※独自以外の短縮名については、現状では「整数の 16 進表記と解釈できない
ものは `:～:` が省略可能」という仕様であるが、これは将来変更される可能
性がある。

使用例：

    \coloremojicode{:man: + :woman: + :girl: + :girl:}
    \coloremojicode{!flag @g @b @w @l @s @}
    \coloremojicode{1F647 + !male}

### PDF 文字列中での絵文字の利用

hyperref 使用時の文書情報文字列（以降では“PDF 文字列”と呼ぶ）の入力の
中でも絵文字出力用の命令を使用できる。例えば、`\section` の引数の中で
`\coloremoji` を含めた場合、版面の上では絵文字（の画像）として出力され、
PDF のしおりの中では文字として表示される。

ただし「PDF 文字列中の Unicode 文字が正しく処理される」状態が担保されて
いることが前提となる。具体的には、次の何れかが満たされる必要がある。

※TeX Live 2022 以降を前提とすると、要するに「(u)pLaTeX では pxjahyper
の併用が必要、それ以外は何も要らない」ということである。

  - hyperref の“PDF エンコーディング”が Unicode である。

    最近（7.00g 版以降）の hyperref では既定でそうなっている。それより
    古い版では hyperref の読込時に `unicode` オプションを付ける必要が
    ある。(u)pLaTeX では pxjahyper パッケージを併用する必要がある。

        \usepackage[unicode]{hyperref}

  - （hyperref の“PDF エンコーディング”が Unicode ではないが）  
    エンジンが upLaTeX であり、pxjahyper パッケージを併用している。

    ※pLaTeX ではそもそも PDF 文字列中に JIS 外の文字を含ませることが
    できないため、この場合は対応ができない。

### カスタムファミリ

bxcoloremoji では実際の絵文字の表示に twemoji の画像を使っているが、その
代わりに、ユーザが用意した一連の画像ファイル群を「カスタムファミリ」と
して登録して表示に使うことができる。

例として、[noto-emoji レポジトリ]の中（`png/128/` 以下）に含まれる一連の
PNG画像を `notoemoji` ファミリとして登録する手順を示す。

[noto-emoji レポジトリ]: https://github.com/googlefonts/noto-emoji

#### 手順①：設定ファイルを作成する

カスタムファミリ設定ファイルの名前は `bxcoloremoji-<ファミリ名>.cfg`
である。今の例では `bxcoloremoji-notoemoji.cfg` を作成して TeX から
見える位置に配置することになる。設定ファイルの書式は以下の通りである。

    % prefix: 画像ファイルのパス名接頭辞
    prefix = notoemoji/notoemoji-
    % extension: 画像ファイルの拡張子
    extension = png
    % bbox = dvipdfmx 用の bounding box の値
    bbox = 0 0 128 128

`bbox` は dvipdfmx での画像の読込を高速化するための指定であり、省略する
こともできる。全ての画像ファイルの bounding box が一致しているのではない
場合は省略するしかない。

※`bbox` が使われるかは実際には `bbparam` パッケージオプションの指定に
より決められる。

`prefix` は画像ファイルの（Kpathsea 上の）パス名を決定するのに使われる。
上の設定の場合、例えば、U+2603 ☃ `:snowman2:` の画像ファイルのパス名は
`notoemoji/notoemoji-2603.png` となる。

#### 手順②：画像ファイルを改名して配置する

パス名の命名規則は以下の通りである。

  * 絵文字を構成する Unicode 文字(※)の符号値の 16 進表記（0 埋め無し、
    大文字）を順に `-` でつないだものを「符号値列」とする。  
    ※ただし EVS（U+FE0F）は除外される。例えば、2️⃣ 〈0023 FE0F 20E3〉
    に対する「符号値列」は `23-20E3` となる。
  * `<prefixの値><符号値列>.<extensionの値>` がパス名である。

noto-emojiの各々の画像ファイルをこの規則に従って配置する。例えば、
U+2603 ☃ の画像ファイル（元の名前は `emoji_u2603.png`）について、
`notoemoji/notoemoji-2603.png` のパス名で読める位置(※)に配置する。

※例えば、`$TEXINPUTS` に `~/texmf/tex/latex//` が含まれる場合、  
`~/texmf/tex/latex/custom_images/notoemoji/notoemoji-2603.png`  
に置くことができる。


更新履歴
--------

  * Version 0.17  〈2024/07/28〉
      - `\coloremojikeycap(of)` 命令を追加。
      - フォールバック動作の改善。
      - バグ修正。
  * Version 0.16b 〈2024/07/20〉
      - バグ修正。
      - フォールバック動作の改善。
  * Version 0.16a 〈2024/07/14〉
      - バグ修正。
  * Version 0.16  〈2024/07/13〉
      - 独自短縮名を追加。
      - expl3 が使える場合に binhex パッケージを使わない。
      - バグ修正。
  * Version 0.15b 〈2024/07/07〉
      - バグ修正。
  * Version 0.15a 〈2022/04/20〉
      - utf8 入力エンコーディングの将来の改新に対処した。
  * Version 0.15 〈2022/04/12〉
      - `nodvidriver`、`bbparam`、`preload-names`、`jatype` を追加。
      - `\coloremojisetup` 命令を追加。
      - 絵文字出力命令にパラメタ設定のオプション引数を追加。
      - グローバルなドライバオプションの指定がある場合は graphicx を
        自動的に読み込む。
      - 短縮名データの読込の仕様を変更。
  * Version 0.14 〈2022/04/08〉
      - twemoji の画像を最新版に更新。Emoji 14.0 に対応。
      - `size` および `size*` オプションを追加。
      - 非推奨のオプションに対して警告を出す。
  * Version 0.13 〈2021/09/18〉
      - Unicode Emoji 14.0 に対応した。
      - twemoji の画像を最新版に更新。※ただし twemoji は Emoji 14.0
        には対応していない。
  * Version 0.12 〈2021/01/27〉
      - カスタムファミリの機能を追加。
      - [coloremoji パッケージ]との互換のための機能を非推奨とする。
        （`twitter`、`hires`、`lowres`、`basedir` のオプション。）
  * Version 0.11 〈2020/06/21〉
      - `\coloremojiucs` で PDF 文字列中の短縮名をサポート。
      - 独自短縮名を追加。
  * Version 0.10 〈2020/06/14〉
      - Unicode Emoji 13.0 に対応した。
  * Version 0.9b 〈2020/04/29〉
      - バグ修正。
  * Version 0.9a 〈2019/12/09〉
      - utf8 入力エンコーディングの改新に対処した。
  * Version 0.9  〈2019/09/09〉
      - Unicode Emoji 12.0 に対応した。
  * Version 0.8c 〈2019/09/01〉
      - 単独の skin tone modifier を有効な絵文字とみなす。
  * Version 0.8b 〈2019/03/12〉
      - ZWJ sequence のフォールバック時の ZWJ を線で表す。
  * Version 0.8a 〈2019/03/09〉
      - バグ修正。
  * Version 0.8  〈2019/03/09〉
      - `\coloremojiucs` において短縮名での入力をサポートした。
  * Version 0.7  〈2019/01/02〉
      - upLaTeX で文字を“欧文扱い”（kcatcode を 15 に設定）にして
        いる場合に対応した。
  * Version 0.6  〈2018/06/10〉
      - Unicode Emoji 11.0 に対応した。
  * Version 0.5  〈2017/06/26〉
      - Unicode Emoji 5.0 に対応した。
      - Emoji tag sequences に対応した。
  * Version 0.4  〈2017/05/19〉
      - pifont パッケージ類似の命令群を追加。
  * Version 0.3c 〈2017/05/07〉
      - PDF 出力時は graphicx を自動で読み込む。
      - バグ修正。
  * Version 0.3b 〈2016/05/22〉
      - PDF 文字列中での入力に対応させた。
      - `\coloremoji(ucs)` 命令を頑強にした。
  * Version 0.3a 〈2016/05/04〉
      - (u)pLaTeX および LuaTeX-ja の縦組みモードに対応。
      - CJK パッケージの CJK 環境中でも正しく動作させる。
      - バグ修正。
  * Version 0.3  〈2016/05/03〉
      - ZWJ 列をサポートするために文字列パーザを書き直した。
  * Version 0.2  〈2016/04/30〉
      - 画像ファミリ `twemoji-pdf`，`twemoji-png` をサポート。
  * Version 0.1  〈2015/09/22〉
      - 最初の公開版。

[coloremoji パッケージ]: https://github.com/doraTeX/coloremoji

--------------------
Takayuki YATO (aka. "ZR")  
https://github.com/zr-tex8r
