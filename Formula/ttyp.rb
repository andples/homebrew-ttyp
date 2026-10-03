class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.1.2"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.1.2/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "131a2446c5c81620400b525a3ceb28ef7cb2ce26bc605dcae5319574409845ba"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.1.2/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "655583ff2f336f7b94474715305ae79abd8cfd8f317403a9b43fe22fecde3f58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.1.2/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8c00e34bd1464a19b88defc42790b8b4a101e052d99ee59c81e3e759ed18d9ab"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.1.2/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "24a8c73c5bd42027bb5345968659bf6aabb88506f3303a80fe8fa20fb548532a"
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
