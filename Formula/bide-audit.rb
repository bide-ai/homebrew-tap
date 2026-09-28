# typed: false
# frozen_string_literal: true

# This file is generated on release by GoReleaser; the v0.1.0 formula was
# backfilled by hand. Do not edit; it is overwritten on the next release.
class BideAudit < Formula
  desc "Offline verifier for bide proof bundles (RFC 6962 Merkle audit trails)"
  homepage "https://bide-ai.com"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bide-ai/bide/releases/download/v0.1.0/bide-audit_0.1.0_darwin_amd64.tar.gz"
      sha256 "36182e5393bc71cc830956f2bc26bd060c14632373237cef71c5096c072958fc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/bide-ai/bide/releases/download/v0.1.0/bide-audit_0.1.0_darwin_arm64.tar.gz"
      sha256 "02e902fbacbcac300fba764a9de5fdfdbc11beabce52f97596e3b40183ed785c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.1.0/bide-audit_0.1.0_linux_amd64.tar.gz"
      sha256 "38fbec38a3e6e66a724278fbf794270152b6ca29121f45ec72c106f10d5b68f7"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bide-ai/bide/releases/download/v0.1.0/bide-audit_0.1.0_linux_arm64.tar.gz"
      sha256 "86eb14c659fb7e5993d390b9b391619222bf358292c656c2594a7fb3a9faed85"
    end
  end

  def install
    bin.install "bide-audit"
  end

  test do
    assert_match "verify", shell_output("#{bin}/bide-audit 2>&1 || true")
  end
end
