class IrisAgent < Formula
  desc "Standalone coding-agent service and CLI with ACP support"
  homepage "https://github.com/4onstudios/iris-agent"
  url "https://registry.npmjs.org/@4onstudios/iris-agent/-/iris-agent-0.2.8.tgz"
  sha256 "fd4fb0a2269c0866d925af518ff238ce2f5023cf5241f508711038193938711f"
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
