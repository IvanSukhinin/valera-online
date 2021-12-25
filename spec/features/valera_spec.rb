require 'rails_helper'

RSpec.describe 'Valera management', type: :feature do
  before do
    visit root_path
    click_link 'sign-in'

    page.fill_in 'Email', with: 'test_user@test.com'
    page.fill_in 'Password', with: '123'
    click_on 'commit'
  end

  it 'Valera dead' do
    visit valera_path
    click_button 'grandpa'
    expect(page).to have_current_path(new_game_path)
  end

  it 'New Valera' do
    visit new_game_path

    click_link 'new-game'

    expect(page).to have_current_path(valera_path, ignore_query: true)
  end
end
