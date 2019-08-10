export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
export PKG_CONFIG_PATH="/usr/local/opt/openblas/lib/pkgconfig"
export TERM=xterm-color

export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/opt/texinfo/bin:$PATH"
export PATH=$PATH:/Library/TeX/texbin
export ANDROID_HOME='/Users/suzukiyusuke/Library/Android/sdk'
export JAVA_HOME='/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home'
export PATH=$PATH:/Users/suzukiyusuke/Library/Android/sdk/platform-tools/
export PATH=$PATH:/usr/local/bin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export LANG=ja_JP.UTF-8
