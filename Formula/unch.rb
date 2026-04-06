class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.8/unch_Darwin_arm64.tar.gz"
      sha256 "f8225a6d1b81c6f1e98b7fb87d91776f5fe92681efd519de0125427d9908ca29"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.8/unch_Darwin_x86_64.tar.gz"
      sha256 "b9cbdd35aa9661de14897b9efe98eb038c3846d404503a86186b4b58d23d7fae"
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
