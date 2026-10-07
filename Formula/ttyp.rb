class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.3.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.3.0/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "33433274003627c4481c4494cdc66624df0a1104311f409faf54b8c6b54c3427"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.3.0/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "dfc5de4aae2e94af9f3dd9c4e723fe1fd55b475df6ff4a638039422dce56f2e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.3.0/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1ad4b5120dc262c9fa55dd034f260895693a16d264926b44bede47dcdfd480c7"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.3.0/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bda28525f44506d80ba408097a59c8e77cdd3ee8a4bfb0803ca9fac7a539c6e7"
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
