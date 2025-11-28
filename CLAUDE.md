# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Vim/Neovim configuration repository that uses Vundle for plugin management. The configuration supports text editing, markdown authoring, and software development across multiple languages (Ruby, JavaScript, TypeScript, Go, Python).

## Architecture

The configuration is split into modular files:
- `vimrc` - Main configuration file with editor settings, autocmds, and plugin configuration
- `bundles.vim` - Vundle plugin definitions and initialization
- `config/` - Contains configuration for related tools (Git)
- `tmux.conf` - Tmux configuration (managed alongside Vim config)

The setup creates symlinks from this repository to:
- `~/.vimrc` and `~/.gvimrc`
- `~/.config/nvim/init.vim` (Neovim uses the same vimrc)
- `~/.tmux.conf`
- `~/.config/git/` (git configuration files)

## Common Commands

### Initial Setup
```bash
# Install dependencies
brew install neovim tmux
brew install --cask font-jetbrains-mono ghostty

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install configuration via bootstrap script
curl -Lo- http://bit.ly/vim_config | bash
```

### Updating Configuration
```bash
cd ~/.vim && rake
```
This pulls the latest changes and updates submodules.

### Plugin Management
```bash
# Install/update plugins after modifying bundles.vim
vim -u ~/.vim/bundles.vim +BundleInstall +q
vim -u ~/.vim/bundles.vim +BundleUpdate +q
```

## Key Configuration Details

### Python Support
- Uses pyenv for Python support: `g:python3_host_prog = '~/.pyenv/versions/neovim/bin/python'`
- Ensure neovim Python environment is set up in pyenv

### Text Editing Mode
- Markdown files automatically open in Goyo (distraction-free mode) with Limelight
- Spell checking enabled for text/markdown/mail/gitcommit files (English and German)
- Text files use word-wrap at line boundaries

### Code Quality Tools
- ALE for linting and auto-fixing (Ruby with rubocop, JavaScript with biome)
- Syntastic for JavaScript (using standard linter)
- Auto-fix on save enabled

### Testing
Key mappings for vim-test plugin:
- `<leader>t` - Run nearest test
- `<leader>T` - Run current test file
- `<leader>a` - Run full test suite
- `<leader>l` - Run last test
- `<leader>g` - Visit test file

### File Navigation
- CtrlP uses git for file listing (respects .gitignore)
- `<C-l>` - Open buffer listing
- Silver Searcher (ag) configured for grep operations

### Hard Mode
- Vim Hard Mode enabled by default ("wannabe" level)
- Toggle with `<leader>h`

### AI Integration
- Currently configured to use Windsurf.vim (Exafunction/windsurf.vim)
- GitHub Copilot plugin commented out in bundles.vim

## Modifying Configuration

When editing configuration files:
- Plugin definitions go in `bundles.vim`
- Plugin-specific settings and general Vim config go in `vimrc`
- Local overrides can be placed in `~/.vimrc.local` (sourced at end of vimrc if exists)
- After adding new plugins, run `vim -u ~/.vim/bundles.vim +BundleInstall +q`
