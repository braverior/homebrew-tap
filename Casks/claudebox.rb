cask "claudebox" do
  version "0.5.12"

  on_arm do
    url "https://github.com/braverior/ClaudeBox/releases/download/v#{version}/ClaudeBox_#{version}_aarch64.dmg"
    sha256 "d9cda4eaac198b428952e663b248e645df77e081ea6761ee89055d5cfdd25ed6"
  end

  on_intel do
    url "https://github.com/braverior/ClaudeBox/releases/download/v#{version}/ClaudeBox_#{version}_x64.dmg"
    sha256 "4c85f4544cb9866768d4758482e8dc4d094c55e5ed57a52acaa9f69a486a4c58"
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
