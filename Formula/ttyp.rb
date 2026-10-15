class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.6.2"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.6.2/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "bd89edf01d5ba3d7b5cc71f9de464ab6bfd7ab5fe9681c3900e88cf8e25b316b"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.6.2/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "155ae919a796053665b74ec3b203c7b1163d408342f0debbb0320a77af3f88cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.6.2/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "19176b95da3a5d309be602ddfaea25faa5f8589065b5abba397a0708405367eb"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.6.2/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4d0450c24b2f85bacec812fde18e6d8c59c2a83e3c4ca64d547a23888139192f"
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
