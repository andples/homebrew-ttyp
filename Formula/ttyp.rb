class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  url "https://github.com/andples/tui-type/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ad5dce4fe8e9048ea0a64d7893e10cb7ab20828671079c79cfff2c4beead050c"
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
