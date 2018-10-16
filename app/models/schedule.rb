class Schedule < ActiveRecord::Base
  belongs_to :staff, optional: true
  has_many :events
  accepts_nested_attributes_for :events, allow_destroy: true

  def self.spa_hours
    find_or_initialize_by(name: 'Spa Hours')
  end
end
