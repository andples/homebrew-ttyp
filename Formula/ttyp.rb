class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.8.1"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.8.1/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "789bac7ce75efe1ca58e9712d7267be25f3fbe58671bbdc90ce12421e7ecdb98"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.8.1/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "73b4cd777efa76e84334203fe03b90bac83699c817716419beed426695026ccb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.8.1/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bbdef141c8581d03e6c6d05de0f7c953268dd47b84a4fa68d313f374d0be0cbd"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.8.1/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bf84922dfc9b9ca9501e91882361d02354a79903b6d708d263ff1c5d519b6ccf"
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
