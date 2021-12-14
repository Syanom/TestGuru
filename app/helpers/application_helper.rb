module ApplicationHelper
  BOOTSTRAP_FLASH = {
    success: 'alert-success',
    notice: 'alert-success',
    alert: 'alert-warning',
    error: 'alert-danger'
  }.freeze

  def bootstrap_flash(key)
    BOOTSTRAP_FLASH.fetch(key.to_sym, key)
  end

  def current_year
    Date.current.year
  end

  def github_url(author, repository)
    link_to 'Github', "https://github.com/#{author}/#{repository}", target: '_blank', class: 'text-muted'
  end
end
