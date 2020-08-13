class Staff < ActiveRecord::Base
  has_one :schedule, :dependent => :destroy
  accepts_nested_attributes_for :schedule, :allow_destroy => true
  mount_uploader :photo, ImageUploader

  validates :first_name, :last_name, :presence => true

  include Person
  include Url
end
