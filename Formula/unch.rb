class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.11/unch_Darwin_arm64.tar.gz"
      sha256 "1412bbb04acedc364ae757b4fec6efba8784cf99d478daa4d6d14e3105e04a5f"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.11/unch_Darwin_x86_64.tar.gz"
      sha256 "5eb43af91602c631287c61e5d30f7b9318b4c899e9c7eea05f74a1a9cd21ddbf"
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
