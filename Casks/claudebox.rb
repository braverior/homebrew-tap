cask "claudebox" do
  version "0.5.6"

  on_arm do
    url "https://github.com/braverior/ClaudeBox/releases/download/v#{version}/ClaudeBox_#{version}_aarch64.dmg"
    sha256 "30c0b25b8739215e4f2a03f8c3147f0ab0dbf97a4ae1344024f04280a033d9ff"
  end

  on_intel do
    url "https://github.com/braverior/ClaudeBox/releases/download/v#{version}/ClaudeBox_#{version}_x64.dmg"
    sha256 "ae9a0fdb86076e6513954bd1ba817617b6555629e329f3c352a42806618c8d95"
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
