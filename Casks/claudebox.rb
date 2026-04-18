cask "claudebox" do
  version "0.4.1"

  on_arm do
    url "https://github.com/braverior/ClaudeBox/releases/download/v#{version}/ClaudeBox_#{version}_aarch64.dmg"
    sha256 "c6038fb07fee95a78703fd372f5977a863b0d2401c77a57e99f3cb86f19354b1"
  end

  on_intel do
    url "https://github.com/braverior/ClaudeBox/releases/download/v#{version}/ClaudeBox_#{version}_x64.dmg"
    sha256 "4e8e6ee15e2ffbff9c26fdfcdc814cbf8c236303e87b4fc2c7913bb4973b1e7c"
  end

  name "ClaudeBox"
  desc "Native desktop GUI for Claude Code"
  homepage "https://github.com/braverior/ClaudeBox"

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
