require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end

   it "is valid with profile, language, github" do
    user = @user
    profile = user.build_profile(
      content: "test-profile",
      language: "test-language",
      github: "http://test.com"
    )
    expect(profile).to be_valid
   end

   it "is invalid without profile" do
     profile = Profile.new(content: nil)
     profile.valid?
     expect(profile.errors[:content]).to include("を入力してください")
   end

   it "is invalid with too long profile" do
     profile = Profile.new(content: "a"*256)
     profile.valid?
     expect(profile.errors[:content]).to include("は255文字以内で入力してください")
   end

   it "is invalid without lauguage" do
    profile = Profile.new(language: nil)
    profile.valid?
    expect(profile.errors[:language]).to include("を入力してください")
   end

   it "is invalid without github" do
    profile = Profile.new(github: nil)
    profile.valid?
    expect(profile.errors[:github]).to include("を入力してください")
   end

   it "is invalid without user_id" do
    profile = Profile.new(user_id: nil)
    profile.valid?
    expect(profile.errors[:user_id]).to include("を入力してください")
   end
end
