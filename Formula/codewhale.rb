class Codewhale < Formula
  desc "Terminal-native coding agent for any model — open models first"
  homepage "https://github.com/tanuki-cat/CodeWhale"
  version "0.8.62"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.62/codewhale-macos-arm64", using: :nounzip
      sha256 "566f7d71a43740b0aee583398654c1a82e38c5ee6d0b087a4c4c69dfe7e28755"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.62/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "328dc22e77898d848e5863372b4b599771b7bdb427376fe8b4245f47fd858050"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.62/codewhale-macos-x64", using: :nounzip
      sha256 "f52f0000f72cda28504827b38b6d5899fa6fcc2c2c7255f3f6e5bf1314b13c78"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.62/codewhale-tui-macos-x64", using: :nounzip
        sha256 "53f5aced70b791f522b725cdc540a3fc887ef1d05d19fc21140839e56487afa7"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.62/codewhale-linux-arm64", using: :nounzip
      sha256 "17b3d1306a019a5f0b8d4c9c8401681090c76503d0255a0db25e25b5c06d73e7"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.62/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "01eb7fec7fd7dba099c7585a3378de275f57efc6867e03838a19d16555a0ae46"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.62/codewhale-linux-x64", using: :nounzip
      sha256 "f67ff9ab55ffbcc82d3b2aa6e5ec61071a891bbd6dbf0d349f6a8189009bec7a"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.62/codewhale-tui-linux-x64", using: :nounzip
        sha256 "5ba4397094a33eefc192c20f1998102b57c61b8f82c67b89bf678c34e849d4dd"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "codewhale"
    resource("tui").stage { bin.install Dir["*"].first => "codewhale-tui" }
  end

  test do
    system "#{bin}/codewhale", "--version"
  end
end
