class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "1.2.1"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.2.1/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "4f53992455c0fb537dd092469066f24aab82bdc9b49cdf368aed37254f3d7b5e"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.2.1/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "fd79e0388419ac1a1d74f62e4ea1fd632bd195dfc89e9a42d858c506356ef52e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.2.1/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bf53ba9f0f02fa75e6d680d8eec5bbdf40f420ddbcfbc210e0834604faa0b1d5"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.2.1/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "db800b364a0a6d7d7f7597e6e6ece920e64f6fbc16b7b0867c654e50c71cb2ed"
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
