class Codewhale < Formula
  desc "Terminal-native coding agent for any model — open models first"
  homepage "https://github.com/tanuki-cat/CodeWhale"
  version "0.8.67"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.67/codewhale-macos-arm64", using: :nounzip
      sha256 "b4abf1e03bc5042c5bb5ce097116ce936f7ae607b5a69f3f3548eb0b36f3cf15"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.67/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "15338a3a97d833ee70ed79ee27911c534a897fc1ce55a2823474e8e59e8e5a6f"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.67/codewhale-macos-x64", using: :nounzip
      sha256 "1875ec9cf4f85af2ece07f30cf35ea646612dde3224165e4ee3169f322e91362"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.67/codewhale-tui-macos-x64", using: :nounzip
        sha256 "9aed8995f40853d53274529805f4cea4b8cddfcab56ba5ac487b57d4826696f1"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.67/codewhale-linux-arm64", using: :nounzip
      sha256 "58009ab4fdf6a26128e72b2547c9ea79cac8007bc329f6fddce87538295cf63f"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.67/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "ab7eaf56f9a43fbe09e189256a22297024315690444d0d2a73c94518c35c2241"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.67/codewhale-linux-x64", using: :nounzip
      sha256 "229661b39f6c2a0b913ad08564379b67b6f5d02eb2284fd9a3c0793812b4308b"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.67/codewhale-tui-linux-x64", using: :nounzip
        sha256 "ac38a13173f521283e80e67edca48e23af905d6148ef16e79889af70bc716413"
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
