class GitCa < Formula
  desc "AI-powered Git plugin for generating meaningful commit messages"
  homepage "https://github.com/zh30/git-commit-analyzer"
  url "https://github.com/zh30/git-commit-analyzer/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "b9e9837ed1f7eddb37b7d716b51657ae4ea234e6c648304906f7563317390fa7"
  license "MIT"
  head "https://github.com/zh30/git-commit-analyzer.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--bin", "git-ca"
    bin.install "target/release/git-ca"
  end

  def caveats
    <<~EOS
      To use git-ca, you need Ollama installed and running:
      https://ollama.com/download
      
      You'll also need at least one language model installed in Ollama.
      
      To set up a default model, run:
      git ca model
    EOS
  end

  test do
    # Test to verify that the binary is installed correctly
    system "#{bin}/git-ca", "--version"
  end
end 