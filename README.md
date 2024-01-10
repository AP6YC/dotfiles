# dotfiles

Personal dotfiles for terminal development and deployment.

## Table of Contents

- [dotfiles](#dotfiles)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Notes](#notes)
  - [References](#references)

## Installation

- apt:
  - git zsh tmux
- onmyzsh:

    ```sh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

- Chezmoi:

    ```sh
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply AP6YC
    ```

- Julia:

    ```sh
    curl -fsSL https://install.julialang.org | sh
    ```

- Mamba:

    ```sh
    wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
    ```

- Ranger:

    ```sh
    git clone git@github.com:ranger/ranger.git

    ```

## Notes

[ranger]: https://github.com/ranger/ranger

- Ranger: [ranger][ranger]

## References

[tpm]: https://github.com/tmux-plugins/tpm
[ohmyzsh]: https://github.com/ohmyzsh/ohmyzsh
[zshauto]: https://github.com/zsh-users/zsh-autosuggestions
[zshsyntax]: https://github.com/zsh-users/zsh-syntax-highlighting

- [TPM][tpm]
- [Oh My Zsh][ohmyzsh]:
  - [Zsh Authosuggesions][zshauto]
  - [Zsh syntax highlighting][zshsyntax]

Deprecated:

- Tmux theme: https://github.com/gpakosz/.tmux
- Dotfiles:
  - https://github.com/nicknisi/dotfiles
