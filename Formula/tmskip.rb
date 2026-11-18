# Rendered by packaging/homebrew/render.sh in the release workflow and pushed
# to michaelfmnk/homebrew-tap as Formula/tmskip.rb. Installs the signed and
# notarized release binary (not a from-source build), so the Full Disk Access
# grant survives `brew upgrade`.
class Tmskip < Formula
  desc "Keep rebuildable developer folders out of Time Machine backups"
  homepage "https://github.com/michaelfmnk/tmskip"
  url "https://github.com/michaelfmnk/tmskip/releases/download/v0.1.0/tmskip_0.1.0_darwin_universal.zip"
  version "0.1.0"
  sha256 "5faae0aa1258253f06a8a6f7ec95c9f3cf62bcfa635d87073421feb2ce0cd97a"
  license "MIT"

  depends_on :macos

  def install
    bin.install "tmskip"
  end

  def caveats
    <<~EOS
      Get started:
        tmskip init
      The scheduled run needs Full Disk Access only for folders in Documents,
      Desktop, Downloads, iCloud Drive or external volumes; "tmskip doctor" tells you.
    EOS
  end

  test do
    assert_equal "tmskip #{version}", shell_output("#{bin}/tmskip --version").strip
  end
end
