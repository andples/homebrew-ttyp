class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "1.4.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.4.0/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "296c05d6e40df55f3b3090fd5eb888a6f64a14aa623324abd736425ea279632e"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.4.0/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "fe236291913977fce037ec4f2cba183a4f4fad03bddd4bf010e5f440d1faf5be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.4.0/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3a5be8317f8650bac268c8a1f172aa280143ede04d335a534343d1d35358ee3f"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.4.0/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c437d67be4a0a9eabf22f6e702306a5a298c9ec98444d590f29d5da84400976f"
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
