class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.7.1"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.7.1/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "22671e231cbffa94d0bb3b536fcda5de143b44da1e461ffe75a23ec28f06ab1d"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.7.1/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "2fc570e6f85725b7fef0fcb70e7f57d69eb76c509e55473bd3a805fba607e7b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.7.1/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "db70e529e16cbb11e239348053aa961ecc87d49221de765737484759dad8d1eb"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.7.1/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b5aa1e97ab087ca04067e17edc742a407ade9a71cd4446dba511989c2c437654"
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
