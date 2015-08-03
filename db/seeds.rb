User.destroy_all
Photo.destroy_all
Comment.destroy_all

jared = User.create!(username: "jared", password_digest: "#{User.digest('jared')}", name: "Jared A", email: "jared@yahoo.com")
bob = User.create!(username: "bob", password_digest: "#{User.digest('bob')}", name: "Bob Smith", email: "bob@yahoo.com")
sally = User.create!(username: "sally", password_digest: "#{User.digest('sally')}", name: "Sally Johnson", email: "sally@yahoo.com")
dylan = User.create!(username: "dylan", password_digest: "#{User.digest('joe')}", name: "Dylan Beekler", email: "dylan@yahoo.com")

rudd = jared.photos.create!(title: "Paul Rudd", photo_url: "http://www.circlecinema.com/wp-content/uploads/2012/12/paul-rudd-0.jpg")
biya = jared.photos.create!(title: "Paul Biya", photo_url: "https://pbs.twimg.com/profile_images/494451373396611072/pOOKc53J.jpeg")
chris = sally.photos.create!(title: "Chris Paul", photo_url: "http://l1.yimg.com/bt/api/res/1.2/5YMpUh_XXlEaEfbarT7pyg--/YXBwaWQ9eW5ld3M7aWw9cGxhbmU7cT03NTt3PTYwMA--/http://media.zenfs.com/en/person/Ysports/chris-paul-basketball-headshot-photo.jpg")
george = sally.photos.create!(title: "Paul George", photo_url: "http://l1.yimg.com/bt/api/res/1.2/VSmVj2Koo0A5RQgojEkfCg--/YXBwaWQ9eW5ld3M7aWw9cGxhbmU7cT03NTt3PTYwMA--/http://media.zenfs.com/en/person/Ysports/paul-george-basketball-headshot-photo.jpg")
paulg = dylan.photos.create!(title: "Paul Giamatti", photo_url: "https://upload.wikimedia.org/wikipedia/commons/d/d7/Paul_Giamatti_2010_TIFF.jpg")
nfl = dylan.photos.create!(title: "NFL Paul", photo_url: "http://a.espncdn.com/combiner/i?img=/i/headshots/nfl/players/full/10478.png&w=350&h=254")
phariss = dylan.photos.create!(title: "Paul Phariss", photo_url: "http://www.brainfitnessstrategies.com/images/bio/paul-phariss.jpg")
rand = jared.photos.create!(title: "Rand Paul", photo_url: "https://www.congress.gov/img/member/112_sr_ky_paul_rand.jpg")
rabil = bob.photos.create!(title: "Screaming Paul Rabil", photo_url: "http://hardwoodhustle.com/wp-content/uploads/2014/11/Rabil.jpg")
rudd2 = bob.photos.create!(title: "Paul Rudd 2", photo_url: "https://upload.wikimedia.org/wikipedia/commons/e/eb/Paul_Rudd_2_SDCC_2014.jpg")

rudd.comments.create!(content: "first!!!", user_id: jared.id)
rudd.comments.create!(content: "so dreamy", user_id: jared.id)
biya.comments.create!(content: "comment here", user_id: sally.id)
paulg.comments.create!(content: "second!!!!", user_id: sally.id)
nfl.comments.create!(content: "who is that?", user_id: sally.id)
nfl.comments.create!(content: "football is awesome", user_id: dylan.id)
nfl.comments.create!(content: "baseball stinks", user_id: dylan.id)
george.comments.create!(content: "go wizards", user_id: dylan.id)
chris.comments.create!(content: "not named paul", user_id: jared.id)
rand.comments.create!(content: "who?", user_id: jared.id)
biya.comments.create!(content: "first!!!!", user_id: jared.id)
rudd.comments.create!(content: "^^^^ this", user_id: bob.id)
rudd2.comments.create!(content: "something goes here", user_id: bob.id)
nfl.comments.create!(content: "another comment", user_id: bob.id)
