@echo off

if not exist dist mkdir dist
call html-minifier --minify-css --collapse-whitespace index.html -o dist/index.html
call uglifyjs jg.js -m toplevel -c -o dist/jg.js

if exist dist\jg.zip del dist\jg.zip
zip -Xjq9 dist\jg.zip dist\index.html dist\jg.js

CALL :FileSize dist/jg.zip FileSize
echo Final size: %FileSize% bytes

goto :EOF


:FileSize
SET %~2=%~z1
