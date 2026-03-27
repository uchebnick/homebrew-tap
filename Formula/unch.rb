class Unch < Formula
  desc "Local-first semantic code search over repository annotations"
  homepage "https://github.com/uchebnick/unch-searcher"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch-searcher/releases/download/v0.1.0/unch_Darwin_arm64.tar.gz"
      sha256 "aecb0b46bde5ec80bd184c21c685e2f9c88fea0c2f924cfde1f3265230b406eb"
    else
      url "https://github.com/uchebnick/unch-searcher/releases/download/v0.1.0/unch_Darwin_x86_64.tar.gz"
      sha256 "541b01bc93ef93d0066149ebf6b3d63de0cb47a92444055cbdd2d00c7b8adc23"
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
