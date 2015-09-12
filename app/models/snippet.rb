# == Schema Information
#
# Table name: snippets
#
#  id          :integer          not null, primary key
#  name        :string
#  title       :string
#  body        :text
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  active      :boolean          default(FALSE)
#

class Snippet < ActiveRecord::Base
  belongs_to :category
  before_save :create_name

  private

  def create_name
    unless self.name.present?
      self.name = self.title.downcase.gsub(/[\W]{1,}/, '-')
      self.name.chop! if self.name.end_with?('-')
    end
  end

end
