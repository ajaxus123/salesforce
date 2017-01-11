class Store < ApplicationRecord
VALID_NUMBER_REGEX = /\A[0-9]+\z/
VALID_NAME_REGEX = /\A[a-z]+\z/
belongs_to :user
belongs_to :channel
validates :user_id, presence: true
validates :storename, presence: true
validates :storecode, presence: true, length: { maximum: 5 }, uniqueness: true
validates :contactname, presence: true
validates :phonenumber, presence: true, length: { maximum: 10, minimum: 10 }, format: { with: VALID_NUMBER_REGEX }, uniqueness: true
validates :latitude, presence: true
validates :longitude, presence: true

reverse_geocoded_by :latitude, :longitude
after_validation :reverse_geocode

end
