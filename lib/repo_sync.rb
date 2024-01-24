# frozen_string_literal: true

require_relative "repo_sync/version"

module RepoSync
  class Error < StandardError; end

  def self.sync_repos
    #Dir.chdir "#{Dir.home}/projects" do
      #REPO_LIST.each do |dir_name|
        #RepoDir.new(dir_name).sync
        #puts "\n\n\n"
      #end
    #end
  end
end
