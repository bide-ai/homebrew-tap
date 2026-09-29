# typed: false
# frozen_string_literal: true

# Hand-maintained formula for the bide-audit verifier CLI. Update the version
# and sha256s when a new bide release ships.
class BideAudit < Formula
  desc "Offline verifier for bide proof bundles (RFC 6962 Merkle audit trails)"
  homepage "https://bide-ai.com"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bide-ai/bide/releases/download/v0.7.0/bide-audit_0.7.0_darwin_amd64.tar.gz"
      sha256 "888fe47734ad763790fae5c54067f3e39ef25b19ff7c2f7846aec0f6c7ea4222"
    end
    if Hardware::CPU.arm?
      url "https://github.com/bide-ai/bide/releases/download/v0.7.0/bide-audit_0.7.0_darwin_arm64.tar.gz"
      sha256 "0f323a6ddce6784538ea8bc4206d55f2530887bf5a8e49743ad97dbabc44652b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.7.0/bide-audit_0.7.0_linux_amd64.tar.gz"
      sha256 "0df8fcef35878722aa069e94a8319e3e99c685f4d18bbc753f3a10de44fb23a8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.7.0/bide-audit_0.7.0_linux_arm64.tar.gz"
      sha256 "372026fcce7dbbfab26b278163e2376dd4d66137307299ec3af7b889b5a1880e"
    end
  end

  def install
    bin.install "bide-audit"
  end

  test do
    assert_match "verify", shell_output("#{bin}/bide-audit 2>&1 || true")
  end
end
