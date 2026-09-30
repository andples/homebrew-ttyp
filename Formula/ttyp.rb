class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "1.4.1"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.4.1/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "8519332a318cc6fd601505e83ee0e894125722d1ff42c3f8d85ad38f1868fa3b"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.4.1/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "8b0d90ebd23e050d435bbc2d53af5c41979f114d7bb2180b4ca6f7bbf7376823"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.4.1/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6bf442be8ca5b5672de63d0107dc52b871fddce26c344590c2c1bcec655d9883"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.4.1/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "591a207aae24a7a0d8460a9f1426dee75310d87881f04514b7387bdbe8970dbd"
    end
  end

  head do
    url "https://github.com/andples/tui-type.git", branch: "main"
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "ttyp"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ttyp --version")
  end
end
