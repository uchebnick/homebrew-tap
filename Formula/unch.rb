class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.2/unch_Darwin_arm64.tar.gz"
      sha256 "518209ad886d42fc2e36220df897b4c1789f6ebef4a3441849bb9cd4ee536447"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.2/unch_Darwin_x86_64.tar.gz"
      sha256 "4275050c70d489434fbbe1125a2886fca4cfb0b2ae17f7aa515e28e470a8f302"
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
