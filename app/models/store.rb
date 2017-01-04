class Store < ApplicationRecord
VALID_NUMBER_REGEX = /\A[0-9]+\z/
belongs_to :user
validates :user_id, presence: true
validates :storename, presence: true, uniqueness: true
validates :storecode, presence: true, length: { maximum: 5 }, uniqueness: true
validates :contactname, presence: true
validates :phonenumber, presence: true, length: { maximum: 10 }, format: { with: VALID_NUMBER_REGEX }, uniqueness: true

reverse_geocoded_by :latitude, :longitude
after_validation :reverse_geocode

end
