cask "claudemem" do
  version "0.9.0"

  on_arm do
    url "https://github.com/MadAppGang/claudemem/releases/download/v#{version}/claudemem-darwin-arm64"
    sha256 "84b6ab1a6d776c610576d4edd1becf49c55a844f3a58d3f2b0690d5e30e71755"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudemem/releases/download/v#{version}/claudemem-darwin-x64"
    sha256 "a02d8cae29d034c412a87a0821ba8c31298f452566743043e3ca516a6801bf8f"
  end

  name "claudemem"
  desc "Local code indexing with semantic search for Claude Code"
  homepage "https://github.com/MadAppGang/claudemem"

  binary "claudemem-darwin-#{Hardware::CPU.arch == :arm64 ? 'arm64' : 'x64'}", target: "claudemem"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.claudemem",
    "~/.config/claudemem",
  ]
end
