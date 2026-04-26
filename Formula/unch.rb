class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.4.4/unch_Darwin_arm64.tar.gz"
      sha256 "29fc7e35eb595b7e68b7bf2008ea110f1ebd95f31c4d79541680f413a5670266"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.4.4/unch_Darwin_x86_64.tar.gz"
      sha256 "32a566263f63862793eb79def50103ed4f5af371189540a304bdeade663e9031"
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
