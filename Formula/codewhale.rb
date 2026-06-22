class Codewhale < Formula
  desc "Terminal-native coding agent for any model — open models first"
  homepage "https://github.com/tanuki-cat/CodeWhale"
  version "0.8.63"
  license "MIT"
  revision 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-macos-arm64", using: :nounzip
      sha256 "2b2cf11cba64e89a4abbc948f3cfb2cb3881a0a18abc8e2662ebd244bfff5a40"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "3ef2a1bdbb1f5fd476e3206a98d61233c47f1e00e7850da4fa60ab761a9680e8"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-macos-x64", using: :nounzip
      sha256 "02b2a9563c6f0889392fedbffa21f7c419e05543fb986c634f5e0c0f22fef912"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-tui-macos-x64", using: :nounzip
        sha256 "1cbf1fd2f188781ff76317dcbb858fb6768c171fb7a994b4694eaa0ff2b3cb2f"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-linux-arm64", using: :nounzip
      sha256 "96f018c0cdd5a9749e975f3328c5289f07cd6a6d3f8f603280624198c42f3a4f"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "3d29192ac26b374be5de337332bd583b421ab5ac5b5919565f4239bb589d27fa"
      end
    else
      url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-linux-x64", using: :nounzip
      sha256 "edf641c7671522df554de6d31233baaa2bba382a420aee69d8bb738d0ba22bb1"
      resource "tui" do
        url "https://github.com/tanuki-cat/CodeWhale/releases/download/v0.8.63/codewhale-tui-linux-x64", using: :nounzip
        sha256 "49d930fda24eb728c04211be54be1bdd441acc5167dfab2fa8724ec9d4ade6ff"
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
