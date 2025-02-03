module ApplicationHelper
  def app_version
    sha = ENV["KAMAL_VERSION"].presence || `git rev-parse HEAD`.chomp
    "v#{SemanticRelease.current_version}-g#{sha[0..7]}"
  end
end
