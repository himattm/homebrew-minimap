class Minimap < Formula
  desc "Shared navigation memory for AI agents working in Android codebases"
  homepage "https://github.com/himattm/minimap"
  url "https://github.com/himattm/minimap/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "756268ba569b8c596a930b4ac2d6132df5103a9dacbd57f146bb408b3cdbdd0e"
  license "Apache-2.0"
  head "https://github.com/himattm/minimap.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/minimap-cli")
  end

  test do
    assert_match "Usage: minimap", shell_output("#{bin}/minimap --help")
    system bin/"minimap", "init", "--dry-run", "--agents", "all"
  end
end
