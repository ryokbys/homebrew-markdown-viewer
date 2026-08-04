cask "markdown-viewer" do
  version "0.1.5"
  sha256 "46aa266ba2ea6d19e2678972bdcace00646596a32a5aa7a9b1b19ddb14fa3072"

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
