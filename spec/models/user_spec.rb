require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user = User.new(:email => "test@test.com", :password => "test-password").save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(:name => "test-name", :password => "test-password").save
      expect(user).to eq(false)
    end

    it 'ensures name presence' do
      user = User.new(:name => "test-name", :email => "test@test.com").save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(:name => "test-name", :email => "test@test.com", :password => "test-password").save
      expect(user).to eq(true)
    end

  end

  context 'scope tests' do

  end
end
