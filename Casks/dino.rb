cask "dino" do
  version "0.53"
  sha256 "db88fe2db7d82295113c2a8c3539bdf24a952bba984b20b17bd138f251cc0c6a"

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

