require 'rails_helper'

RSpec.feature "User login", type: :feature, js: true do

  #SETUP
  before :each do
    User.create!(
    name: Faker::Name.name,
    email: 'cg@example.org',
    password: 'qwertyui',
    password_confirmation: 'qwertyui'
    )
  end

  scenario "They login" do
    # ACT
    visit '/login'
    fill_in 'Email', with: 'cg@example.org'
    fill_in 'Password', with: 'qwertyui'
    click_on 'Submit'

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content 'Logout'
  end

end
