# typed: false
# frozen_string_literal: true

# Hand-maintained formula for the bide-audit verifier CLI. Update the version
# and sha256s when a new bide release ships.
class BideAudit < Formula
  desc "Offline verifier for bide proof bundles (RFC 6962 Merkle audit trails)"
  homepage "https://bide-ai.com"
  version "0.13.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bide-ai/bide/releases/download/v0.13.0/bide-audit_0.13.0_darwin_amd64.tar.gz"
      sha256 "b51868e40ac967c0728fb8750bf4354c9b8dab91a824c0aee22b2c26fc9372b9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/bide-ai/bide/releases/download/v0.13.0/bide-audit_0.13.0_darwin_arm64.tar.gz"
      sha256 "e9b5f93e7539ca7203cb5b66905e332046c1a76cd70b38614103abc520ecf95c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.13.0/bide-audit_0.13.0_linux_amd64.tar.gz"
      sha256 "b4f5d1de4ce95a3ea98e296568f7ec1083e67e3516142d0915f3e457e3e089c1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.13.0/bide-audit_0.13.0_linux_arm64.tar.gz"
      sha256 "860259a0346bdfa454f51ec24344db9597368a38fe3027902e5be132f9fbf7cc"
    end
  end

  def install
    bin.install "bide-audit"
  end

  test do
    assert_match "verify", shell_output("#{bin}/bide-audit 2>&1 || true")
  end
end
