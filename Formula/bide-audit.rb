# typed: false
# frozen_string_literal: true

# Hand-maintained formula for the bide-audit verifier CLI. Update the version
# and sha256s when a new bide release ships.
class BideAudit < Formula
  desc "Offline verifier for bide proof bundles (RFC 6962 Merkle audit trails)"
  homepage "https://bide-ai.com"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bide-ai/bide/releases/download/v0.5.0/bide-audit_0.5.0_darwin_amd64.tar.gz"
      sha256 "ceddaa321c25e9a1b55c65d9008a002c69da89e9300822216baf422bb66e8b0f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/bide-ai/bide/releases/download/v0.5.0/bide-audit_0.5.0_darwin_arm64.tar.gz"
      sha256 "b5e39b44a113c03863803640af364f97472dfaeb4ed40d8d9cbbd802115d4615"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.5.0/bide-audit_0.5.0_linux_amd64.tar.gz"
      sha256 "35511add18d74fb032a1b69adb41986cbd23ba2e6220f53ea73436f8f97deef5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.5.0/bide-audit_0.5.0_linux_arm64.tar.gz"
      sha256 "a916fa07c3eb8d66618c7b1248f2ff5797eb2ea027b71e103775895aadf91622"
    end
  end

  def install
    bin.install "bide-audit"
  end

  test do
    assert_match "verify", shell_output("#{bin}/bide-audit 2>&1 || true")
  end
end
