class Owner < ApplicationRecord
  before_save :normalize_phone_number

  validates :first_name, :last_name, :email, presence: true, length: { maximum: 255 }

  validates :email, uniqueness: true,
                    inclusion: { in: %w[@] }
  # format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  def normalize_phone_number
    return false unless phone.present?
    phone.gsub!(/^1/, '')
    phone.gsub!(/[()-.]/, '')
  end
end
