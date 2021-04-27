
# Onetap Javascripts

[![Discord](https://discord.com/api/guilds/756989147163656273/widget.png)](https://discord.gg/FCnK6xp)

> The documentation and scripts have been moved to https://leodeveloper.pages.dev  
> The source code of the new website is located [here](https://github.com/Le0Developer/website).  
> There are inaccuracies with the documentation that have been fixed on the new website.

**This project is unmaintained, but will stay online!**

The documentation can be found [here](https://le0developer.github.io/onetap-js/en/master/).

This repository contains my scripts for the CS:GO cheat onetap and various utilities.
This mainly focuses on the crack.

[/docs](<docs>) includes an unofficial documentation about the javascript runtime.


## Building documentation

Required:

- [Python3](https://python.org)

Install dependencies with: *(in [/docs](<docs>))*
```bash
python3 -m pip install -r requirements.txt
```

Build with html documentation with:
```bash
make html
```


## Building scripts

Required:

- [Node.js](https://nodejs.org)

Install dependencies with:
```bash
npm install
```

Build with:
```bash
cake build
```

Add scripts by adding the path to [scripts.json](<scripts.json>).
