class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.1.1"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.1.1/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "22adf57b84ff721da3dff1b851af29e5bde3628816325194a1b5edaa45ecc74c"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.1.1/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "f07f225ec70476bf06e907e5ba05e823b360dee8a36400ee39a548241d93197e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.1.1/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "04ed404cdcb243cf23b2e8a9f81550d414fb153c41b532297f9049c840eebf92"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.1.1/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d2c1a416b86716cfcdfbb902ea858cbcc9467824284b819593c36b23667c9a34"
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
