dotfiles
========

These are my dotfiles that I use between machines and environments.

Run ./dotfiles/makesymlinks.sh after cloning.
This will move old dotfiles into ./dotfiles_old and make soft links from ./dotfiles into the dotfiles repo.

Some operating systems have specific startup scripts to install dependencies, e.g. `ubuntu-desktop.sh` and `ubuntu-wsl.sh`.

OS X
----
Apps:

1. Rectangle -- window management keyboard shortcuts

New Linux User
--------------

Assuming you have a root user configured

```bash
adduser --disabled-password --gecos "" josh
cp -r .ssh /home/josh/
cd /home/josh/.ssh
chown -R josh:josh .
chmod -R 700 .
# visudo and add `josh ALL=(ALL) NOPASSWD:ALL`
```
