class GitCa < Formula
  desc "AI-powered Git plugin for generating meaningful commit messages"
  homepage "https://github.com/zh30/git-commit-analyzer"
  url "https://github.com/zh30/git-commit-analyzer/archive/refs/tags/v2.0.6.tar.gz"
  sha256 "4e3900bf1f7b6801d0ed60f1e4e740c6148117f80c817fe47a2193d7942a7556"
  license "MIT"
  head "https://github.com/zh30/git-commit-analyzer.git", branch: "main"

  # Bottle support for pre-built binaries
  bottle do
    root_url "https://github.com/zh30/git-commit-analyzer/releases/download/v2.0.6"
    sha256 cellar: :any, arm64_sequoia: "9e81a0b87261cb8abb3f2a77f307dd2d2fa6bdca5608c340b36fdcc7aa69f3d8"
    sha256 cellar: :any, x86_64_sequoia: "292f508cd498037bf167162023d7986dfbb7b18a3821f2f5da36fe4f5c870a10"
  end

  def install
    bin.install "git-ca"
  end

  def caveats
    <<~EOS
      To use git-ca, you need a local GGUF model (llama.cpp format).

      The tool will automatically download the default model
      (unsloth/gemma-3-270m-it-GGUF) on first run, or you can:
        - Place GGUF files in ./models directory
        - Place GGUF files in ~/.cache/git-ca/models directory
        - Run 'git ca model' to select a model manually

      To set up a default model, run:
        git ca model

      Note: git-ca uses local llama.cpp inference (no remote API calls).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-ca --version")
  end
end
