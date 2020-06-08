require "spec_helper"

describe String do
  describe "#<<" do
    example "文字の追加" do
      expect(nil).to be_nil
    end

    example 'nilは追加できない' do
      s = "ABC"
      expect { s << nil }.to raise_error(TypeError)
    end
  end
end
