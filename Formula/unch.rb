class Unch < Formula
  desc "Local-first semantic code search over code objects"
  homepage "https://github.com/uchebnick/unch"
  version "0.3.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uchebnick/unch/releases/download/v0.3.12/unch_Darwin_arm64.tar.gz"
      sha256 "9c5373c9aec95122a15f397412deb30519ecad2fab20c4b74eb31ff25d8635de"
    else
      url "https://github.com/uchebnick/unch/releases/download/v0.3.12/unch_Darwin_x86_64.tar.gz"
      sha256 "c3f4d566b727763a690b7cb3e5342583cf61929655419495c95f5302a87e3822"
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
