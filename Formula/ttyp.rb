class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  url "https://github.com/andples/tui-type/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "9139cf7722075de2c0ee37d41d449f4498791d14253db749f580e0db8c4b4e23"
  license "MIT"
  head "https://github.com/andples/tui-type.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "ttyp", shell_output("#{bin}/ttyp --help")
  end
end
