class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.6.1"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.6.1/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "5b4f485303392235d03863b968128bb3c8c3bf5cdd28cfafbf6f853b88c7ce93"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.6.1/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "27836acc7bcdd2b924705ee2b159d450f87a05241691173a708f4e3dca039032"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.6.1/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0e3979ef843f89fa75b602c301d40859352ce11a7d184102ef885fb9b6eeadb4"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.6.1/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b9ffce39d0e1a444fd64a32b6b25edae939d8757c09603744644cc43af1971ad"
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
