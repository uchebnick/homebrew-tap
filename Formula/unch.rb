class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.6/unch_Darwin_arm64.tar.gz"
      sha256 "3f8878f08b21c78519478550db7c4ad0f3976529b7069941dea45a016547ed73"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.6/unch_Darwin_x86_64.tar.gz"
      sha256 "e9f5ccdc38500fc3d7f3a2f4d7650dddb06abcf57ba9ec084d3835f13c0899e6"
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
