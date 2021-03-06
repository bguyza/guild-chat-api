require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect(User.new(name: 'Dan')).to be_valid
  end

  it 'is not valid without a name' do
    expect(User.new).to_not be_valid
  end
end
