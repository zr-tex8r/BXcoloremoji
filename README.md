BXcoloremoji パッケージバンドル
===============================

LaTeX： カラー絵文字を出力する

### 前提環境

  * フォーマット： LaTeX
  * エンジン： e-TeX 拡張をサポートするもの
  * DVI ウェア（DVI 出力時）： dvipdfmx
  * 依存パッケージ：
      - etoolbox
      - binhex

### インストール

  - `*.sty`/`*.def` → `$TEXMF/tex/latex/BXcoloremoji`
  - `emoji_images` のディレクトリをそのまま
    `$TEXMF/tex/latex/BXcoloremoji` の下に移動する。

### ライセンス

画像データについては以下が適用される：

Graphics work is licenced under:

CC-BY 4.0: (https://creativecommons.org/licenses/by/4.0/)
Copyright 2019 Twitter, Inc and other contributors

その他の著作物にはは以下が適用される：

Other work is licensed under:

the MIT License: (http://opensource.org/licenses/MIT)
Copyright 2017-2021 Takayuki YATO (aka. "ZR")

bxcoloremoji パッケージ
-----------------------

### パッケージ読込

DVI 出力のエンジンの場合、事前に graphicx パッケージを読みこむ必要が
ある。（PDF 出力の場合は自動的に読み込まれる。）

    \usepackage[dvipdfmx]{graphicx} % dvipdfmx の場合

また，昔の（2018-04-01 以前の）(pdf)LaTeX および pLaTeX の場合は，utf8
入力エンコーディングを有効化する必要がある。

    \usepackage[utf8]{inputenc}

その後に bxcoloremoji パッケージを読みこむ。

    \usepackage[<オプション>]{bxcoloremoji}

利用可能なオプションは以下の通り。

  * 絵文字画像の種類を指定するオプション。（既定値 = `twemoji-pdf`）
      - `twemoji-pdf`： twemoji の SVG 画像から変換した PDF 画像。
      - `twemoji-png`： twemoji の 72 ピクセルの PNG 画像。
      - `family=<名前>`： カスタムファミリ指定（後述）。
  * `scale=<実数>`： 絵文字のサイズを標準値に対する倍率で指定する。
    （既定値 = 1）  
    ※標準のサイズは (u)pLaTeX では 1zw，LuaLaTeX + LuaTeX-ja では
    1`\zw`、それ以外は 1em。

### 使い方

  * `\coloremoji[*]{<文字列>}`： 引数の文字列をカラー絵文字として出力
    する。ただし，対象の画像がないなどの理由で絵文字として出力できない
    場合は，通常のテキスト出力にフォールバックする。
      - (u)pLaTeX および LuaLaTeX + LuaTeX-ja では絵文字は和文扱いと
        なる。ただし，`*`付で実行した場合および数式中では非和文扱いと
        なる。
      - それ以外の環境では絵文字は常に非和文扱いで，`*`指定は無視する。
  * `\coloremojicode[*]{<符号値列>}`： 文字を「Unicode 符号値」または
     「JoyPixels の [emoji-toolkit] ライブラリで規定された短縮名」
    で入力してカラー絵文字を出力する。
    引数は、符号値で指定する場合はその16進表記、短縮名で指定する場合は
    `:短縮名:` の形式で入力し、複数文字を入力する場合は各文字の指定を
    を空白区切りで並べる。`*`指定の意味は `\coloremoji` と同じ。  
    例： `\coloremojicode{:sushi: 23 20E3 1F643 :snowman:}`
  * `\coloremojiucs[*]{<符号値列>}`： `\coloremojicode` の別名。  
    ※他の `coloremojicode～` の名前の命令・環境についても同様に
    `coloremojiucs～` という別名が用意されている。

[emoji-toolkit]: https://github.com/joypixels/emoji-toolkit

0.4 版以降では、pifont パッケージの機能（`\dingfill` 命令、`dinglist`
環境など）の絵文字版に相当する、以下の命令が提供される。

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
    !female     U+2640♀ (`+ !female` で女性の gender indicator)
    !male       U+2642♂ (`+ !male` で男性の gender indicator)
    !black      U+2B1B⬛（`+ !black` で黒色の color indicator）
    !white      U+2B1C⬜（`+ !white` で白色の color indicator）
    !red        U+1F7E5🟥（`+ !red` で赤色の color indicator）
    !blue       U+1F7E6🟦（`+ !blue` で青色の color indicator）
    !orange     U+1F7E7🟧（`+ !orange` で橙色の color indicator）
    !yellow     U+1F7E8🟨（`+ !yellow` で黄色の color indicator）
    !green      U+1F7E9🟩（`+ !green` で緑色の color indicator）
    !purple     U+1F7EA🟪（`+ !purple` で紫色の color indicator）
    !brown      U+1F7EB🟫（`+ !brown` で茶色の color indicator）
    !flag       U+1F3F4🏴 (旗を表す tag sequence の base 文字)
    !<          U+2B05⬅ (`+ !<` で左の direction indicator)
    !>          U+27A1➡ (`+ !>` で右の direction indicator)
    !A .. !Z    U+1F1E6..1F1FF (flag sequence の構成要素)
    @           U+E007F (tag sequence の終端)
    @0 .. @9    U+E0030..E0039 (tag sequence の構成要素)
    @a .. @z    U+E0061..E007A (tag sequence の構成要素)

使用例：

    \coloremojicode{man + woman + girl + girl}
    \coloremojicode{!flag @g @b @w @l @s @}
    \coloremojicode{1F647 + !male}

### PDF 文字列中での絵文字の利用

hyperref 使用時の文書情報文字列（“PDF 文字列”と呼ぶ）の入力の中でも
`\coloremoji` （および `\coloremojicode`）命令を使用できる。例えば、
`\section` の引数の中で `\coloremoji` を含めた場合、版面の上では絵文字
の画像として出力され、PDF のしおりの中では文字として表示される。

ただし「PDF 文字列中の Unicode 文字が正しく処理される」状態が担保されて
いることが前提となる。具体的には、次の設定が必要である。

  - (pdf)LaTeX、XeLaTeX、LuaLaTeX では hyperref パッケージに `unicode`
    オプションを付ける必要がある。

        \usepackage[unicode]{hyperref}

  - upLaTeX の場合、pxjahyper パッケージなどの、適切な“ToUnicode 変換”
    を行うパッケージを併用する必要がある。
      - 特に、`\coloremojicode` 命令の処理には pxjahyper パッケージ
        （そのもの）が必要である。

  - pLaTeX ではそもそも PDF 文字列中に JIS 外の文字を含ませることが
    できないため、`\coloremoji(code)` の PDF 文字列中での使用について
    も対応できない。

### カスタムファミリ

bxcoloremoji では実際の絵文字の表示にtwemojiの画像を使っているが、その
代わりに、ユーザが用意した一連の画像ファイル群を「カスタムファミリ」と
して登録して表示に使うことができる。

例えば、[noto-emoji レポジトリ]の中（`png/128/` 以下）に含まれる一連の
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
場合は省略するしかない。dvipdfmx 以外ではこの値は使われない。

`prefix` は画像ファイルの（Kpathsea 上の）パス名を決定するのに使われる。
上の設定の場合、例えば、U+2603 ☃ `:snowman2:` の画像ファイルのパス名は
`notoemoji/notoemoji-2603.png` となる。

#### 手順②：画像ファイルを改名して配置する

パス名の命名規則は以下の通りである。

  * 絵文字を構成する Unicode 文字※の符号値の 16 進表記（0 埋め無し、
    大文字）を順に `-` でつないだものを「符号値列」とする。  
    ※ただし EVS（U+FE0F）は除外される。例えば、2️⃣ 〈0023 FE0F 20E3〉
    に対する「符号値列」は `23-20E3` となる。
  * `<prefixの値><符号値列>.<extensionの値>` がパス名である。

noto-emojiの各々の画像ファイルをこの規則に従って配置する。例えば、
U+2603 ☃ の画像ファイル（元の名前は `emoji_u2603.png`）について、
`notoemoji/notoemoji-2603.png` のパス名で読める位置※に配置する。

※例えば、`$TEXINPUTS` に `~/texmf/tex/latex//` が含まれる場合、  
`~/texmf/tex/latex/custom_images/notoemoji/notoemoji-2603.png`  
に置くことができる。


更新履歴
--------

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
http://zrbabbler.sp.land.to/
