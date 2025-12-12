cask "claudemem" do
  version "0.1.5"

  on_arm do
    url "https://github.com/MadAppGang/claudemem/releases/download/v#{version}/claudemem-darwin-arm64"
    sha256 "52db542782efaa6b29ef9e24a7fdcddf8adefb7684ba5398132ae430979afffb"
  end

  on_intel do
    url "https://github.com/MadAppGang/claudemem/releases/download/v#{version}/claudemem-darwin-x64"
    sha256 "7169cb35e9936577969463f89720b2517e0992be6e5b0bbf29cad569997d80a7"
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
