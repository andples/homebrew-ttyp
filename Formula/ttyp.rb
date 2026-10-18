class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.7.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.7.0/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "5baf04c1ac67a97bbaa167cdf3c03cbd118f198ed72d23425acfe25aae1b7c06"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.7.0/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "23bc83049b1b657ee8bba06a1ec7befefb90e9e57cbf6fa31f0d26a5f330407d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.7.0/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d01b59bbd41277c8c3182dd886ee2eb6332bd465f6672676e49134c0f00e5144"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.7.0/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0a79a8d71595444e5de4e995da9ada2b2a12f19acaef2919542534c1ff92ea1b"
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
