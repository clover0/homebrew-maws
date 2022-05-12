class Maws < Formula
  version '0.0.3'
  homepage 'https://github.com/clover0/maws'

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clover0/maws/releases/download/v0.0.3/maws_0.0.3_darwin_arm64.tar.gz"
      sha256 "7bbee49a62ed36e62173ad42dbc11fc7b5a7d2ee6d7d9802c61bae1b8a59596d"

      def install
        bin.install "cgapp"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/clover0/maws/releases/download/v0.0.3/maws_0.0.3_darwin_amd64.tar.gz"
      sha256 "957d0420042e82182a50dac5ca0637b52202cfc9ef73f62c7806a7be1887749f"

      def install
        bin.install "cgapp"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/clover0/maws/releases/download/v0.0.3/maws_0.0.3_linux_amd64.tar.gz"
      sha256 "ba33c0991abfe45a2953371f64116fd13838e107cd4373516af97b754fb6f77a"

      def install
        bin.install "cgapp"
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
