class Coveragecat < Formula
  desc "Official Coverage Cat CLI for discovery, MCP, and agent-operable API requests"
  homepage "https://www.coveragecat.com/developers/cli"
  url "https://github.com/Coverage-Cat/coveragecat-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7108e1fd16fef9fc27728203ea653196410c3d9eadca12aa34a74515c26a9dfb"
  head "https://github.com/Coverage-Cat/coveragecat-cli.git", branch: "main"

  depends_on "node"

  def install
    pkgshare.install "bin", "lib", "package.json", "README.md"

    chmod 0o755, pkgshare/"bin/coveragecat.js"
    bin.install_symlink pkgshare/"bin/coveragecat.js" => "coveragecat"
  end

  test do
    assert_match "Official Coverage Cat CLI", shell_output("#{bin}/coveragecat help")
  end
end
