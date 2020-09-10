require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with username, email, password" do
    user = User.new(
      username: 'test-user',
      email: 'test@example.com',
      password: 'password'
    )
    expect(user).to be_valid
  end

  it "is invalid user without username" do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("を入力してください")
  end

  it "is invalid user without email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "is invalid user without password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end
end

