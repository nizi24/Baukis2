require "rails_helper"

describe "許可IPアドレス" do
  before do
    Rails.application.config.baukis2[:restrict_ip_addresses] = true
  end

  context "許可されているIPアドレスの時" do
    it "200レスポンスを返すこと" do
      AllowedSource.create!(namespace: "admin", ip_address: "127.0.0.1")
      get admin_root_url
      expect(response.status).to eq 200
    end
  end

  context "許可されていないIPアドレスの時" do
    it "403レスポンスを返すこと" do
      AllowedSource.create!(namespace: "admin", ip_address: "192.168.0.*")
      get admin_root_url
      expect(response.status).to eq 403
    end
  end
end
