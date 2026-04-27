class ClaudesJournal < Formula
  desc "Give Claude a journal — session continuity for Claude Code"
  homepage "https://github.com/ek33450505/cast-claudes_journal"
  url "https://github.com/ek33450505/cast-claudes_journal/archive/refs/tags/v0.2.0.tar.gz"
  version "0.2.0"
  sha256 "ea784b4544d523e1b31b9153fa128dd4a8c41779c07cc617689c926b67e2f6e7"
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
        ~/.claude/claudes-corner/

      To reflect at the end of a session, use the /reflect slash command
      inside Claude Code, or ask Claude to reflect on the session.
    EOS
  end

  test do
    assert_predicate prefix/"install.sh", :exist?
  end
end
