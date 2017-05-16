require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
      )
    end
  end

  scenario "They see one product detail" do
    # ACT
    visit root_path
    find_by_id(5).click

    # DEBUG / VERIFY
    #puts page.body
    #save_and_open_page
    save_screenshot
    expect(page).to have_css 'article.product-detail', count: 1
  end

end
