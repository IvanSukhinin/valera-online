require 'rails_helper'

RSpec.describe 'Sign out management', type: :feature do
  before do
    visit root_path
    click_link 'sign-in'
    page.fill_in 'Email', with: 'test_user@test.com'
    page.fill_in 'Password', with: '123'
    click_on 'commit'
  end

  it 'Sign out (test_user@test.com)' do
    visit valera_path
    click_on 'sign-out'
    expect(page).to have_current_path(sign_in_path, ignore_query: true)
  end
end
