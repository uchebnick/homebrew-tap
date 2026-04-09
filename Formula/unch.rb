class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.10/unch_Darwin_arm64.tar.gz"
      sha256 "0de2bdaea667b2031791eaac846212a3cad38b0c8a9b354c6a69aa0950fddba1"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.10/unch_Darwin_x86_64.tar.gz"
      sha256 "2705a0d12b3a84586cc43103297937cee0283f027a75c73d5840b4e063f58cf7"
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
