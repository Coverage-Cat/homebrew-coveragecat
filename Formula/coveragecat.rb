class Coveragecat < Formula
  desc "Official Coverage Cat CLI for discovery, MCP, and agent-operable API requests"
  homepage "https://www.coveragecat.com/developers/cli"
  url "https://github.com/Coverage-Cat/coveragecat-cli/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "f632dd1dfcde110ff87ad8e5c63061bc4eddcaf8fa92a235eed3e839630bb307"
  head "https://github.com/Coverage-Cat/coveragecat-cli.git", branch: "main"

  depends_on "node"

  def install
    pkgshare.install "bin", "lib", "package.json", "README.md"

    chmod 0o755, pkgshare/"bin/coveragecat.js"
    bin.install_symlink pkgshare/"bin/coveragecat.js" => "coveragecat"
  end

  test do
    help = shell_output("#{bin}/coveragecat help")
    assert_match "Official Coverage Cat CLI", help
    assert_match "coveragecat feedback", help
    assert_equal "0.1.3", shell_output("#{bin}/coveragecat version").strip
  end
end
