# typed: false
# frozen_string_literal: true

class SystemdLsp < Formula
  desc "Language Server for systemd unit files"
  homepage "https://github.com/yaogh99123/systemd-lsp"
  version "2026.04.18"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yaogh99123/systemd-lsp/releases/download/v2026.04.18/systemd-lsp-x86_64-apple-darwin"
      sha256 "fa20bc3dc90a8d3e52a92e9c066b833a251efbea1574acabbb71f993d99416d6"

      def install
        bin.install "systemd-lsp-x86_64-apple-darwin" => "systemd-lsp"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/yaogh99123/systemd-lsp/releases/download/v2026.04.18/systemd-lsp-aarch64-apple-darwin"
      sha256 "89f4df08de72e8071949abc81ca4904157cad14efd530ae1db8997a7c7952553"

      def install
        bin.install "systemd-lsp-aarch64-apple-darwin" => "systemd-lsp"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/yaogh99123/systemd-lsp/releases/download/v2026.04.18/systemd-lsp-x86_64-unknown-linux-gnu"
      sha256 "cad8eae6c0c3800efa3ae104f15059ffe089f1498d584f19f2689aade57b3cc"

      def install
        bin.install "systemd-lsp-x86_64-unknown-linux-gnu" => "systemd-lsp"
      end
    end
  end

  test do
    system "#{bin}/systemd-lsp", "--version"
  end
end
