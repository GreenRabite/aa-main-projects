require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    User.create!(username: "Rabite", email: "green.rabite@gmail.com", password: "password")
  end

  it 'validates presence of username' do
    expect(user).not_to be_valid
  end

  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password)}
  it {should have_many(:goals)}
  it {should have_many(:cheers_given)}

end
