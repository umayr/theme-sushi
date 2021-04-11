<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
  <img width=90px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>
<br>

> 🍣 Sushi theme for [Oh My Fish][omf-link].

## Install

```bash
$ omf install sushi
# or
$ fisher umayr/sushi
```

## Features

* Minimal Prompt.
* Git Support.
* Displays `^` when there are stashed changes.
* Displays `*` when there are any changes to files already being tracked in the repo.
* Displays current branch name.
* Branch name color changes when there are staged changes.
* Displays selected or default terraform workspace.
* Displays number of commits current branch is ahead/behind in each remote.
* By default it shows only the name of the current directory but it provides a flag `theme_complete_path` to display abbreviated current working directory instead.
* Displays Time.
* Support for Terraform
* Support for Kubernetes
* Asynchronous prompts

## Use asynchronous prompts
This theme supports (optional) async prompts using [`acomagu/fish-async-prompt`](https://github.com/acomagu/fish-async-prompt) plugin, which gives you access to terminal without waiting for theme to completely render.

To install the plugin,
```bash
$ omf install https://github.com/acomagu/fish-async-prompt
# or
$ fisher acomagu/fish-async-prompt
```

## Screenshot

![Screenshot for Sushi Theme](https://camo.githubusercontent.com/98de9526e48e3ad03e761893c539891563e41276/68747470733a2f2f6769746875622d636c6f75642e73332e616d617a6f6e6177732e636f6d2f6173736574732f333037313934382f31303536353038362f66383463326432632d373565312d313165352d383234382d3364386262623965636565392e706e67)

![Screenshot of Sushi Theme with Terraform Workspaces](https://user-images.githubusercontent.com/7011993/43540375-907eeca8-9595-11e8-8af9-92183a3ad997.png)

![Screenshot of Sushi Theme with Kubernetes](https://user-images.githubusercontent.com/1866448/56770256-c09f8f00-67b3-11e9-9bcf-d654243e881c.png)

![Screenshot of Sushi Theme with SSH](https://user-images.githubusercontent.com/14050128/64432134-54278b80-d0d5-11e9-93f0-f3ef451af906.png)

## License

[MIT][mit] © [Umayr Shahid][author] et [al][contributors]


[mit]:            http://opensource.org/licenses/MIT
[author]:         http://github.com/umayr
[contributors]:   https://github.com/umayr/sushi/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
