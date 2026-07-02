class Codewhale < Formula
  desc "Terminal-native coding agent for any model — open models first"
  homepage "https://github.com/tanuki-cat/CodeWhale"
  version "0.8.66"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.66/codewhale-macos-arm64", using: :nounzip
      sha256 "762b412d28d1ebdfda9b6b46bbe3c051b398497455d6b3ec38e7cb2041325742"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.66/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "6568320b10d59c58fb01842a4e18d181a58771280afb801043bd149c3727c769"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.66/codewhale-macos-x64", using: :nounzip
      sha256 "2165eeb55357259c4337919a28f7ce7527c7665e3c97ed1f594df172067190f6"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.66/codewhale-tui-macos-x64", using: :nounzip
        sha256 "37c8cd46e4d40f1add553952b6e847cc2d0d06fd78b7798312db8b38bff6162a"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.66/codewhale-linux-arm64", using: :nounzip
      sha256 "216721e404909591f40690fdb4376fa05a789926d39d6176bd36ab7a0f3a3609"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.66/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "d276b4b578a058b9f5f8084f860ab110093611a14334385a27b17fd5d0454089"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.66/codewhale-linux-x64", using: :nounzip
      sha256 "f3bf032b90409b0f51613e6ff4a4cc960e622412d21242ba8a819e655383347d"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.66/codewhale-tui-linux-x64", using: :nounzip
        sha256 "9baeb53bfff8015a3579d5f0089cd5affa5f78773f43893f0859adfbfc59e8cc"
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
