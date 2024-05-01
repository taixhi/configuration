# Set up
## macOS
### Software
- Chrome
- Bitwarden
- [iTerm2](https://iterm2.com/)
- [VSCode](https://code.visualstudio.com/Download)
### Homebrew
Brew requires root user access. If you don't have root access, set up a Linux docker dev container.
An important dependency before Homebrew can work is the Command Line Developer Tools for Xcode. These include compilers that will allow you to build things from source. You can install them directly from the terminal with:
```
xcode-select --install
```
Once that is done, we can install Homebrew by copy-pasting the installation command from the Homebrew homepage inside the terminal:
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
### Install CLI apps
```
brew install [app]
```
Some apps:
- git
- tmux
- htop
### VSCode
