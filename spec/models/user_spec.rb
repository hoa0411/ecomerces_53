require "rails_helper"

RSpec.describe User, type: :model do

  context "validates" do
    it {should validate_length_of(:name).
      is_at_most(50).with_message(I18n.t("test_name"))}
    it {should validate_presence_of :email}
    it {should validate_presence_of :phone}
    it {should validate_presence_of :password}
    it {should validate_length_of(:password).
      is_at_least(6).with_message(I18n.t("test_messeger"))}
    it "test scope" do
    expect(User.all.to_sql).to eq User.all.order(name: :ASC).to_sql
  end
  end
end
