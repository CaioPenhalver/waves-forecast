require 'features_helper'

feature 'User visits home page' do
  scenario 'successfully' do
    visit '/'

    expect(page).to have_content 'Waves Forecast'
  end
end
