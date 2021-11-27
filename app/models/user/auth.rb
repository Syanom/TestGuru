module User::Auth
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true, if: proc { |user| user.password_digest.blank? }
  end

  attr_reader :password
  attr_writer :password_confirmation

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
