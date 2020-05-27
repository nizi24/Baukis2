require "rails_helper"

describe Admin::Authenticator do
  describe "#authenticate" do
    example "正しいパスワードならtrueを返す" do
      a = build(:admin)
      expect(Admin::Authenticator.new(a).authenticate("pw")).to be_truthy
    end

    example "正しくないパスワードならfalseを返す" do
      a = build(:admin)
      expect(Admin::Authenticator.new(a).authenticate("foo")).to be_falsey
    end

    example "パスワードがnilならfalseを返す" do
      a = build(:admin, password: nil)
      expect(Admin::Authenticator.new(a).authenticate("pw")).to be_falsey
    end
  end
end
