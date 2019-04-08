namespace :management do
  desc "Creates default positions (should only need to run this once)"
  task assign_positions: :environment do
    Category.find_each.with_index(1) do |c, idx|
      c.position = idx
      c.save
      p c.name
      c.products.each.with_index(1) do |pr, idx2|
        pr.update(position: idx2)
        puts "#{pr.name} - #{pr.position}"
      end
      puts
    end

    CategoryCollection.find_each.with_index(1) do |cc, idx|
      puts cc.name
      cc.update(position: idx)
      puts
    end
  end
end
