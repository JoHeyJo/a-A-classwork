# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork

    has_many :shared_artworks,
        foreign_key: :view_id,
        class_name: :ArtworkShare
end
