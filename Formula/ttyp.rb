class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.5.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.5.0/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "a200ee8f5b872eaccf799fbd5832fde77665f93aeb46618d1be31b2d7acfc3f5"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.5.0/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "12e8736f3a23e829649f8ebf57c45c6aaa40d1698fbae951ede1d41fd370284f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.5.0/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "12fff08e04747acc91ce93b440dc9fca97c3c19a3a72400edc6d92e681ee2684"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.5.0/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a386dfb3cbaa924d460e5c33d70f66f2cce7458f41832c023fc4e1358978b8d4"
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
