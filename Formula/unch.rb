class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.0/unch_Darwin_arm64.tar.gz"
      sha256 "b9d4c0cb65fb454083f4988e191f9030aa2bab587649c048ab2e3973051ee540"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.0/unch_Darwin_x86_64.tar.gz"
      sha256 "f622b0d7979ec1ad7db6efe6b8f7bfe595322daf70d16bfa1a339fd18d81205e"
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
