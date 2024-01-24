module RepoSync
  class Command
    attr_reader :repo_dir

    def initialize(repo_dir)
      @repo_dir = repo_dir
    end

    def current_branch
      `git branch --show-current`.strip
    end

    def fetch_upstream
      `git fetch upstream #{repo_dir.branch} 2>&1`
    end

    def pull_upstream
      `git pull upstream #{repo_dir.branch} 2>&1`
    end

    def push_to_origin
      `git push origin #{repo_dir.branch} 2>&1`
    end
  end
end
