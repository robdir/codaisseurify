require 'rails_helper'

RSpec.describe Photo, type: :model do

  describe "association to artist" do

    it { is_expected.to belong_to(:artist)}

  end
end
