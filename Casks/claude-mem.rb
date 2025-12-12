cask "claude-mem" do
  version "0.1.0"

  on_arm do
    url "https://github.com/MadAppGang/claudemem/releases/download/v#{version}/claude-mem-darwin-arm64"
    sha256 "PLACEHOLDER_ARM64"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudemem/releases/download/v#{version}/claude-mem-darwin-x64"
    sha256 "PLACEHOLDER_X64"
  end

  name "claude-mem"
  desc "Local code indexing with semantic search for Claude Code"
  homepage "https://github.com/MadAppGang/claudemem"

  binary "claude-mem-darwin-#{Hardware::CPU.arch == :arm64 ? 'arm64' : 'x64'}", target: "claude-mem"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.claude-mem",
    "~/.config/claude-mem",
  ]
end
