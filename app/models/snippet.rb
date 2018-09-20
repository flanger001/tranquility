class Snippet < ActiveRecord::Base
  belongs_to :category, optional: true
  belongs_to :snippet_collection, optional: true
  before_save :create_name

  def self.spa_address
    find_or_initialize_by(title: 'Spa Address')
  end

  def self.announcement
    find_or_initialize_by(title: 'Announcement')
  end

  def self.book_now_link(mobile = false)
    title = mobile ? 'Book Now (Mobile)' : 'Book Now'
    find_or_initialize_by(title: title)
  end

  private

  def create_name
    return unless name.present?
    self.name = title.downcase.gsub(/[\W]{1,}/, '-')
    name.chop! if name.end_with?('-')
  end
end
