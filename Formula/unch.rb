class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.5/unch_Darwin_arm64.tar.gz"
      sha256 "dfddb01910d8ebb64c9298d6a8ee564c9acd44360a794ce1feed1a45a9d222a9"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.5/unch_Darwin_x86_64.tar.gz"
      sha256 "c5fef0669516e025f286dde36ce50e71b137b513b752cb303e98ce33480bf308"
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
