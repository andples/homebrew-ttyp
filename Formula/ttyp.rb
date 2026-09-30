class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "1.5.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.5.0/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "c2f210f9a52099c6dfb8d143f85244e634829109107493e2311b51123986370e"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.5.0/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "9ad6c979f5fe83a0465ecc389d7a0d38c95fb2449f19b7f912add34e14de867f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v1.5.0/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "40d3acaaf66123ef390a862927201ab0d43a38e48c9d48e25c0a168337880944"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v1.5.0/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9db15fd341dfbfd229edb1a1d89c423d2ea5344d603f5c309304eaad17879e45"
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
