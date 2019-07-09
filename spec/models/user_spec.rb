require 'rails_helper'

RSpec.describe User, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
# name, passwordがあれば有効な状態であること
it "is valid with name and password" do
  user = User.new(name: "Rspec",
                   password: "Rspectest", 
                   password_confirmation: "Rspectest")
  expect(user).to be_valid
end

# nameが無ければ無効な状態であること
it "is invalid without a name" do
  user = User.new(name: nil)
  user.valid?
  expect(user.errors[:name]).to include("can't be blank")
end

# passwordが無ければ無効な状態であること
it "is invalid without a password" do
  user = User.new(password: nil)
  user.valid?
  expect(user.errors[:password]).to include("can't be blank")
end

# 重複したnameなら無効な状態であること
it "is invalid with a duplicate name"
# 6文字以下のpasswordなら無効な状態であること
it "is invalid with a password of 6 characters or less"

end
