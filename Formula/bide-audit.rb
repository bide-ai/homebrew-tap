# typed: false
# frozen_string_literal: true

# Hand-maintained formula for the bide-audit verifier CLI. Update the version
# and sha256s when a new bide release ships.
class BideAudit < Formula
  desc "Offline verifier for bide proof bundles (RFC 6962 Merkle audit trails)"
  homepage "https://bide-ai.com"
  version "0.11.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bide-ai/bide/releases/download/v0.11.1/bide-audit_0.11.1_darwin_amd64.tar.gz"
      sha256 "465420e8606cdeca8285f944f53aead8c1d215c547ad87dc82bbdc2e10311ff7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/bide-ai/bide/releases/download/v0.11.1/bide-audit_0.11.1_darwin_arm64.tar.gz"
      sha256 "378a5c3734589b16e34dc8244fadf8e3bba3290595ff8f2d039231f233a9bdc0"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.11.1/bide-audit_0.11.1_linux_amd64.tar.gz"
      sha256 "8c408e6ea3c343cf999588ab1e641a030988b5639ea398a70f1d5d678e79a85a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.11.1/bide-audit_0.11.1_linux_arm64.tar.gz"
      sha256 "c8e1e7bfc29dcdc988b6853341e86c51eb700641130f09415f2a6040df26274e"
    end
  end

  def install
    bin.install "bide-audit"
  end

  test do
    assert_match "verify", shell_output("#{bin}/bide-audit 2>&1 || true")
  end
end
