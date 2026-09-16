# homebrew-tap

Homebrew casks for my macOS apps. Install one directly:

```bash
brew install --cask shawonashraf/tap/<cask>
```

or tap once and install by name:

```bash
brew tap shawonashraf/tap
brew install --cask <cask>
```

## Casks

| Cask | App | Notes |
| --- | --- | --- |
| `slurmer` | [slurmer](https://github.com/shawonashraf/slurmer) — Slurm job queue viewer for HPC clusters, fetched over ssh | macOS 11+. Regenerated automatically by slurmer's release workflow; do not edit by hand. |
| `wardrobe` | [Wardrobe](https://github.com/rashomon-gh/Wardrobe) — privacy-first, local semantic screenshot organizer | |

## Unsigned apps

These apps are ad-hoc signed and not notarized, so macOS would normally
refuse to open them with an "app is damaged" dialog. Each cask removes the
quarantine attribute from the installed app after copying it, which is the
same as running `xattr -cr` on it yourself. Read the cask before installing
if that matters to you.

`brew upgrade --cask <cask>` moves to the latest release, `brew uninstall
--cask <cask>` removes the app, and `--zap` also deletes its settings.
