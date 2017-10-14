Photo.destroy_all
User.destroy_all
Artist.destroy_all
Song.destroy_all

artist1 = Artist.create(name: "Allman Brothers Band", formed: 1969, bio: "Riding the high of the 60's, The Allman Brothers Band were a highly influential jam band incorporating
  country, blues, rock 'n' roll and soul into their enigmatic and powerful sound.", genre: "Southern Rock")

artist2 = Artist.create(name: "The Pharcyde", formed: 1989, bio: "Infectious rhymes and beats to match them; quirky lyrics and groovy beats... This LA quartet of rappers are,
  to many, the definition of the 'Golden Age of Hip-Hop' ", genre: "Old-Skool Hip-Hop")

artist3 = Artist.create(name: "Porcupine Tree", formed: 1987, bio: "Brooding, melancholy and heavy, this British progressive outfit gathered a huge cult following
  several album releases - cultivating a new and ingenious sound and breathing new life into a nostalgic genre.' ", genre: "Progressive Rock")

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dbk0w1uqs/image/upload/v1508004350/allman-brothers-band_nwponq.jpg", artist: artist1)

photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dbk0w1uqs/image/upload/v1508004345/pharcyde_tkhhqv.png", artist: artist2)

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dbk0w1uqs/image/upload/v1508004324/Porcupine-Tree_kb74pt.jpg", artist: artist3)


  Song.create!([
    { name: "Jessica", album: "Brothers and Sisters", artist: artist1},
    { name: "Melissa", album: "Eat A Peach", artist: artist1},
    { name: "Midnight Rider", album: "Idlewild South", artist: artist1},
    { name: "Blue Sky", album: "Each A Peach", artist: artist1},
    { name: "Whipping Post", album: "Live at the Filmore East", artist: artist1},
    { name: "Passin' Me By", album: "Bizarre Ride II", artist: artist2},
    { name: "Runnin'", album: "Labcabincalifornia", artist: artist2},
    { name: "On the DL", album: "Bizarre Ride II", artist: artist2},
    { name: "Otha Fish", album: "Bizarre Ride II", artist: artist2},
    { name: "Illusions", album: "Humboldt Beginnings", artist: artist2},
    { name: "Trains", album: "In Absentia", artist: artist3},
    { name: "Blackest Eyes", album: "In Absentia", artist: artist3},
    { name: "Lazarus", album: "Deadwing", artist: artist3},
    { name: "My Ashes", album: "Fear of a Blank Planet", artist: artist3},
    { name: "Anesthetize", album: "Fear of a Blank Planet", artist: artist3},
    ])
