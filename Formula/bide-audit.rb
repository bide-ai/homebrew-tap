# typed: false
# frozen_string_literal: true

# Hand-maintained formula for the bide-audit verifier CLI. Update the version
# and sha256s when a new bide release ships.
class BideAudit < Formula
  desc "Offline verifier for bide proof bundles (RFC 6962 Merkle audit trails)"
  homepage "https://bide-ai.com"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bide-ai/bide/releases/download/v0.2.0/bide-audit_0.2.0_darwin_amd64.tar.gz"
      sha256 "058f06fab0e0585455a2e4510f304b9cccf46863c77fba41de7d03000b375d6d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/bide-ai/bide/releases/download/v0.2.0/bide-audit_0.2.0_darwin_arm64.tar.gz"
      sha256 "b5e1c149e13da660383ca4aea9ba0e21ea03d2ea2f42573a6ef6dd1f08473b2c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.2.0/bide-audit_0.2.0_linux_amd64.tar.gz"
      sha256 "2a27c806218009abc785aacfc12b0321e0b17775b633123811b42a5add0cd55a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.2.0/bide-audit_0.2.0_linux_arm64.tar.gz"
      sha256 "f9b60fed0b8700a5e0702e4d252771b82e321bde13155fb2681f2504963e268c"
    end
  end

  def install
    bin.install "bide-audit"
  end

  test do
    assert_match "verify", shell_output("#{bin}/bide-audit 2>&1 || true")
  end
end
