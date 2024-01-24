# frozen_string_literal: true

require_relative "repo_sync/version"
require_relative "repo_sync/repo_names"
require_relative "repo_sync/repo_dir"

module RepoSync
  class Error < StandardError; end

  def self.sync_repos
    Dir.chdir "#{Dir.home}/projects" do
      REPO_NAMES.each do |dir_name|
        RepoDir.new(dir_name).sync
        puts "\n\n\n"
      end
    end
  end
end
