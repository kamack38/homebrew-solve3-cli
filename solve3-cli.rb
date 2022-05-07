require "language/node"

class Solve3Cli < Formula
  desc "CLI for solving problems at https://solve.edu.pl/"
  homepage "https://github.com/kamack38/solve3-cli"
  url "https://registry.npmjs.org/solve3-cli/-/solve3-cli-1.7.2.tgz"
  head "https://github.com/kamack38/solve3-cli.git", branch: "main"
  sha256 "623ccf73f8cd07a07c751763ec6250e64bb8db380e6379b832a3cc46e4a557ca"
  license "MIT"
  version "1.7.6"

  depends_on "openjdk@17"
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      Thanks for installing Solve3-CLI.
      If you're enjoying Solve3-CLI, feel free to buy me a coffee.
      https://ko-fi.com/kamack38
    EOS
  end

  test do
    system "#{bin}/solve3-cli", "--help"
  end
end
