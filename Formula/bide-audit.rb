# typed: false
# frozen_string_literal: true

# Hand-maintained formula for the bide-audit verifier CLI. Update the version
# and sha256s when a new bide release ships.
class BideAudit < Formula
  desc "Offline verifier for bide proof bundles (RFC 6962 Merkle audit trails)"
  homepage "https://bide-ai.com"
  version "0.11.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bide-ai/bide/releases/download/v0.11.0/bide-audit_0.11.0_darwin_amd64.tar.gz"
      sha256 "4a0006bf1e9949cfa201d73c45379af5da2ea5283cf8f1d9e56ad8e3edf6652f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/bide-ai/bide/releases/download/v0.11.0/bide-audit_0.11.0_darwin_arm64.tar.gz"
      sha256 "82679cd5f255e31ed97071d1ac8b38571798ccb7423020ac09544831055ca7ed"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.11.0/bide-audit_0.11.0_linux_amd64.tar.gz"
      sha256 "f293eb164bfc22d887d6bea7e3751183150e6f93c6aa1d8fdd55e2502cd846a6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.11.0/bide-audit_0.11.0_linux_arm64.tar.gz"
      sha256 "0b2aafc65e2ea9a1cdd81b3414168e5214b991667dea32b3ccc588e7d3840935"
    end
  end

  def install
    bin.install "bide-audit"
  end

  test do
    assert_match "verify", shell_output("#{bin}/bide-audit 2>&1 || true")
  end
end
