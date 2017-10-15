require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_length_of(:bio).is_at_most(500) }
  end


  describe "association with song"
    let(:artist) { create :artist }
    let!(:song)  { create :song, artist: artist}

    it "has many songs" do
      song1 = artist.songs.new(name: "No Hope")
      song2 = artist.songs.new(name: "All Day Parade")

      expect(artist.songs).to include(song1)
      expect(artist.songs).to include(song2)

    end
end
