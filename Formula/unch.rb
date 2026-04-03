class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.3/unch_Darwin_arm64.tar.gz"
      sha256 "37da9d0a0e0efd076fc2c8dc370f6f7ff6f34b5398dcc2e9f9e7e6f29befd550"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.3/unch_Darwin_x86_64.tar.gz"
      sha256 "99be0635ff37b02c671abb3d670bb27786c623c5d71d833de0d24c1e44c6c052"
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
