class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.4.3/unch_Darwin_arm64.tar.gz"
      sha256 "e42bccd48a768be4121e22f131e948861082ec1be453a8238f04d0dd03bf2cec"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.4.3/unch_Darwin_x86_64.tar.gz"
      sha256 "2e3da2b3ab8a51be4ce4360b9a38dcc0a39822afc8868842db7047a9aa7ac934"
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
