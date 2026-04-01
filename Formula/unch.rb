class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.2.2/unch_Darwin_arm64.tar.gz"
      sha256 "1912d2f529824e40938c9a7e59765b971b42a5b657430d0c0954a0b85429d956"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.2.2/unch_Darwin_x86_64.tar.gz"
      sha256 "47f36047c3b59d33c419dac0fcb0e918bbfabd60f13b006c159c56d20c2f6253"
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
