cask "claudemem" do
  version "0.1.2"

  on_arm do
    url "https://github.com/MadAppGang/claudemem/releases/download/v#{version}/claudemem-darwin-arm64"
    sha256 "c5bfe55dd53b76644ad9b853f44322fc9dd9136e6024bfc9473281d192ed999a"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudemem/releases/download/v#{version}/claudemem-darwin-x64"
    sha256 "75ade1f36ddf757ecef8ee2f8cc74e149d82f9e940262bd13794214a943c6dae"
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
