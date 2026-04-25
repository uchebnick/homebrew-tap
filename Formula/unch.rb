class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.4.1/unch_Darwin_arm64.tar.gz"
      sha256 "d6e378ae43dff530f918fcd56a6120247cde4a326bf33b373b460d689c98d947"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.4.1/unch_Darwin_x86_64.tar.gz"
      sha256 "cea7a55954ee3a3be73f4a0519ac7d5299816133f3b7a0b269701900b64978a6"
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
