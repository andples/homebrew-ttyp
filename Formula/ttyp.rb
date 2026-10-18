class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.8.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.8.0/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "4100f05ee3eded4c6bdc25cd1082fe44a9a98ad3f2b07dae3437b509844dcdee"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.8.0/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "d5eef295be89ce83bb41bd95e2daf2d1f857b62aac96719e7c90487d4706948a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.8.0/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fd06f20d67083d9c248a0a2808c3fb913993b4355150a418f82402901827e5e7"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.8.0/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9252bd15eccd0973e68a6a526ca0d352e2a795211038f3466d33ee2b48218639"
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
