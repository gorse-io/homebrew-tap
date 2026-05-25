# Gorse Homebrew Tap

Homebrew formulae for Gorse projects.

## Install gorse-cli

Add the Gorse tap and install `gorse-cli`:

```bash
brew tap gorse-io/tap
brew install gorse-cli
```

Verify the installation:

```bash
gorse-cli --version
```

You can also install `gorse-cli` in one command without adding the tap first:

```bash
brew install gorse-io/tap/gorse-cli
```

## Upgrade gorse-cli

```bash
brew update
brew upgrade gorse-cli
```

## Uninstall gorse-cli

Remove the formula:

```bash
brew uninstall gorse-cli
```

If you no longer need any formulae from this tap, remove the tap as well:

```bash
brew untap gorse-io/tap
```
