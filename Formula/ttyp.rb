class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "1.3.1"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.3.1/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "b75fffef68b0d9c228f56b13944701e237ea72736f263b6772d60f0ae8c56027"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.3.1/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "9b8978a1e1ea64bd0dcfe73ddc410749766ffc14beb6742b342c87d3033fd7ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.3.1/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d7933ad6d9df68ece03137cd686cbd9385fbef09369aec593868a2d0b6a86aa6"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.3.1/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d76d6df9de34bfe8fa6bd50c07749b68be484c77be6a4f8072840a7064a4ceec"
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
