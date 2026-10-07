class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.4.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.4.0/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "c81b0352904d0bea0c540f956defa5bf17ac2bdb30da68c3364cc16defe9793f"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.4.0/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "32f249e87be6fb82ba70ade81ee0aa527bafd4ec7f9dfee41c406aa8402d7570"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.4.0/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "db05d94095ab824acc46c31d962824090e8760d53563c220d43ae1d1fe0df4e1"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.4.0/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "514f7a836c07bb71a7350258cd5fcee3952efc6b0a5637bc476c702b4562b3ff"
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
