class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.4/unch_Darwin_arm64.tar.gz"
      sha256 "e920161ed56e3a06c6aca66213edea008bc32cebbcfe3e3f562b5f6b4026d82a"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.4/unch_Darwin_x86_64.tar.gz"
      sha256 "5b3e312881df8de9a25732fd3a316cb56c8a8603b88fc63de3e2604113ca218a"
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
