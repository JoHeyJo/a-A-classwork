# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create( username: 'Thiago' )
user2 = User.create( username: 'Joannes' )
user3 = User.create( username: 'Jo' )
user4 = User.create( username: 'Z' )
user5 = User.create( username: 'X' )
user6 = User.create( username: 'C' )

a = Artwork.create(title: 'art1', image_url: 'something.com', artist_id: user2.id)
a2 = Artwork.create(title: 'art2', image_url: 'something2.com', artist_id: user3.id)
a3 = Artwork.create(title: 'art3', image_url: 'something3.com', artist_id: user4.id)
as1 = ArtworkShare.create(artwork_id:a.id, viewer_id:user3.id)
as2 = ArtworkShare.create(artwork_id:a2.id, viewer_id:user4.id)
as3 = ArtworkShare.create(artwork_id:a3.id, viewer_id:user5.id)
