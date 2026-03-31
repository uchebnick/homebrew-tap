class Unch < Formula
  desc "Local-first semantic code search over repository annotations"
  homepage "https://github.com/uchebnick/unch-searcher"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch-searcher/releases/download/v0.2.0/unch_Darwin_arm64.tar.gz"
      sha256 "233c55c182de50506f1bcae7134826655722c8daaa971c1d6b513fe78512d46e"
    else
      url "https://github.com/uchebnick/unch-searcher/releases/download/v0.2.0/unch_Darwin_x86_64.tar.gz"
      sha256 "6147e6bc55394c9d3fdf4f3b73df951aa4f0405ca459f94d6aaa517b5fdf1e3a"
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
