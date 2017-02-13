class Store < ApplicationRecord
include Friendlyable

VALID_NUMBER_REGEX = /\A[0-9]+\z/
VALID_NAME_REGEX = /\A[a-z]+\z/

belongs_to :user
belongs_to :channel
belongs_to :region
has_many :visits
validates :user_id, presence: true
validates :storename, presence: true
validates :storecode, presence: true, length: { maximum: 5 }, uniqueness: true
validates :phonenumber, presence: true, length: { maximum: 10, minimum: 10 }, format: { with: VALID_NUMBER_REGEX }, uniqueness: true
validates :latitude, presence: true
validates :longitude, presence: true
validates :channel_id, presence: true
reverse_geocoded_by :latitude, :longitude
after_validation :reverse_geocode


end

