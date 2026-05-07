class Minimap < Formula
  desc "Shared navigation memory for AI agents working in Android codebases"
  homepage "https://github.com/himattm/minimap"
  url "https://github.com/himattm/minimap/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "19d905d3076fcfba1e64e75dc3e0d661fb9f5c935f6f35fcc33f5076b581174a"
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
