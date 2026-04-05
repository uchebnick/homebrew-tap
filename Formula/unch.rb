class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.5/unch_Darwin_arm64.tar.gz"
      sha256 "53acf77029660ba96f7aad9569cdcae0e1479346bd379523de4df16bdd4d8d97"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.5/unch_Darwin_x86_64.tar.gz"
      sha256 "b2f49f2f07bed0f9a63b0c38750bdf63287c2fb02e97e64dcadeb3eac0c33729"
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
