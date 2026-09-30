# typed: false
# frozen_string_literal: true

# Hand-maintained formula for the bide-audit verifier CLI. Update the version
# and sha256s when a new bide release ships.
class BideAudit < Formula
  desc "Offline verifier for bide proof bundles (RFC 6962 Merkle audit trails)"
  homepage "https://bide-ai.com"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bide-ai/bide/releases/download/v0.8.0/bide-audit_0.8.0_darwin_amd64.tar.gz"
      sha256 "637cb44c3a739616d417dc16c748c7aa41816cc9111e67b9892e87fc76d6f535"
    end
    if Hardware::CPU.arm?
      url "https://github.com/bide-ai/bide/releases/download/v0.8.0/bide-audit_0.8.0_darwin_arm64.tar.gz"
      sha256 "e630071723e31e239b09bfcf7b10e47fb719e819bd8fd1d7ad708927c8332167"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.8.0/bide-audit_0.8.0_linux_amd64.tar.gz"
      sha256 "13620feff8e3679eec4cb24668145dbebf04717912980e80ea1e650457c2558d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.8.0/bide-audit_0.8.0_linux_arm64.tar.gz"
      sha256 "a8cfd6741ac59bf46f6ed261af2b91c75f85bb3dd83a3bf5781cf7837c16a935"
    end
  end

  def install
    bin.install "bide-audit"
  end

  test do
    assert_match "verify", shell_output("#{bin}/bide-audit 2>&1 || true")
  end
end
