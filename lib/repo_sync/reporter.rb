module RepoSync
  class Reporter
    attr_reader :repo_dir

    def initialize(repo_dir)
      @repo_dir = repo_dir
    end

    def announce_update
      msg = "Updating -> #{repo_dir.dir_name} | #{repo_dir.branch} branch"
      border = calculate_border_for("=", msg)
      output_border_and_msg(border, msg)
    end

    def invalid_branch_msg
      msg = "You are not on the main/master branch. Please, checkout the main/master branch and try again."
      sub_msg = "------> skipping #{repo_dir.dir_name} | #{repo_dir.branch} branch <-----"
      border = calculate_border_for("*", msg)

      output_border_and_msg(border, msg, sub_msg)
    end

    def announce(action, direction = "from", remote = "upstream")
      puts "-----> #{action} #{direction} #{remote} #{repo_dir.branch}"
    end

    def failed_pull_msg
      msg = "-----> Failed to pull upstream #{repo_dir.branch}. Moving on to next repo. <-----"
      border = calculate_border_for("*", msg)

      output_border_and_msg(border, msg)
    end

    def announce_success
      puts "-----> Successfully updated #{repo_dir.dir_name} | #{repo_dir.branch} branch"
    end

    private

    def calculate_border_for(border_char, msg)
      border_char * (msg.length + 20)
    end

    def output_border_and_msg(border, msg, sub_msg = nil)
      puts border
      puts msg.center(border.length)
      puts sub_msg.center(border.length) if sub_msg
      puts border
    end
  end
end
