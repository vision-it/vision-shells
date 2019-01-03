# vision-shells

[![Build Status](https://travis-ci.org/vision-it/vision-shells.svg?branch=production)](https://travis-ci.org/vision-it/vision-shells)

## Usage

Include in the *Puppetfile*:

```
mod vision_shells:
    :git => 'https://github.com/vision-it/vision-shells.git,
    :ref => 'production'
```

Include in a role/profile:

```puppet
    contain ::vision_shells::zsh
    contain ::vision_shells::fish
```
