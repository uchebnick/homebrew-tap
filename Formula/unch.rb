class Unch < Formula
  desc "Local-first semantic code search over repository annotations"
  homepage "https://github.com/uchebnick/unch-searcher"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch-searcher/releases/download/v0.2.1/unch_Darwin_arm64.tar.gz"
      sha256 "241c17f5aa9d15974872b149b05134a43cf8257841ddc54d7a23a72431859d9b"
    else
      url "https://github.com/uchebnick/unch-searcher/releases/download/v0.2.1/unch_Darwin_x86_64.tar.gz"
      sha256 "8891aed8f628363df929f59ed7cbf1bbbb5f114b8c1b8550ef11c482d17db188"
    end
  end

  def install
    bin.install "unch"
  end

  def caveats
    <<~EOS
      On first run unch may download:
        - a default GGUF embedding model into the user cache
        - yzma runtime libraries into ./.semsearch/yzma
    EOS
  end

  test do
    assert_match "empty search query", shell_output("#{bin}/unch search 2>&1", 1)
  end
end
