class Unch < Formula
  desc "Local-first semantic code search over repository annotations"
  homepage "https://github.com/uchebnick/unch-searcher"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch-searcher/releases/download/v0.1.1/unch_Darwin_arm64.tar.gz"
      sha256 "4d1429221f1e3a29a6bb97464ad635c37fd4c6c7eddba8809949e2b01a844e65"
    else
      url "https://github.com/uchebnick/unch-searcher/releases/download/v0.1.1/unch_Darwin_x86_64.tar.gz"
      sha256 "8918ce7a29f1a2ac88d6369a2800bf143c86de9ec87a6c27fe7ef23253d89a26"
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
