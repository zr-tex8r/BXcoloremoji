BXcoloremoji Package Bundle
===========================

LaTeX: To use color emojis more conveniently

Overview
--------


The bxcoloremoji package lets users output color emojis in LaTeX
documents. Compared to other packages with similar functionality, this
package has the following merits:

  * It supports all major LaTeX engines.
  * Emojis can be entered as the characters themselves, as their Unicode
    code values, or as their short names.
  * It works reasonably well in PDF strings when using hyperref.
  * Emojis can be handled properly even in Japanese typesetting
    environments.

This package has been widely used among the Japanese LaTeX community,
but there are already many emoji packages on CTAN and TeX Live. To
avoid uploading a large amount of emoji image data that are essentially
identical, the package was revised in version 1.0 so that the image
output was delegated to the [twmojis package]. Therefore, this package
now contains no image data.

### System Requirements

  * TeX format: LaTeX.
  * TeX engine: Anything that supports the e-TeX extension.
  * DVI-ware (in DVI output): dvipdfmx.
  * Dependent packages:
      - etoolbox
      - binhex (if expl3 is not available)
      - bxghost (optionally)
      - twemojis

### Installation

  - `*.sty`/`*.def` → `$TEXMF/tex/latex/BXcoloremoji`

### License

This package is distributed under the MIT License.

the MIT License: (http://opensource.org/licenses/MIT)
Copyright 2017-2024 Takayuki YATO (aka. "ZR")


The bxcoloremoji package
------------------------

Please refer to the manual [bxcoloremoji-en.pdf] for detail.

[bxcoloremoji-en.pdf]: bxcoloremoji-en.pdf


Revision History
----------------

  * Version 1.0   〈2024/11/11〉
      - Change the defautl mode to “twemojis mode”.
      - The image files are no longer provided by this bundle itself.
  * Version 0.22  〈2024/09/16〉
  * Version 0.21  〈2024/08/24〉
  * Version 0.20a 〈2024/08/18〉
  * Version 0.20  〈2024/08/16〉
  * Version 0.19  〈2024/08/05〉
  * Version 0.18  〈2024/08/02〉
  * Version 0.17  〈2024/07/28〉
  * Version 0.16b 〈2024/07/20〉
  * Version 0.16a 〈2024/07/14〉
  * Version 0.16  〈2024/07/13〉
  * Version 0.15b 〈2024/07/07〉
  * Version 0.15a 〈2022/04/20〉
  * Version 0.15 〈2022/04/12〉
  * Version 0.14 〈2022/04/08〉
  * Version 0.13 〈2021/09/18〉
  * Version 0.12 〈2021/01/27〉
  * Version 0.11 〈2020/06/21〉
  * Version 0.10 〈2020/06/14〉
  * Version 0.9b 〈2020/04/29〉
  * Version 0.9a 〈2019/12/09〉
  * Version 0.9  〈2019/09/09〉
  * Version 0.8c 〈2019/09/01〉
  * Version 0.8b 〈2019/03/12〉
  * Version 0.8a 〈2019/03/09〉
  * Version 0.8  〈2019/03/09〉
  * Version 0.7  〈2019/01/02〉
  * Version 0.6  〈2018/06/10〉
  * Version 0.5  〈2017/06/26〉
  * Version 0.4  〈2017/05/19〉
  * Version 0.3c 〈2017/05/07〉
  * Version 0.3b 〈2016/05/22〉
  * Version 0.3a 〈2016/05/04〉
  * Version 0.3  〈2016/05/03〉
  * Version 0.2  〈2016/04/30〉
  * Version 0.1  〈2015/09/22〉

[twemojis package]: https://ctan.org/pkg/twemojis

--------------------
Takayuki YATO (aka. "ZR")  
https://github.com/zr-tex8r
