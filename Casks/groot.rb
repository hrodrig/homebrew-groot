# Bootstrap cask for hrodrig/homebrew-groot.
# GoReleaser overwrites this file on every groot release tag.
# Manual updates: scripts/update-homebrew-cask.sh in the groot repo.

cask "groot" do
  version "{{VERSION}}"
  sha256 "{{SHA256}}"

  url "https://github.com/hrodrig/groot/releases/download/v#{version}/groot_v#{version}_{{arch}}.tar.gz"
  name "groot"
  desc "Read-only log and context collector for Kubernetes"
  homepage "https://github.com/hrodrig/groot"

  livecheck do
    url :stable
    strategy :github_latest_release
  end

  binary "groot"

  zap trash: "~/.config/groot"

  caveats <<~EOS
    Sample configuration is not bundled with the Homebrew cask.
    Copy from the upstream repo or generate with
    `groot --print-sample-config > ~/.config/groot/groot.yml`.
  EOS
end
