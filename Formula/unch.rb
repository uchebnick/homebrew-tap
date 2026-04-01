class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.0/unch_Darwin_arm64.tar.gz"
      sha256 "69d5a0dcf23b1205887c97bd7fa6ec5df94a8e0765a79998e7c7858c6f9ad06f"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.0/unch_Darwin_x86_64.tar.gz"
      sha256 "5261cf77df4315c708324a6908875ee767e45d1ae5a103d035d9798477fea2ff"
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
