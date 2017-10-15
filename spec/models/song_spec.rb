require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "validations" do
    it  "is invalid without a name" do
      song = Song.new(name: "")
      song.valid?
      expect(song.errors).to have_key(:name)
    end
  end

  describe "association with songs" do
    let(:song) { create :song}
    it { is_expected.to belong_to :artist}
  end
end
