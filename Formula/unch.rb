class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.4.2/unch_Darwin_arm64.tar.gz"
      sha256 "ccfa39ab9607c9880ac2c87920d24223203b471dbd1e0e6fd2b0771670f65a1c"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.4.2/unch_Darwin_x86_64.tar.gz"
      sha256 "411d1f50e9c65a19b86aae52d0178275432698ba32a5a8fb9eb50a4ff37f3799"
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
