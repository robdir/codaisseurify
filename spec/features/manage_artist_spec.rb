require 'rails_helper'

feature 'Manage artists', js: true do
  before(:each) do
    FactoryGirl.create :artist, id: 1, name: "Judas Priest"
  end

  def find_artist
    visit artist_path(1)
  end

  def add_song
    fill_in 'song_name', with: 'Have a banana'
    page.execute_script("$('#new_song').submit()")
  end

  def add_songs
    fill_in 'song_name', with: 'Have a banana'
    page.execute_script("$('#new_song').submit()")
    fill_in 'song_name', with: 'Lah-di-dah'
    page.execute_script("$('#new_song').submit()")
    fill_in 'song_name', with: 'Bona-sera'
    page.execute_script("$('#new_song').submit()")
  end



  scenario 'add song', js: true do
    find_artist
    add_song
    expect(page).to have_content('Have a banana')
  end

  scenario 'delete artist', js: true do
    find_artist
    find('.delete-artist').click
    visit root_path
    expect(page).to_not have_content("Judas Priest")
  end

  scenario 'delete song', js: true do
    find_artist
    add_song
    find('.delete-single').click
    expect(page).to_not have_content("Have a banana")
  end

  # scenario 'delete all', js: true do
  #   find_artist
  #   add_songs
  #   find('.delete-all').click
  #   expect(page).to_not have_content("Have a banana")
  #   expect(page).to_not have_content("La-di-dah")
  #   expect(page).to_not have_content("Bona-sera")
  #
  # end



end
