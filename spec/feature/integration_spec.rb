# location spec/feature/integration_spec.rb
require 'rails_helper'
RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'person'
    fill_in 'Price', with: '19.99'
    fill_in 'book_published_date', with: '2000-01-01'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('person')
    expect(page).to have_content('19.99')
    expect(page).to have_content('2000-01-01')
  end
  scenario 'invalid inputs' do
    visit new_book_path
    click_on 'Create Book'
    visit books_path
    expect(page).to have_no_content('harry potter')
    expect(page).to have_no_content('person')
    expect(page).to have_no_content('19.99')
    expect(page).to have_no_content('2000-01-01')
  end

end
RSpec.describe 'Modifying a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'person'
    fill_in 'Price', with: '19.99'
    fill_in 'book_published_date', with: '2000-01-01'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('person')
    expect(page).to have_content('19.99')
    expect(page).to have_content('2000-01-01')
    click_on 'Edit'
    fill_in 'Title', with: 'not harry potter'
    fill_in 'Author', with: 'a person'
    fill_in 'Price', with: '19.97'
    fill_in 'book_published_date', with: '2001-01-01'
    click_on 'Update Book'
    visit books_path
    expect(page).to have_content('not harry potter')
    expect(page).to have_content('a person')
    expect(page).to have_content('19.97')
    expect(page).to have_content('2001-01-01')
  end
  scenario 'invalid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'person'
    fill_in 'Price', with: '19.99'
    fill_in 'book_published_date', with: '2000-01-01'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('person')
    expect(page).to have_content('19.99')
    expect(page).to have_content('2000-01-01')
    click_on 'Edit'
    fill_in 'Title', with: ''
    fill_in 'Author', with: 'a person'
    fill_in 'Price', with: '19.97'
    fill_in 'book_published_date', with: '2001-01-01'
    click_on 'Update Book'
    visit books_path
    expect(page).to have_no_content('not harry potter')
    expect(page).to have_no_content('a person')
    expect(page).to have_no_content('19.97')
    expect(page).to have_no_content('2001-01-01')
  end

end
RSpec.describe 'Deleting a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'person'
    fill_in 'Price', with: '19.99'
    fill_in 'book_published_date', with: '2000-01-01'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('person')
    expect(page).to have_content('19.99')
    expect(page).to have_content('2000-01-01')
    click_on 'Delete'
    click_on 'Confirm'
    #expect(page).to have_content('Confirm')
  end
end
