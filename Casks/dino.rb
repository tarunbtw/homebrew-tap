cask "dino" do
  version "0.43"
  sha256 "2c791dc8023ecff311d4befd3dc30d4e25cbe589f203460bd07a74606d9c428c"

  url "https://github.com/tarunbtw/dino/releases/download/v#{version}/Dino-#{version}.zip"
  name "Dino"
  desc "Ultra-lightweight native macOS WebKit browser engine and agent runtime"
  homepage "https://github.com/tarunbtw/dino"

  depends_on macos: :ventura

  app "Dino.app"
  binary "#{appdir}/Dino.app/Contents/MacOS/dino", target: "dino"

  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Dino.app"]
    end
  end

  zap trash: [
    "~/.dino",
    "~/Library/Application Support/Dino",
    "~/Library/Caches/tarun.dino",
    "~/Library/Preferences/tarun.dino.plist",
    "~/Library/Saved Application State/tarun.dino.savedState"
  ]
end

