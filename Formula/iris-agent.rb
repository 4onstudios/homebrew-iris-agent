class IrisAgent < Formula
  desc "Standalone coding-agent service and CLI with ACP support"
  homepage "https://github.com/4onstudios/iris-agent"
  url "https://registry.npmjs.org/@4onstudios/iris-agent/-/iris-agent-0.2.9.tgz"
  sha256 "47877f122b00f1c41e4b233952052c458d9c87644826cf5cb194217dbc626ff9"
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
