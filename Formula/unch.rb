class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.0/unch_Darwin_arm64.tar.gz"
      sha256 "8437f07c627613ff6d33f2392bc8aefb108b467ae0e4f5f4680ce1d3d9f1101d"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.0/unch_Darwin_x86_64.tar.gz"
      sha256 "bc3ef6a44b611c77fbc0db8911a87749e299dbe60b43e27b7d79056cda2c0a5b"
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
