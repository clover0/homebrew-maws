class Maws < Formula
  VERSION = '0.0.5'
  version VERSION
  homepage 'https://github.com/clover0/maws'


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clover0/maws/releases/download/v#{VERSION}/maws_#{VERSION}_darwin_arm64.tar.gz"
      sha256 "572258d0b9da29863742566105833afac5f9a45708c08eced310c7b4deaedfec"

      def install
        bin.install "maws"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/clover0/maws/releases/download/v#{VERSION}/maws_#{VERSION}_darwin_amd64.tar.gz"
      sha256 "3c4b1abe2a3e995f5750e513587744d2b43aa18d60c1c2ef40ea6e8a69233dc7"

      def install
        bin.install "maws"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/clover0/maws/releases/download/v#{VERSION}/maws_#{VERSION}_linux_amd64.tar.gz"
      sha256 "21b812bf219c2860056645e7cbe25d73f972e9bafeec6d034ec61f52f0cc0757"

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
