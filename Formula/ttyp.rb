class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  version "2.6.3"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/tui-type; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.6.3/ttyp-aarch64-apple-darwin.tar.gz"
      sha256 "b274ef5255bda85042638d1e6229841243d8e14999bb7a9ca0127557d6c033af"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.6.3/ttyp-x86_64-apple-darwin.tar.gz"
      sha256 "4f0cef710ca454028191cdb3b891540102e1a1fe1aefb25e0cc819aba7fa8f77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/tui-type/releases/download/v2.6.3/ttyp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7ba5ed6a7ef0ad507c4ae3aba7bf76b929f46e08380ee2ef43fd2136ff94c3f9"
    end
    on_intel do
      url "https://github.com/andples/tui-type/releases/download/v2.6.3/ttyp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e9ea4c583aea447728bf23b90a61ec2a01ebf1a1c90feb06113dddf0b33fa721"
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
