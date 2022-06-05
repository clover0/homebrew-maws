class Maws < Formula
  VERSION = '0.0.4'
  version VERSION
  homepage 'https://github.com/clover0/maws'


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clover0/maws/releases/download/v#{VERSION}/maws_#{VERSION}_darwin_arm64.tar.gz"
      sha256 "afef13b146d0d8c4f602c6ebbfa4f14d926623930d8014a87453b4135615c204"

      def install
        bin.install "maws"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/clover0/maws/releases/download/v#{VERSION}/maws_#{VERSION}_darwin_amd64.tar.gz"
      sha256 "968f42fa1bc4bc529be1a15e7f700aa5bd92465bd2752ba306619c3f9b58fcce"

      def install
        bin.install "maws"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/clover0/maws/releases/download/v#{VERSION}/maws_#{VERSION}_linux_amd64.tar.gz"
      sha256 "968f42fa1bc4bc529be1a15e7f700aa5bd92465bd2752ba306619c3f9b58fcce"

      def install
        bin.install "maws"
      end
    end
  end
  head 'https://github.com/clover0/maws.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'maws'
  end
end
