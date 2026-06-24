class Codewhale < Formula
  desc "Terminal-native coding agent for any model — open models first"
  homepage "https://github.com/tanuki-cat/CodeWhale"
  version "0.8.64"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.64/codewhale-macos-arm64", using: :nounzip
      sha256 "08be8552d39fb1b5e51b3c2a0e96a9beeea64dd3a407eba7ec462555c46e4a3d"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.64/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "eb4b24f679d9e2537bf3263a51afa6eaec8475c72f32ff3f77627c8722a9fc83"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.64/codewhale-macos-x64", using: :nounzip
      sha256 "0ce8af48d2710085905ffb9528b187f33dc2ba9a6d89d6f8a4b927024ae9f7aa"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.64/codewhale-tui-macos-x64", using: :nounzip
        sha256 "001d80ff3d14720c5bc25adc1a213e4eda6c77e7f3235f6c9a03fe32de0e4cb3"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.64/codewhale-linux-arm64", using: :nounzip
      sha256 "cd818f84e4baa110b396eab7ea0b8db7c5ab12d065e01c51efd89b4931df2ee3"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.64/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "86e271090e8ba33cbd00eb42930fa19f7d1f50fee5c7e3e7329ccd017b57227e"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.64/codewhale-linux-x64", using: :nounzip
      sha256 "39c81ad15ade08b8f65b68ec9504ccb3f5b03cb44c4e2706af275cd1bd586419"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.64/codewhale-tui-linux-x64", using: :nounzip
        sha256 "8f77c1475e15265e1266edc8617778d6ca99f8ebfcd8bf17d7efaa778f2463c2"
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
