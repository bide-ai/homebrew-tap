# typed: false
# frozen_string_literal: true

# Hand-maintained formula for the bide-audit verifier CLI. Update the version
# and sha256s when a new bide release ships.
class BideAudit < Formula
  desc "Offline verifier for bide proof bundles (RFC 6962 Merkle audit trails)"
  homepage "https://bide-ai.com"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bide-ai/bide/releases/download/v0.4.0/bide-audit_0.4.0_darwin_amd64.tar.gz"
      sha256 "bd9d4283a0e3dc01ca480253874649e6947aacc3a74602b01be938e16151fb32"
    end
    if Hardware::CPU.arm?
      url "https://github.com/bide-ai/bide/releases/download/v0.4.0/bide-audit_0.4.0_darwin_arm64.tar.gz"
      sha256 "29f6b47f80a1fdbe48c0c50ef675d8b313c9f65a1cec188d7673f88934c508c5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.4.0/bide-audit_0.4.0_linux_amd64.tar.gz"
      sha256 "3e59dbcdb0b36a0c291d0b3a54dce42a9c0990bd42ab1e5eb249143787d09db4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.4.0/bide-audit_0.4.0_linux_arm64.tar.gz"
      sha256 "cff5df195dea545492109fb52979102c0205c9d7da5b2d080172546c75af847d"
    end
  end

  def install
    bin.install "bide-audit"
  end

  test do
    assert_match "verify", shell_output("#{bin}/bide-audit 2>&1 || true")
  end
end
