class GitCa < Formula
  desc "AI-powered Git plugin for generating meaningful commit messages"
  homepage "https://github.com/zh30/git-commit-analyzer"
  url "https://github.com/zh30/git-commit-analyzer/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "e429a4f44db087cd1a98f7bbfa545bdd090eacb8c1d0041043ce3ec78fcc3b78"
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