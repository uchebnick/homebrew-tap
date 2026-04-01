class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.0/unch_Darwin_arm64.tar.gz"
      sha256 "ada105d6dbbdd63a5e50bc44d11c59082cad9d2b9f049317debed92a710fe2fc"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.0/unch_Darwin_x86_64.tar.gz"
      sha256 "0dd02b4fb07924e93c9344c6b2b140b678304d32cfcfe5db688f2b1859c1be7c"
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
