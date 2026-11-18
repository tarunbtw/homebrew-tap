cask "dino" do
  version "0.47"
  sha256 "f96c66fb624e359c2d941ab68a3521f107601ecceb123c815889b35644d59055"

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

