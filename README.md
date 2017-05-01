# vision-shells

[![Build Status](https://travis-ci.org/vision-it/vision-shells.svg?branch=production)](https://travis-ci.org/vision-it/vision-shells)

## Usage

Include in the *Puppetfile*:

```
mod vision_apt:
    :git => 'https://github.com/vision-it/vision-zsh.git,
    :ref => 'production'
```

Include in a role/profile:

```puppet
    contain ::vision_shells::zsh
```
