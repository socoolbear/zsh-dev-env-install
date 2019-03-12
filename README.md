# zsh-dev-env-install
- zsh 개발 환경 세팅 자동화 스크립트

# 구성 
- oh-my-zsh : https://ohmyz.sh/
- autojump : https://github.com/wting/autojump
- zsh-completions : https://github.com/zsh-users/zsh-completions
- autosuggestions : https://github.com/zsh-users/zsh-autosuggestions
- syntax highlighter : https://github.com/zsh-users/zsh-syntax-highlighting
- user@hostname 표시 되도록 theme 변경
  - https://gist.github.com/socoolbear/5abf3ae4c59bbccd4733f8632b03f491
- vimrc
  - https://gist.github.com/socoolbear/6b2d30aad6a2017e59a7d3971c98b382 

# Pre-required

```
sudo yum install zsh -y
chsh -s $(which zsh)
zsh
```

# Install
```
./init.sh
```

# Post-required
```
source ~/.zsh
```
