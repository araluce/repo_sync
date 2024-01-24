require_relative "reporter"
require_relative "command"

module RepoSync
  class RepoDir
    attr_reader :dir_name, :reporter, :command

    def initialize(dir_name)
      @dir_name = dir_name
      @reporter = Reporter.new(self)
      @command  = Command.new(self)
    end

    def branch
      @branch ||= command.current_branch
    end

    def sync
      Dir.chdir dir_name do
        reporter.announce_update
        return reporter.invalid_branch_msg if on_invalid_branch?

        reporter.announce("fetching")
        command.fetch_upstream

        reporter.announce("pulling")
        command.pull_upstream
        return reporter.failed_pull_msg unless $?.success?

        reporter.announce("pushing", "to", "origin")
        command.push_to_origin
        reporter.announce_success
      end
    end

    def on_invalid_branch?
      !branch.match?(/(main|master)/)
    end
  end
end
