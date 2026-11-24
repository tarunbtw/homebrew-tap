cask "dino" do
  version "0.59"
  sha256 "f58938c6d935712fdd60c045d7c4a066ea5f60cdf06dba6865d6499578fb96fd"

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

