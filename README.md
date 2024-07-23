# Dotfiles

My configuration files.

## Setup 

* Clone dotfiles repo.
```
git clone [repo-url] ~/.dotfiles 
cd ~/.dotfiles
```
* Bootstrap everything into place.
```
sh ./bootstrap.sh
```

### Secrets 

Will be handdled in docs repo: management of passwords.

* Use KeepassXC database inside Dropbox.* If using Linux, use keepass and install Chrome extension.

* If using macOS, export to Safari and use iCloud Keychain.
* Periodically merge safari DB with KeepassXC.

## GPG 

Will be handled in docs folder. creation, exporting, storage.

### Git 

* Use subkeys (that can be revoked) and a single master key
[](https://dotmethod.me/posts/pass-password-manager-share-gpg-key/)


### TODO
* Improve `docs` repository and integrate this repo with that one.
* Improve `.zshrc`, `.bashrc`, `.bash_profile`: reduce clutter and unnecessary sections.
* Migrate GPG and Secrets management to `docs`. 
* Add `macchina` support and themes.
* Improve `zsh` theme and color integration with `macchina`.
* Add `pipx` support and `jrnl`.
