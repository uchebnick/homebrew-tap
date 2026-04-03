class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.3/unch_Darwin_arm64.tar.gz"
      sha256 "66ce8bf3ef84e93caec43d8063508920af5f23ce2ed8db1f91d9a068a4e53635"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.3/unch_Darwin_x86_64.tar.gz"
      sha256 "0901ce76fda01d049a3cc2c44a5220f03854e9852dfe82ac9922c154e79eb884"
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
