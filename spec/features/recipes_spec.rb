require 'rails_helper'

RSpec.describe 'Recipes app', type: :feature do
  scenario 'all recipes page' do
    visit recipes_path
    expect(page).to have_content('MarleySpoon')
  end

  scenario 'load recipe page' do
    visit recipes_path
    click_on 'Crispy Chicken and Rice with Peas & Arugula Salad'
    expect(page).to have_content('Crispy Chicken and Rice with Peas & Arugula Salad')
    expect(page).to have_content('kalories')
    expect(page).to have_content('Chef')
    expect(page).to have_content('Tags')
  end

end