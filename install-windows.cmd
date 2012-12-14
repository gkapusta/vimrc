@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set BASE_DIR=%HOME%\.vim
call git clone git://github.com/gkapusta/vimrc.git "%BASE_DIR%"
call mkdir "%BASE_DIR%\bundle"
call mklink "%HOME%\_vimrc" "%BASE_DIR%\.vimrc"

call git clone http://github.com/gmarik/vundle.git "%BASE_DIR%/bundle/vundle"
call vim -u "%BASE_DIR%/.vimrc.bundles" +BundleInstall! +BundleClean +qall

