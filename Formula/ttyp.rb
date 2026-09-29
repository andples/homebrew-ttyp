class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  url "https://github.com/andples/tui-type/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7d435b988fcced9e3faa654ceeb9c092d777d1ec4fd7b61444935bb60773114a"
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
