# aprudkin Homebrew tap

Homebrew formulae maintained by Alexey Prudkin.

## Install sshai

Install [`sshai`](https://github.com/aprudkin/sshai) and its bundled Agent Skills-compatible skill:

```bash
brew install aprudkin/tap/sshai
```

The formula installs the skill under the package share directory. Pi users can enable it explicitly:

```bash
pi install "$(brew --prefix sshai)/share/sshai"
```

Other compatible agent harnesses can load `skills/sshai/SKILL.md` from the directory reported by
`brew --prefix sshai`.

## Update

```bash
brew update
brew upgrade sshai
```

## Contributing

Report formula issues in the
[`aprudkin/homebrew-tap` issue tracker](https://github.com/aprudkin/homebrew-tap/issues).
