require 'rails_helper'

RSpec.describe Administrator, type: :model do

  describe "#password=" do
    example "文字列を与えると、長さ60のhashed_passwordを生成すること" do
      administrator = Administrator.new
      administrator.password = "foobar"
      expect(administrator.hashed_password).to be_kind_of(String)
      expect(administrator.hashed_password.size).to eq 60
    end

    example "nilを与えると、hashed_passwordはnilになること" do
      administrator = Administrator.new(password: "foobar")
      administrator.password = nil
      expect(administrator.hashed_password).to eq nil
    end
  end
end
