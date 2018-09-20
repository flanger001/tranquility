module ApplicationHelper
  def full_title(page_title)
    base_title = 'A Touch Of Tranquility'
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end

  def add_extra_fields_link(name, form, association)
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |f|
      render association.to_s.singularize + '_fields', form: f
    end
    link_to name, '#', class: 'btn btn-default add_fields', data: { id: id, fields: fields.delete("\n") }
  end

  NavLink = Struct.new(:name, :url, :class)

  def nav_links
    @nav_links = {
      'Home' => '/',
      # 'Specials!' => 'specials',
      'About Us' => about_path,
      'Reviews' => reviews_path,
      # 'Policies' => '/policies',
      'Recommendations' => recommendations_path,
      'Spa Hours' => spa_hours_path

    }
    @nav_links.map { |link| NavLink.new(*link) }
  end

  def product_links
    @product_links = {}
    CategoryCollection.where(active: true)
                      .sort_by(&:position)
                      .each { |c| @product_links.merge!(c.name => category_collection_path(c.url)) }
    @product_links.map { |link| NavLink.new(*link) }
  end

  def user_links
    @user_links = [
      [current_user.first_name, admin_user_path(current_user)],
      ['Products', admin_products_path],
      ['Categories', admin_categories_path],
      ['Collections', admin_category_collections_path],
      ['Recommendations', admin_recommendations_path],
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

  def nav_id
    @nav_id ||= NavId.new
  end

  def spa_hours
    @spa_hours ||= Schedule.spa_hours
  end

  def spa_address
    @spa_address ||= Snippet.spa_address
  end

  def announcement
    @announcement ||= Snippet.announcement
    @announcement.body if @announcement && @announcement.active
  end

  def active_check_box(form, _options = {})
    content_tag :div, class: 'form-group' do
      form.label :active, class: 'checkbox' do
        (form.check_box :active) +
          "Show this #{form.object.class.to_s.underscore.humanize.downcase}?"
      end
    end
  end

  def book_now_link(mobile = false)
    link = Snippet.book_now_link(mobile)
    link_to 'Book Now', link.body, target: '_blank', class: 'btn btn-book-now'
  end
end
