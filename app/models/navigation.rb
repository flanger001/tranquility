module Navigation
  Link = Struct.new(:name, :url)

  class << self
    delegate :url_helpers, :to => "Rails.application.routes"

    def site_links
      site_links = {
        "Home" => url_helpers.root_path,
        "About Us" => url_helpers.about_path,
        "Newsletter" => url_helpers.newsletter_signup_path,
        "Reviews" => url_helpers.reviews_path,
        "Recommendations" => url_helpers.recommendations_path,
        "Contact Us" => url_helpers.contact_us_path
      }
      site_links.map { |link| Link.new(*link) }
    end

    def product_links
      CategoryCollection.
        active.
        order(:position => :asc).
        map { |link| Link.new(link.name, url_helpers.category_collection_path(link.url)) }
    end

    def user_links(current_user)
      user_links = {
        current_user.first_name => url_helpers.admin_user_path(current_user),
        "Products" => url_helpers.admin_products_path,
        "Categories" => url_helpers.admin_categories_path,
        "Collections" => url_helpers.admin_category_collections_path,
        "Recommendations" => url_helpers.admin_recommendations_path,
        "Schedules" => url_helpers.admin_schedules_path,
        "Snippets" => url_helpers.admin_snippets_path,
        "Snippet Collections" => url_helpers.admin_snippet_collections_path,
        "Staff" => url_helpers.admin_staff_index_path,
        "Reviews" => url_helpers.admin_reviews_path,
        "Log Out" => url_helpers.logout_path
      }
      user_links.map { |link| Link.new(*link) }
    end
  end

  class Url
    def self.create(object)
      url = object.name.downcase.gsub(/[\W]+/, "-")
      url.chop! if url.end_with?("-")
      url
    end
  end
end
