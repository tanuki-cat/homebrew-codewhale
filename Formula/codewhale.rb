class Codewhale < Formula
  desc "Terminal-native coding agent for any model — open models first"
  homepage "https://github.com/tanuki-cat/CodeWhale"
  version "0.8.61"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.61/codewhale-macos-arm64", using: :nounzip
      sha256 "5669f80032ca2d993dfac306091e990236b82516c0359d6de12c3364b1c39a4d"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.61/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "4e74d9a4b629882751be364150bca78f03e66c1fca36ab77286b614777037de6"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.61/codewhale-macos-x64", using: :nounzip
      sha256 "eba30e3a8756c837544dfdda200fe737987155c6a076ec1b73a7325a804a8013"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.61/codewhale-tui-macos-x64", using: :nounzip
        sha256 "68243be543f21011f1e190353f09ce103a724b7e9dfa2b2eec7ace4b3bf1bf26"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.61/codewhale-linux-arm64", using: :nounzip
      sha256 "a710c836bd590f32caa6999f4d2a796b0b440b2e055db86c55a1a6a4673ced1d"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.61/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "8ca0dc5f315678f226f677040afac06ef27088384b6db08619f2456ea3ac27e6"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.61/codewhale-linux-x64", using: :nounzip
      sha256 "fe127159038afa86167d62ded2ce0d553a736aac8fd9678400a30abe2cbec100"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.61/codewhale-tui-linux-x64", using: :nounzip
        sha256 "1039759098d31446fbf3e0619de2f3327cccf945432dd737ae573492935d699b"
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
