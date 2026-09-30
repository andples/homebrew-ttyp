class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "1.2.2"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.2.2/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "011e8e6a346267a474002fac6b0f2831fada7e31bc18683b02380f56d5bffb57"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.2.2/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "9dca6114f735b82c71e8736b952013b5399b203dc1b0040252a7497b276e8491"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.2.2/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f936f38f94cc7268caa37a28744b0607b60461417e678f7e0b0dbc4160736635"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.2.2/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2e99baf9a0ecab5c4d774e0e9221ce9c355f247f42dfa7dad0670a44b00f658b"
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
