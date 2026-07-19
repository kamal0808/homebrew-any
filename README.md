# any — standalone binary releases

Prebuilt binaries for [`any`](https://github.com/kamal0808/anytoany) (the
anytoany messaging CLI) — no Node.js required.

## Install (macOS)

```bash
curl -fsSL https://raw.githubusercontent.com/kamal0808/homebrew-any/main/install.sh | bash
any setup
```

This downloads the right binary for your Mac (Apple Silicon or Intel), installs
it to `~/.local/bin`, and `any setup` registers you a handle and sets up a
background notifier.

*(A Homebrew tap was attempted here but Homebrew requires up-to-date Xcode
Command Line Tools for any third-party/unbottled tap formula, even one that
just places a prebuilt binary — so a plain installer script is used instead.)*
