class Customer < ApplicationRecord
  include PersonalNameHolder
  include EmailHolder
  include PasswordHolder

  with_options(dependent: :destroy, autosave: true) do |r|
    r.has_one :home_address
    r.has_one :work_address
  end

  has_many :phones, dependent: :destroy
  has_many :personal_phones, -> { where(address_id: nil).order(:id) },
    class_name: "Phone", autosave: true

  validates :gender, inclusion: { in: %w(male female), allow_blank: true }
  validates :birthday, date: {
    after: Date.new(1900, 1, 1),
    before: ->(obj) { Date.today },
    allow_blank: true
  }
end
