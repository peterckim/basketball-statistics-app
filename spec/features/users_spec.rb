require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    before(:each) do
      visit new_user_path
      within('form') do 
        fill_in 'user_name', with: 'test-name'
        fill_in 'user_password', with: 'test-password'
      end
    end
      
    scenario 'should be succesful' do
      within('form') do 
        fill_in 'user_email', with: 'test@test.com'
      end

      click_button 'Create User'
      expect(page).to have_content('2018')

    end

    scenario 'should fail' do
      click_button 'Create User'
      expect(page).to have_content('email can\'t be blank')
    end

  end
end
