class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "1.6.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.6.0/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "d3401bc7eda2cb29955bfc185ffdef85b086711be682a1cfe41975956bb8f9bf"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.6.0/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "a848123157fe4f00e251e15ffed2749299ba7d24512ab7d984165ecfb3e7d6c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.6.0/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fc26d5397a39607598cff599dc3d84f9ad990f086f9814d0a642d15977fd644f"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.6.0/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ccf89e0f846fc32e731fe7f460b804c3c18c740e6bfdd8eb4058a0424b967cb1"
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
