class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.9/unch_Darwin_arm64.tar.gz"
      sha256 "9ebfe9eaad92a4496fad0d9c53292f517fbc7083b4bc6cad88edb6e9efbd9761"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.9/unch_Darwin_x86_64.tar.gz"
      sha256 "2a8329336cafdd9a218c52fd23fe693ec80d9fe03f86559f98b98a154beb9f79"
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
