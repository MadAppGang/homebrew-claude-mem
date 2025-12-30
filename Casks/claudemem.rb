cask "claudemem" do
  version "0.11.0"

  on_arm do
    url "https://github.com/MadAppGang/claudemem/releases/download/v#{version}/claudemem-darwin-arm64"
    sha256 "eecdb9c030595798246a7de2660c4186027db9279f50159ddf8affbb0b673aba"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudemem/releases/download/v#{version}/claudemem-darwin-x64"
    sha256 "5c3cf84da98cbe8db5fbafded0e2af90ff5f18bb78e8b3c4faae79b9a29d104a"
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
