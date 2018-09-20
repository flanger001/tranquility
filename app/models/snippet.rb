# == Schema Information
#
# Table name: snippets
#
#  id                    :integer          not null, primary key
#  name                  :string
#  title                 :string
#  body                  :text
#  category_id           :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  active                :boolean          default(FALSE)
#  snippet_collection_id :integer
#

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
