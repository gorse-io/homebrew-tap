# Gorse Homebrew Tap

Homebrew formulae for Gorse projects.

## Install clap

Install the prebuilt clap.cpp CLI:

```bash
brew install gorse-io/tap/clap
clap --help
```

Linux x86_64 and ARM64 use CPU-only release binaries. macOS ARM64 uses the
upstream macOS binary, which also includes Metal support; upstream does not
publish a separate CPU-only macOS binary.

```bash
clap embedding --model model.gguf --text 'A jazz quartet.'
```

Download a compatible GGUF model separately. Intel Macs are not supported by
the upstream release binaries.

To upgrade or uninstall:

```bash
brew update
brew upgrade clap
brew uninstall clap
```

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
