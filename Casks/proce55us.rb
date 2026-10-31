cask "proce55us" do
  version :latest
  sha256 :no_check

  url "https://github.com/gaelhugo/ECAL_MID_1_2027/releases/latest/download/proce55us-universal.dmg"
  name "proce55us"
  desc "Creative-coding atelier: prompt-driven notebook for JavaScript, p5.js, three.js and DOM"
  homepage "https://proce55us.com/"

  app "proce55us.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/proce55us.app"]
  end

  zap trash: [
    "~/Library/Application Support/proce55us",
    "~/Library/Preferences/ch.ecal.proce55us.plist",
  ]
end
