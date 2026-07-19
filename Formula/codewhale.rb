class Codewhale < Formula
  desc "Terminal-native coding agent for any model — open models first"
  homepage "https://github.com/tanuki-cat/CodeWhale"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.9.1/codewhale-macos-arm64", using: :nounzip
      sha256 "7c8e4fdd4d32361eb633e4d566a610b1dff53ec769c10cfb4a57da8867a3b6d3"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.9.1/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "ea1e71bf7b6afdf08db107bb4bace5c143ff235aedadc42866d16d527e82e870"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.9.1/codewhale-macos-x64", using: :nounzip
      sha256 "584aa72f901dec7c523e8235526d24b23168910e3838b5406d19e6fa58945a07"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.9.1/codewhale-tui-macos-x64", using: :nounzip
        sha256 "3827d418053c81c70721705d5ab726d33bb00cd00d3b4fd01a70b8e9855f3a0e"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.9.1/codewhale-linux-arm64", using: :nounzip
      sha256 "d69d40984ccc39b4e7e9d81da74d55546595e9652c42786d1d936377c9c311bd"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.9.1/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "389ff4611447a5dd0d5c451b5a9f76b7333bcb1fb24e3cd10fb96beedf43f533"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.9.1/codewhale-linux-x64", using: :nounzip
      sha256 "456e7502adff189e89b9ae9d5c620e85850aef08bc66306d6dc597b74dd831fc"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.9.1/codewhale-tui-linux-x64", using: :nounzip
        sha256 "19550734c33054b074b808ee37263acf41d0739e15c6fa2230e0a1272431d807"
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
