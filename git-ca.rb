class GitCa < Formula
  desc "AI-powered Git plugin for generating meaningful commit messages"
  homepage "https://github.com/zh30/git-commit-analyzer"
  url "https://github.com/zh30/git-commit-analyzer/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "4640b771ad6d8043d73a47c088e6843d793f6bf0ebe175b2c4e7558fe6d9f492"
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