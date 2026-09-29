class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  url "https://github.com/andples/tui-type/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "9bcdb1d1123cc387306ca6f9aa97422dc7c8849c624fa14d98b673f7942de7f4"
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
