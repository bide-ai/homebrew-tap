# typed: false
# frozen_string_literal: true

# Hand-maintained formula for the bide-audit verifier CLI. Update the version
# and sha256s when a new bide release ships.
class BideAudit < Formula
  desc "Offline verifier for bide proof bundles (RFC 6962 Merkle audit trails)"
  homepage "https://bide-ai.com"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bide-ai/bide/releases/download/v0.6.0/bide-audit_0.6.0_darwin_amd64.tar.gz"
      sha256 "fe3df5766040a23f754238b20cb01b912adbcd5afe34a563df8ba3324d79f59e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/bide-ai/bide/releases/download/v0.6.0/bide-audit_0.6.0_darwin_arm64.tar.gz"
      sha256 "f1158c6aa1bf004afc3b45186df8e6cbe8a8bd0c22f3a4db77872a7f93a46d9b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.6.0/bide-audit_0.6.0_linux_amd64.tar.gz"
      sha256 "8c44a986bd626aaa19b912a5f4e87c71a3babc9598c9d164cc86f9eb1cce97ac"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.6.0/bide-audit_0.6.0_linux_arm64.tar.gz"
      sha256 "518a987fd95df5381140ddc6be4a6ab5873e30f2d110c56e38470197ea03aa2d"
    end
  end

  def install
    bin.install "bide-audit"
  end

  test do
    assert_match "verify", shell_output("#{bin}/bide-audit 2>&1 || true")
  end
end
