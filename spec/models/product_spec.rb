require "rails_helper"

RSpec.describe Product, type: :model do
  context "associations" do
    it {should belong_to :category}
  end
end
