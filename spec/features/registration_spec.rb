require 'features/features_spec_helper'

feature "Registration", :devise do
  scenario "Visitor registers successfully via register form" do
    visit new_user_registration_path
    within '#new_user' do
      fill_in 'First name', with: Faker::Name.first_name
      fill_in 'Last name', with: Faker::Name.last_name
      fill_in 'Email', with: Faker::Internet.email
      fill_in('Password', with: '12345678', :match => :first)
      fill_in('Password confirmation', with: '12345678')
      click_button('Sign up')
    end
    expect(page).to have_content 'Logout'
    expect(page).to have_content 'You have signed up successfully.'
    expect(page).not_to have_content 'Sign up'

  end
end