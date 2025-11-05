class GitCa < Formula
  desc "AI-powered Git plugin for generating meaningful commit messages"
  homepage "https://github.com/zh30/git-commit-analyzer"
  url "https://github.com/zh30/git-commit-analyzer/archive/refs/tags/v2.0.5.tar.gz"
  sha256 "57a24b8aa4720b8a84b2d43892f10a746bd0023cb31a565d00122a3d2b1f6e36"
  license "MIT"
  head "https://github.com/zh30/git-commit-analyzer.git", branch: "main"

  # Bottle support for pre-built binaries
  bottle do
    root_url "https://github.com/zh30/git-commit-analyzer/releases/download/v2.0.5"
    sha256 cellar: :any_skip_relocate, arm64_sequoia: "5e71a3d6b433377c99363bee9c586c3432d400bc6a42442adccdae7b38fb0cbb"
    sha256 cellar: :any_skip_relocate, x86_64_sequoia: "0ece2af3fa560042412b1d792be5b64df8bde4524d9152897e94c5999fd31085"
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
