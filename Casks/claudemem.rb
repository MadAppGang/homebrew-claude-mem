cask "claudemem" do
  version "0.1.0"

  on_arm do
    url "https://github.com/MadAppGang/claudemem/releases/download/v#{version}/claudemem-darwin-arm64"
    sha256 "PLACEHOLDER_ARM64"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudemem/releases/download/v#{version}/claudemem-darwin-x64"
    sha256 "PLACEHOLDER_X64"
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
