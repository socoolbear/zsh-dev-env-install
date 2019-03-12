#!/bin/zsh

# *****  pre-required 
# intall zsh 
# sudo yum install zsh -y
# chsh -s $(which zsh)
# zsh

# **** MUST run on zsh

# install autojump
echo '===> install autojump'
git clone git://github.com/wting/autojump.git
cd ~/autojump
./install.py 
cd ~
rm -fr ~/autojump

# install oh-my-zsh
echo '===> install oh-my-zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install plugin
echo '===> install oh-my-zsh plugins'
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# add plugin to .zshrc
echo '===> add on-my-zsh plugins config'
cp ~/.zshrc ~/.zshrc.bak
sed -i -e "s/plugins=(git)/plugins=\(\n    git \n    zsh-completions    \n    zsh-autosuggestions \n    zsh-syntax-highlighting \n\)/g" .zshrc

cat <<EOF >> .zshrc
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
EOF

# add zsh my theme
echo '===> create mytheme.zsh-theme'

cat <<EOF > ~/.oh-my-zsh/themes/mytheme.zsh-theme
local ret_status="%(?:%{\$fg_bold[green]%}➜ :%{\$fg_bold[red]%}➜ )"
PROMPT='%{\$fg_bold[white]%}%n@%M %{\$fg_bold[red]%}➜ %{\$fg_bold[green]%}%p %{\$fg[cyan]%}%c %{\$fg_bold[blue]%}\$(git_prompt_info)%{\$fg_bold[blue]%} % %{\$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{\$fg_bold[blue]%}git:(%{\$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{\$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{\$fg[blue]%}) %{\$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{\$fg[blue]%})"
EOF

sed -i -e 's/robbyrussell/mytheme/g' .zshrc

# add vimrc
echo '===> add vimrc'

cat <<EOF > .vimrc
set nocompatible              " be iMproved, required

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

syn on
set incsearch
set ignorecase smartcase
set hlsearch
set encoding=utf-8

au Bufenter *.\(c\|cpp\|h\|php\) set et
au Bufenter *.\(html\|js\|css\) set et
au Bufenter *.\(html\|js\|css\) set shiftwidth=2
au Bufenter *.\(html\|js\|css\) set tabstop=2
EOF

# final 
echo '=====>> Zsh Env Install Complete.'
echo 'Do it.'
echo 'source ~/.zshrc' 
