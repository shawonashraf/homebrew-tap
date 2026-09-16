cask "slurmer" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "de1407d00609eee7b73a3c629747437ed4748e26691d499e92786000eb5b1d42",
         intel: "53ba725f38d50f4f3607b84a5aef1b4fafbb88e24824e6ea0c1e686b14ee55f9"

  url "https://github.com/shawonashraf/slurmer/releases/download/v#{version}/slurmer_#{version}_#{arch}.dmg"
  name "slurmer"
  desc "Slurm job queue viewer for HPC clusters, fetched over ssh"
  homepage "https://github.com/shawonashraf/slurmer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "slurmer.app"

  # Release builds are ad-hoc signed and not notarized, so Gatekeeper reports
  # the app as damaged on first launch unless the quarantine flag is removed.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/slurmer.app"]
  end

  uninstall quit: "org.shawonashraf.slurmer"

  zap trash: [
    "~/Library/Application Support/org.shawonashraf.slurmer",
    "~/Library/Caches/slurmer",
    "~/Library/Saved Application State/org.shawonashraf.slurmer.savedState",
    "~/Library/WebKit/slurmer",
  ]

  caveats <<~EOS
    slurmer is not notarized. This cask removes the quarantine attribute from
    slurmer.app after installing, so macOS does not report it as damaged.
  EOS
end
