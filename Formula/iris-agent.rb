class IrisAgent < Formula
  desc "Standalone coding-agent service and CLI with ACP support"
  homepage "https://github.com/4onstudios/iris-agent"
  url "https://registry.npmjs.org/@4onstudios/iris-agent/-/iris-agent-0.2.4.tgz"
  sha256 "bb58a1b4da0b7a19a03ae0d852ec6a11955ae3efa2a1d4c1ec2502b18a291bf0"
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
