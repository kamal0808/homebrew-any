class Any < Formula
  desc "Message people from inside Claude Desktop (anytoany CLI)"
  homepage "https://github.com/kamal0808/anytoany"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/kamal0808/homebrew-any/releases/download/v0.4.0/any-darwin-arm64.tar.gz"
      sha256 "f027fea0a9e5910e1334209575dfc68cc82f5c78012450e899c33c600409f44f"

      def install
        bin.install "any-darwin-arm64" => "any"
      end
    end

    on_intel do
      url "https://github.com/kamal0808/homebrew-any/releases/download/v0.4.0/any-darwin-x64.tar.gz"
      sha256 "b8da85929aa9f490430150cdf71532ed9397e574a7fe1da2b0101e38c5cad4d9"

      def install
        bin.install "any-darwin-x64" => "any"
      end
    end
  end

  depends_on "terminal-notifier"

  def caveats
    <<~EOS
      Get started:
        any setup

      This registers a handle and installs a background watcher that pops a
      clickable notification when someone messages you.
    EOS
  end

  test do
    system "#{bin}/any", "help"
  end
end
