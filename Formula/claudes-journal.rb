class ClaudesJournal < Formula
  desc "Give Claude a journal — session continuity for Claude Code"
  homepage "https://github.com/ek33450505/cast-claudes_journal"
  url "https://github.com/ek33450505/cast-claudes_journal/archive/refs/tags/v0.4.2.tar.gz"
  version "0.4.2"
  sha256 "a5dadd9f5046f43b34f313cb5acd4be3df055b9955462b9d1e6699881ee6443a"
  license "MIT"

  def install
    prefix.install "install.sh"
    prefix.install "uninstall.sh"
    prefix.install "VERSION"
    libexec.install Dir["scripts/*"]
    libexec.install Dir["config/*"]
    libexec.install Dir["rules/*"]
    (libexec/"skills").install Dir["skills/*"]
  end

  def caveats
    <<~EOS
      Claude's Journal files are staged at #{libexec}.
      To complete installation (copies scripts, rules, and config into ~/.claude/):
        bash #{prefix}/install.sh

      To uninstall:
        bash #{prefix}/uninstall.sh

      Journal entries are stored at:
        ~/Documents/Claude/

      To reflect at the end of a session, use the /reflect slash command
      inside Claude Code, or ask Claude to reflect on the session.
    EOS
  end

  test do
    assert_predicate prefix/"install.sh", :exist?
  end
end
