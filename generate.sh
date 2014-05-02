#!/bin/sh
set -e

mkdir -p Icons

generate () {
    sed "s/LINE1/$1/;s/SUBLINE2/$2/" t-gold.svg > Icons/valid-$3-v.svg
    sed "s/LINE1/$1/;s/SUBLINE2/$2/" t-blue.svg > Icons/valid-$3-blue-v.svg
}

generate HTML 2.0 html20
generate HTML 3.2 html32
generate HTML 4.0 html40
generate HTML 4.01 html401

generate XHTML 1.0 xhtml10
generate XHTML 1.1 xhtml11
generate XHTML 'BASIC 1.0' xhtmlbasic10
generate XHTML 'PRINT 1.0' xhtmlprint10

generate CSS '' css
generate CSS 'LEVEL 1' css1
generate CSS 'LEVEL 2' css2

generate SVG '1.0' svg10
generate SVG '1.1' svg11
generate SVG 'TINY 1.1' svgtiny11
generate SVG 'TINY 1.2' svgtiny12

generate XML '1.0' xml10
generate XML '1.1' xml10

/bin/ls Icons/*.svg | sed 's/-v\.svg//' | xargs -L1 -I{} convert {}-v.svg {}.png
/bin/ls Icons/*.svg | sed 's/-v\.svg//' | xargs -L1 -I{} convert {}-v.svg {}.gif
/bin/ls Icons/*.svg | sed 's/-v\.svg//' | xargs -L1 -I{} convert {}-v.svg {}-v.eps
