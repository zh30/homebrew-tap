class GitCa < Formula
  desc "AI-powered Git plugin for generating meaningful commit messages"
  homepage "https://github.com/zh30/git-commit-analyzer"
  url "https://github.com/zh30/git-commit-analyzer/archive/refs/tags/v2.0.8.tar.gz"
  sha256 "760f0b4e7d996ab665e4c60b444f1cc5ca2e431d1515a5b44865935ba203be28"
  license "MIT"
  head "https://github.com/zh30/git-commit-analyzer.git", branch: "main"

  # Bottle support for pre-built binaries
  bottle do
    root_url "https://github.com/zh30/git-commit-analyzer/releases/download/v2.0.8"
    sha256 cellar: :any, arm64_sequoia: "6df416cda445d10cd64e1abb69b8373b39e022f4773e0d2ef53ab351f9389620"
    sha256 cellar: :any, x86_64_sequoia: "17fa45a4d8f7293529c2c632a5f02a338d7375282c7cc09424f577ac0682f639"
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
