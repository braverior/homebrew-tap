cask "claudebox" do
  version "0.5.7"

  on_arm do
    url "https://github.com/braverior/ClaudeBox/releases/download/v#{version}/ClaudeBox_#{version}_aarch64.dmg"
    sha256 "c9611fbcfbc4675982ee340439de17a08c29adb3d97b31986db4affe2259688d"
  end

  on_intel do
    url "https://github.com/braverior/ClaudeBox/releases/download/v#{version}/ClaudeBox_#{version}_x64.dmg"
    sha256 "6656c4ba1ba0cce6b50451e480650d4759e6d670099a9e1715381e2eda20faf2"
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
