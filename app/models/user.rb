class User < ApplicationRecord
  validates :name,
            presence: true,
            length: { maximum: 50 }
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

  def as_json(*)
    super(only: %i[id email name])
  end
end
