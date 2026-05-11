cask "claudebox" do
  version "0.5.9"

  on_arm do
    url "https://github.com/braverior/ClaudeBox/releases/download/v#{version}/ClaudeBox_#{version}_aarch64.dmg"
    sha256 "658c8d1d2dbf20b7f489d82e94a108514d482ce2241a7efec934f92ca0772932"
  end

  on_intel do
    url "https://github.com/braverior/ClaudeBox/releases/download/v#{version}/ClaudeBox_#{version}_x64.dmg"
    sha256 "5a6f7c6d710179bcb96a47038063fa1702a45bda32d83dbaec1545b63df32b1d"
  end

  name "ClaudeBox"
  desc "Native desktop GUI for Claude Code"
  homepage "https://github.com/braverior/ClaudeBox"

  # The app ships its own Tauri updater, so Homebrew should not manage updates.
  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "ClaudeBox.app"

  zap trash: [
    "~/.claudebox",
    "~/Library/Application Support/com.claudebox.desktop",
    "~/Library/Caches/com.claudebox.desktop",
    "~/Library/Preferences/com.claudebox.desktop.plist",
    "~/Library/Saved Application State/com.claudebox.desktop.savedState",
  ]
end
