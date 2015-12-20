namespace :product_management do
  desc 'Creates default positions (should only need to run this once)'
  task :assign_positions => :environment do
    Category.find_each.with_index(1) do |c, idx|
      c.update(:position => idx)
    end

    CategoryCollection.find_each.with_index(1) do |cc, idx|
      cc.update(:position => idx)
    end

    Product.find_each.with_index(1) do |p, idx|
      p.update(:position => idx)
    end
  end

end
