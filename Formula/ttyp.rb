class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "1.3.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.3.0/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "ca8cf3d8b786b41c723be6e3203be8d6df72967a8a05520b4c6205a4f668ff89"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.3.0/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "b6d7e8e39a918d47a22f38c33b62d3c7775ef8e89ffc9708e16874ff60f48f03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.3.0/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9b1d4ca3af893e8a601e6229b31cef0f1119b5e589b15f60d0c33d7d1d14a469"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.3.0/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "56b71129e7dbd9d7c46f013ec267095975333735711cfcdd9395d66e90a6221a"
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
