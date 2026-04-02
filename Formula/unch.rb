class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.1/unch_Darwin_arm64.tar.gz"
      sha256 "117d3c950a98f34f4076d009e9ccda06dc717b01fed5842f2fffa7203ad5565e"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.1/unch_Darwin_x86_64.tar.gz"
      sha256 "08ffc91da4fc1433b190e9fa0823ee27a16fce6219ee49f65e736d01a45e636d"
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
