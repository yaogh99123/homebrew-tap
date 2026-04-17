# typed: false
# frozen_string_literal: true

class PhpantomLsp < Formula
  desc "A fast PHP Language Server written in Rust"
  homepage "https://github.com/yaogh99123/phpantom_lsp"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yaogh99123/phpantom_lsp/releases/download/brew-tap/phpantom_lsp-x86_64-apple-darwin.tar.gz"
      sha256 "f3fac87e7a237d0f0c7671dec07056e2264d1304a1ba6f73ce2ecc386f4ee316"

      def install
        bin.install "phpantom_lsp"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/yaogh99123/phpantom_lsp/releases/download/brew-tap/phpantom_lsp-aarch64-apple-darwin.tar.gz"
      sha256 "2d24cc5d008b8e7c579a007e036bee17f1fc0773a25f19647aef0284ec956942"

      def install
        bin.install "phpantom_lsp"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/yaogh99123/phpantom_lsp/releases/download/brew-tap/phpantom_lsp-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c2d037798838e3340982faa79d2b143e4dc4cbfdfd6f3867694937cad40e0afe"

      def install
        bin.install "phpantom_lsp"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/yaogh99123/phpantom_lsp/releases/download/brew-tap/phpantom_lsp-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "561499de77e7b3602fa8d9698f5c9836bb0c80df2940f28927daab52dbc6ed1e"

      def install
        bin.install "phpantom_lsp"
      end
    end
  end

  test do
    system "#{bin}/phpantom_lsp", "--version"
  end
end
