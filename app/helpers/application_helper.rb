module ApplicationHelper

  def full_title(page_title)
    base_title = 'A Touch Of Tranquility'
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end

  def add_extra_fields_link(name, form, association)
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |f|
      render association.to_s.singularize + "_fields", form: f
    end
    link_to name, '#', class: 'btn btn-default add_fields', data: { id: id, fields: fields.gsub("\n", "") }
  end

  NavLink = Struct.new(:name, :url, :class)

  def nav_links
    @nav_links = {
      'Home' => '/',
      # 'Specials!' => 'specials',
      'About Us' => '/about',
      # 'Policies' => '/policies',
      # 'Likes!' => '/likes',
      'Spa Hours' => '/spa-hours',
    }
    CategoryCollection.find_each { |c| @nav_links.merge!({ c.name => category_collection_path(c.url) }) }

    @nav_links.map { |link| NavLink.new(*link) }
  end

  def user_links
    @user_links = [
      [current_user.first_name, admin_user_path(current_user)],
      ['Products', admin_products_path],
      ['Categories', admin_categories_path],
      ['Collections', admin_category_collections_path],
      ['Schedules', admin_schedules_path],
      ['Snippets', admin_snippets_path],
      ['Snippet Collections', admin_snippet_collections_path],
      ['Staff', admin_staff_index_path],
      ['Reviews', admin_reviews_path],
      ['Log Out', logout_path, :post]
    ]
    @user_links.map { |link| NavLink.new(*link) }
  end

  def slogan
    'give yourself, a friend, or a loved one, a touch of tranquility, to relax the mind and body, leading to better health, happiness and well-being'
  end


  def bootstrap_class_for(flash_type)
    flashes = { success: 'alert-success', error: 'alert-danger', alert: 'alert-block', notice: 'alert-info' }
    flashes[flash_type.to_sym] || flash_type.to_s
  end

end
