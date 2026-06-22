class Codewhale < Formula
  desc "Terminal-native coding agent for any model — open models first"
  homepage "https://github.com/tanuki-cat/CodeWhale"
  version "0.8.63"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-macos-arm64", using: :nounzip
      sha256 "a504a2a7396a7b6fb0b2d62b74ec74e3b58f33fa2b2c6dee76abbffb79caa621"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "dbb72cfa1719cedbd599843de08c8b481893b04accb1b5bf07a2afdb4383fbe8"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-macos-x64", using: :nounzip
      sha256 "83ea91af0d6556d1acf9302aa1762d55832f1a77270c3f7586a72138c1554d18"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-tui-macos-x64", using: :nounzip
        sha256 "dd90d41a6298fbd153dcfd9fad5813bb9361739c89b01f2f71a8976c9eaf8bf4"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-linux-arm64", using: :nounzip
      sha256 "63474192f800046effb0527a80601cbb4803963b0c8faa1cda30c41d676522e3"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "94f70d2b391e27be6c5aa740e37aebdce7b3d0866eeaf31475beb501c682f40b"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-linux-x64", using: :nounzip
      sha256 "bf39f88088f831a5c6a19c0eaed32394e0595c5c4fc0a1db5fdbdaa57dd46095"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-tui-linux-x64", using: :nounzip
        sha256 "d8d9a14b3eeb5529da5d8cf5f6f8066cf25586c7c1ec03f189ff71a1fd816384"
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
