class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.0.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.0.0/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "59ac840791305b408f623e0fd8fca96f88761c9d9bf35f10804291f0d8b915a6"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.0.0/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "b04e4417d1bde00e1709582dd247af9e43bb6e08414b267eb9dafc7014d551a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.0.0/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0a81e6b215dc6e76e740b999d9c0b81871c11075174f35965db0db2c97978a06"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.0.0/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b1b261ce38442d73aaad3e67cf8a328af43bda6d26b823842eae96727213f1e3"
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
