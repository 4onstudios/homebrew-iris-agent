class IrisAgent < Formula
  desc "Standalone coding-agent service and CLI with ACP support"
  homepage "https://github.com/4onstudios/iris-agent"
  url "https://registry.npmjs.org/@4onstudios/iris-agent/-/iris-agent-0.3.0.tgz"
  sha256 "d9511753421b820220279a5d581265d0fc91226e644a6fad6a81a824d7ba62f2"
  license "MIT"

  depends_on "node@22"

  def install
    ENV["PATH"] = "#{formula_opt_bin("node@22")}:#{ENV["PATH"]}"

    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/iris-agent"
  end

  test do
    assert_match "Options", shell_output("#{bin}/iris-agent --help")
  end
end
