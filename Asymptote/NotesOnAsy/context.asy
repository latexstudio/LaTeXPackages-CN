settings.tex="context";
texpreamble("
\usemodule[simplefonts]
\setupsimplefonts

\setmainfont[TeXGyrePagella]
\setsansfont[TeXGyreHeros]
\setmonofont[TeXGyreCursor]

\setcjkmainfont
        [AdobeSongStd]
        [regularfont={* Light},
         italicfont={AdobeKaitiStd Regular},
         boldfont={AdobeHeitiStd Regular},
         bolditalicfont={AdobeHeitiStd Regular}]
\setcjksansfont
        [AdobeKaitiStd]
        [boldfont={AdobeHeitiStd Regular},
         bolditalicfont={AdobeHeitiStd Regular}]
\setcjkmonofont
        [AdobeFangsongStd]
        [boldfont={AdobeHeitiStd Regular},
         bolditalicfont={AdobeHeitiStd Regular}]
");

defaultpen(font("simplefonts"));
