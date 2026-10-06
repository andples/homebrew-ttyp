class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.2.0"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.2.0/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "66fa0d7b174a40734f459b597603e7b2cc5c633bb8cefe86f00c2928822d9869"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.2.0/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "48d100feb0bcb3aac0298c2519cdc5c95e4b8b2112c8f306d354335df03d0108"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.2.0/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8450432f5b791fea7180eef5cfcc082833781b162b090b3da30c03ec0aae1b7a"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.2.0/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a29eb47dd90ee2767ec82b3a6b251efa68fcf2e4546df549a0b2d9360e6c385d"
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
