cask "markdown-viewer" do
  version "0.1.6"
  sha256 "fed51a2952bb6c4e1a1457ffc4c87cea81373ec3983a038c57d686403000a81c"

  url "https://github.com/ryokbys/markdown-viewer/releases/download/v#{version}/Markdown.Viewer_#{version}_aarch64.dmg"
  name "Markdown Viewer"
  desc "View-only Markdown reader for macOS"
  homepage "https://github.com/ryokbys/markdown-viewer"

  depends_on arch: :arm64

  app "Markdown Viewer.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Markdown Viewer.app"]
  end

  binary "#{appdir}/Markdown Viewer.app/Contents/MacOS/markdown-viewer", target: "mdv"
end
