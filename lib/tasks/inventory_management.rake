namespace "inventory" do
  namespace "products" do
    desc "Make all products active"
    task "make_active" => :environment do
      Product.update_all(active: true)
    end

    desc "Make all products inactive"
    task "make_inactive" => :environment do
      Product.update_all(active: false)
    end
  end

  namespace "categories" do
    desc "Make all categories active"
    task "make_active" => :environment do
      Category.update_all(active: true)
    end

    desc "Make all categories inactive"
    task "make_inactive" => :environment do
      Category.update_all(active: false)
    end
  end

  namespace "collections" do
    desc "Make all collections active"
    task "make_active" => :environment do
      CategoryCollection.update_all(active: true)
    end

    desc "Make all collections inactive"
    task "make_inactive" => :environment do
      CategoryCollection.update_all(active: false)
    end
  end

  namespace "everything" do
    desc "Make everything active"
    task "make_active" => :environment do
      Product.update_all(active: true)
      Category.update_all(active: true)
      CategoryCollection.update_all(active: true)
    end

    desc "Make everything inactive"
    task "make_inactive" => :environment do
      Product.update_all(active: false)
      Category.update_all(active: false)
      CategoryCollection.update_all(active: false)
    end
  end
end
