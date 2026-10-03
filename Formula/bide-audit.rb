# typed: false
# frozen_string_literal: true

# Hand-maintained formula for the bide-audit verifier CLI. Update the version
# and sha256s when a new bide release ships.
class BideAudit < Formula
  desc "Offline verifier for bide proof bundles (RFC 6962 Merkle audit trails)"
  homepage "https://bide-ai.com"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bide-ai/bide/releases/download/v0.10.0/bide-audit_0.10.0_darwin_amd64.tar.gz"
      sha256 "9d8c5cbf6ae7363ae30f52d9deafa9b393744a45979f853bbfd9a775314ac772"
    end
    if Hardware::CPU.arm?
      url "https://github.com/bide-ai/bide/releases/download/v0.10.0/bide-audit_0.10.0_darwin_arm64.tar.gz"
      sha256 "fef600a7419622b1590f344545fd605cda45b5458c11f00c69a18444031816a5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.10.0/bide-audit_0.10.0_linux_amd64.tar.gz"
      sha256 "498e18c1ed33e3674e2c5105eb11596b81e50131f67817fea4ffea30a29f9b60"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.10.0/bide-audit_0.10.0_linux_arm64.tar.gz"
      sha256 "a4b027dd6329cfe4d429763908c70dac0e5d5d1a1b24523b718d10cab2ef78c1"
    end
  end

  def install
    bin.install "bide-audit"
  end

  test do
    assert_match "verify", shell_output("#{bin}/bide-audit 2>&1 || true")
  end
end
