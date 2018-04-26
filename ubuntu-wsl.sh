DIR="$(cd "$(dirname "$0")" && pwd)"

$DIR/ubuntu-base.sh

$DIR/makesymlinks.sh --ubuntu-wsl

$DIR/install-vim-plugins.sh
