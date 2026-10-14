class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.6.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.6.0/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "d09da869cb39f07dac236af2ade5462a7bf95cb566490a16cb495a449037e5cf"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.6.0/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "d083e66647cbabd5b4f1cd713a08c9bc35bbf983b67f4dd3f01d6d2f259a7c67"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.6.0/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "10bcd6eb69a1860fe21e587a328285259ceae01211d755afbda1c5c106467068"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.6.0/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f6b0d6c23f668f06787892c5d00e9bbe14c59b1396850ea87c41b2c8c84d1edb"
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
