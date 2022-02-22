# homebrew-kops-old

Kops for the lazy, deprecated, cloud engineer.

Remember to only upgrade kubernetes clusters one minor version at a time!

```shell
$ brew install pboling/kops-old/kops@1.21
# or ...
# brew install pboling/kops-old/kops@1.20
# brew install pboling/kops-old/kops@1.19
# brew install pboling/kops-old/kops@1.18
# brew install pboling/kops-old/kops@1.17
# brew install pboling/kops-old/kops@1.16
# brew install pboling/kops-old/kops@1.15
```

Then add it to your path (because it is keg only):
```shell
$ echo 'export PATH="/usr/local/opt/kops@1.21/bin:$PATH"' >> ~/.zshrc
```

Open a new shell and make sure you have it!
```shell
$ kops version
Version 1.21.2
```
