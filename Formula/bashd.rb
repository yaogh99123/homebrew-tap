# typed: false
# frozen_string_literal: true

class Bashd < Formula
  desc "A specialized bash language server / daemon"
  homepage "https://github.com/yaogh99123/bashd"
  version "0.11.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yaogh99123/bashd/releases/download/v0.11.1/bashd-v0.11.1-darwin-amd64.tar.gz"
      sha256 "f0a36e6e01c5c6982cb2d59dd4b2d99bbedeaf4d9ff567e5eb892a158e729e1b"

      def install
        bin.install "bashd"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/yaogh99123/bashd/releases/download/v0.11.1/bashd-v0.11.1-darwin-arm64.tar.gz"
      sha256 "bfadc67477361ca3e39d9a8b1fe8dbed3c358b5f4643b0e3a76530e346b07429"

      def install
        bin.install "bashd"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/yaogh99123/bashd/releases/download/v0.11.1/bashd-v0.11.1-linux-amd64.tar.gz"
      sha256 "209a3b154c9efbf20ae1b50199b861027314c9b49813e012c5228d7dea75581e"

      def install
        bin.install "bashd"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/yaogh99123/bashd/releases/download/v0.11.1/bashd-v0.11.1-linux-arm64.tar.gz"
      sha256 "6dc68e73e0718226a5fa985d9ed645c8823e71c6abf69b6ae7a154ba80af6ba2"

      def install
        bin.install "bashd"
      end
    end
  end

  test do
    system "#{bin}/bashd", "--version"
  end
end
