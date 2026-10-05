# typed: false
# frozen_string_literal: true

# Hand-maintained formula for the bide-audit verifier CLI. Update the version
# and sha256s when a new bide release ships.
class BideAudit < Formula
  desc "Offline verifier for bide proof bundles (RFC 6962 Merkle audit trails)"
  homepage "https://bide-ai.com"
  version "0.12.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bide-ai/bide/releases/download/v0.12.0/bide-audit_0.12.0_darwin_amd64.tar.gz"
      sha256 "da563c0a1fe7edd7f4c3b4930f71b75b51fa36cfabb5aea2f325c074030848e9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/bide-ai/bide/releases/download/v0.12.0/bide-audit_0.12.0_darwin_arm64.tar.gz"
      sha256 "239e0046560b27272a27f1fcf1e28fc63acf7edd8ef7d06987cd57e5d2a11351"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.12.0/bide-audit_0.12.0_linux_amd64.tar.gz"
      sha256 "5432d8b3fa5dd5d85defa6bb37acd6155597cfb06f271524da996e7a1deb4d62"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.12.0/bide-audit_0.12.0_linux_arm64.tar.gz"
      sha256 "c06e399424d16e2ecfaa3beba576800af35e641954ce51cd5e695838a4c62009"
    end
  end

  def install
    bin.install "bide-audit"
  end

  test do
    assert_match "verify", shell_output("#{bin}/bide-audit 2>&1 || true")
  end
end
