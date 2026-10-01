class Mobie < Formula
  desc "Install Mobile Engineering Agents into a project for your AI coding tools"
  homepage "https://github.com/sokpichdev/mobie"
  url "https://registry.npmjs.org/@sok_pich/mobie/-/mobie-1.0.0.tgz"
  sha256 "e98340289e95b6459ba2eae66d4fb8b70de76c44ec2c7bf37f90b9aaa176ed62"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mobie --version")
    touch "Package.swift"
    system bin/"mobie", "init", "--yes"
    assert_path_exists testpath/".mobile-agents/AGENTS.md"
  end
end
