class Ttyp < Formula
  desc "Monkeytype-style TUI typing test"
  homepage "https://github.com/andples/tui-type"
  url "https://github.com/andples/tui-type/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "219787087382ed986f6037b91e441b8b3bb196538b8afda5e9394a97b56cdaa3"
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
