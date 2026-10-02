class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.1.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.1.0/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "526b38516a194a69b53310459edb03846af7f023142c72cd214eaf9082c9dce8"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.1.0/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "d7d7551392c16827b3f816e02337cdf467466a812eda8a51d9fb4c602a7fb3de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.1.0/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "df72a393c5aabab2290174449114336622bda8f4d77eec4bcfdc8c1bab7f7ea4"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.1.0/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "421e2820f7da5ed43c0df916cb6eeeed21b15322ec0599dae7dbbf52db388c6e"
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
