class Snippet < ActiveRecord::Base
  belongs_to :category, optional: true
  belongs_to :snippet_collection, optional: true
  before_save :create_name

  class << self
    def [](value)
      o = find_or_initialize_by(title: value.to_s.titleize)
      o.body if o.active
    end
  end

  private

  def create_name
    self.name = title.downcase.strip.gsub(/[\W]+/, "-")
  end
end
