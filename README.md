# Configuration

Dotfiles for shell, editor, and terminal multiplexer setup.

## Quick Setup

```bash
git clone git@github.com:taixhi/configuration.git ~/configuration

# Copy dotfiles to home directory
cp ~/configuration/.bashrc ~/.bashrc
cp ~/configuration/.zshrc ~/.zshrc
cp ~/configuration/.tmux.conf ~/.tmux.conf
cp ~/configuration/.vimrc ~/.vimrc
```

## Secrets

API keys and tokens are stored in `~/.secrets`, which is **not tracked by git**.

To set up secrets, create `~/.secrets` and add your exports:

```bash
touch ~/.secrets
chmod 600 ~/.secrets
```

Both `.bashrc` and `.zshrc` will source `~/.secrets` automatically if it exists.

## What's Included

| File | Description |
|------|-------------|
| `.bashrc` | Bash config with Ubuntu defaults, git aliases, project-specific helpers |
| `.zshrc` | Zsh config with modern CLI tool integrations (eza, bat, fd, fzf, zoxide, starship) |
| `.tmux.conf` | Tmux with vim keybindings, C-a prefix, tpm plugin manager |
| `.vimrc` | Vim with syntax highlighting, relative line numbers, Go support |

## Dependencies

The zsh config expects these CLI tools to be installed:

- [eza](https://github.com/eza-community/eza) - modern `ls`
- [bat](https://github.com/sharkdp/bat) - modern `cat`
- [fd](https://github.com/sharkdp/fd) - modern `find`
- [fzf](https://github.com/junegunn/fzf) - fuzzy finder
- [zoxide](https://github.com/ajeetdsouza/zoxide) - smarter `cd`
- [starship](https://starship.rs/) - cross-shell prompt

Install all on macOS:

```bash
brew install eza bat fd fzf zoxide starship
```

## Git Aliases

Both shells include:

- `gaa` - `git add .`
- `gcm` - `git commit -m`
- `gp` - `git push`
- `gpo` - push and set upstream to current branch
- `main` - checkout main and pull
- `gcb <name>` - create branch `taichi/<name>`
- `gc <name>` - checkout branch `taichi/<name>`
