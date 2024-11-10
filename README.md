BXcoloremoji パッケージバンドル
===============================

LaTeX： カラー絵文字を出力する

概要
----

bxcoloremoji パッケージは LaTeX 文書においてカラー絵文字を出力するため
のものである。他の類似の機能をもつパッケージと比較すると、本パッケージは
以下の特徴をもつ。

  * 全ての主要な LaTeX エンジンをサポートする。
  * 文字自体、Unicode 符号値、短縮名での入力が可能。
  * hyperref 使用時に PDF 文字列の中でも妥当に動作する。
  * 和文組版環境でも絵文字を適切に取り扱える。

絵文字の画像の出力について、昔の版では独自の画像ファイルを利用していたが、
諸般の理由により、1.0版からは最終的な画像出力を [twemojis パッケージ]に
移譲することを既定の動作とする。

※昔の画像データを使いたい場合は [bxcoloremoji-oldstd レポジトリ]にある
情報を参照してほしい。


### 前提環境

  * フォーマット： LaTeX
  * エンジン： e-TeX 拡張をサポートするもの
  * DVI ウェア（DVI 出力時）： 用いる画像形式に対応したもの
    ※既定設定では dvipdfmx が必要。
  * 依存パッケージ：
      - etoolbox
      - binhex（expl3 が有効でない場合）
      - bxghost（条件により）
      - twemojis

### インストール

  - `*.sty`/`*.def` → `$TEXMF/tex/latex/BXcoloremoji`

### ライセンス

本パッケージは MIT ライセンスの下で配布される。

the MIT License: (http://opensource.org/licenses/MIT)
Copyright 2017-2024 Takayuki YATO (aka. "ZR")


bxcoloremoji パッケージ
-----------------------

詳細についてはマニュアル [bxcoloremoji-ja.pdf] を参照されたい。

[bxcoloremoji-ja.pdf]: bxcoloremoji-ja.pdf


更新履歴v1
----------

  * Version 1.0   〈2024/11/11〉
      - 既定動作を“twemojis モード”に変更。
      - 画像ファイルを [bxcoloremoji-oldstd レポジトリ]に移動した。
  * Version 0.22  〈2024/09/16〉
      - `pua` オプションを追加。
  * Version 0.21  〈2024/08/24〉
      - color パッケージも自動的に読み込む。
  * Version 0.20a 〈2024/08/18〉
      - bxcoloremoji パッケージの解説を PDF 文書に移行した。
      - 不具合修正。
      - (試験的) `twemoji-pdf/png` オプションをカスタムファミリ指定の
        一種として処理する。
  * Version 0.20  〈2024/08/16〉
      - 短縮名を少し追加した。
      - 短縮名一覧のドキュメント bxcoloremoji-shortnames.pdf を追加。
  * Version 0.19  〈2024/08/05〉
      - 和文ゴースト処理のために [bxghost パッケージ]を利用する。
  * Version 0.18  〈2024/08/02〉
      - twemojis モード（`twemojis` オプション）のサポート。
      - `names` オプションを追加。
      - サンプルファイルの修正。
      - (試験的) `twemojis-skip-tikz` オプション。
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

[bxcoloremoji-oldstd レポジトリ]: https://github.com/zr-tex8r/BXcoloremoji-oldstd
[bxghost パッケージ]: https://ctan.org/pkg/bxghost
[coloremoji パッケージ]: https://github.com/doraTeX/coloremoji
[twemojis パッケージ]: https://ctan.org/pkg/twemojis

--------------------
Takayuki YATO (aka. "ZR")  
https://github.com/zr-tex8r
