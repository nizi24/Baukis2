class Customer < ApplicationRecord
  with_options(dependent: :destroy) do |r|
    r.has_one :home_address
    r.has_one :work_address
  end

  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end
end
