# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.atouchoftranquilityspa.com"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.sitemaps_host = "https://s3.amazonaws.com/#{ENV['FOG_DIRECTORY']}/"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  Category.find_each do |category|
    add category_path(category.url), lastmod: category.updated_at
    category.products.each do |product|
      add category_product_path(category.url, product.url)
    end
  end
  CategoryCollection.find_each do |collection|
    add category_collection_path(collection), lastmod: collection.updated_at
  end

  add about_path
  add policies_path
  add recommendations_path
  add spa_hours_path
  add specials_path

end


