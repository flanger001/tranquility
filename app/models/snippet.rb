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
  belongs_to :category
  belongs_to :snippet_collection
  before_save :create_name

  def self.spa_address
    @spa_address ||= find_by(title: 'Spa Address')
  end

  def self.announcement
    @announcement ||= find_by(title: 'Announcement')
  end

  def self.book_now_link(mobile = false)
    title = mobile ? 'Book Now (Mobile)' : 'Book Now'
    @book_now_link ||= find_by(title: title)
  end

  private

  def create_name
    unless self.name.present?
      self.name = self.title.downcase.gsub(/[\W]{1,}/, '-')
      self.name.chop! if self.name.end_with?('-')
    end
  end
end
