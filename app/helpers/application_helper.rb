module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repository)
    link_to 'Github', "https://github.com/#{author}/#{repository}", target: '_blank'
  end
end
