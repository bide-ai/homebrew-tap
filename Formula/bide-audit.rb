# typed: false
# frozen_string_literal: true

# Hand-maintained formula for the bide-audit verifier CLI. Update the version
# and sha256s when a new bide release ships.
class BideAudit < Formula
  desc "Offline verifier for bide proof bundles (RFC 6962 Merkle audit trails)"
  homepage "https://bide-ai.com"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bide-ai/bide/releases/download/v0.9.0/bide-audit_0.9.0_darwin_amd64.tar.gz"
      sha256 "7686cc2dcca33a12ffdc3bc14097c239cd0eae54d978b6fac20e950d7b8119b0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/bide-ai/bide/releases/download/v0.9.0/bide-audit_0.9.0_darwin_arm64.tar.gz"
      sha256 "d8e50564e472d81a9c62711c55ff902aec685988cda4967c8cbcbfbf46348c5a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.9.0/bide-audit_0.9.0_linux_amd64.tar.gz"
      sha256 "99a170245e051a29a68d19d878518bc26c082cb8523c15500d0b860f1f1e60e8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.9.0/bide-audit_0.9.0_linux_arm64.tar.gz"
      sha256 "7ababfe207cbf6bcf97c210a5bbe2e93aaa37aa0a323ff586e7cf28f5b8658db"
    end
  end

  def install
    bin.install "bide-audit"
  end

  test do
    assert_match "verify", shell_output("#{bin}/bide-audit 2>&1 || true")
  end
end
