class NavigationUrl
  def self.create(object)
    url = object.name.downcase.gsub(/[\W]+/, '-')
    url.chop! if url.end_with?('-')
    url
  end
end
