class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.0/unch_Darwin_arm64.tar.gz"
      sha256 "baae6510524c5d1915ef1dcb04010f9e911d61d3a2c2a5cb91e1ae299392e4f7"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.0/unch_Darwin_x86_64.tar.gz"
      sha256 "c77c9389019d4ebf7d48471c5f0abda1d6ad1c82e248f028ef96bf69bc11b498"
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
