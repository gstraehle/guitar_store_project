require 'spec_helper'


feature 'User views products' do
  scenario 'on the front page' do

    visit root_path

    expect(page).to have_content 'Fretrograde'
    expect(page).to have_content 'Our Guitars'
    expect(page).to have_content 'Products'
    expect(page).to have_content 'Guitars so awesome'
    expect(page).to have_content 'Login'
  end
end
