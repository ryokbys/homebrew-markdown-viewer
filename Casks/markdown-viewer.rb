cask "markdown-viewer" do
  version "0.1.4"
  sha256 "00486394eeb69150f7eda2e6d758879065c0f1d14f32ac64a26673d51ef01792"

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
