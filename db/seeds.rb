# noinspection RubyScope
ActiveRecord::Base.transaction do
  users = [
    {
      :first_name => "Dave", :last_name => "Shaffer", :email => "dave.shaffer@gmail.com", :password => ENV["ADMIN_PASS"], :password_confirmation => ENV["ADMIN_PASS"], :admin => true
    },
    {
      :first_name => "Christina", :last_name => "Lower", :email => "christina.lower@yahoo.com", :password => ENV["USER_PASS"], :password_confirmation => ENV["USER_PASS"]
    }
  ]

  users.each do |u|
    b = User.find_or_initialize_by(:last_name => u[:last_name])
    b.attributes = u
    b.save!
  end

  staff = [
    {
      :first_name => "Christina",
      :last_name => "Lower",
      :credentials => "LMT LE CHHC",
      :title => "NYS Licensed Massage Therapist and Esthetician\nCertified Infant Massage Therapist and Instructor\nCertified Holistic Health and Nutrition Consultant\nNutritional education and holistic meal preparation",
      :services => "Massage Therapy\nAll Specialty Massage\nBody Treatments\nMassage Rituals\nScalp Treatments\nPeels and Facials including all waxing services\nHolistic Health Counseling\nNutrition and Meal Preparation Services\n",
      :notes => "Produces handmade organic facial and body products and blends all signature essential oil blends, lotions, body treatments and oils.",
      :bio => "I have deep devotion and fondness toward what I do and I've been been fortunate enough to be actively practicing massage therapy since 2001, esthetics since 2003, and lifestyle counseling, nutritional education and holistic meal preparation since 2011. My goal is to fully treat the whole you, not only the physical you. At this point I focus my energy specializing in the four modalities I grow to love more and more daily; massage therapy, waxing, skin care and nutrition education.\r\n\r\nIf I had to describe the style of bodywork I perform, I would use the word fundamental. I make use of an integrative technique in a minimalist way to help relieve the burden of stress accumulating in the body, the pressure and discomfort of having an injury. I concentrate in NMT, deep tissue and myofascial release techniques. Through these modalities and my particular isolated technique, the motivation is to release tender and painful tension without more discomfort, through patience and attentiveness, compassion and understanding. Developing a supportive, warm, relaxing and safe setting to let go...\r\n\r\nIn esthetics, my priority is results. Skin care for face and body should be simple and have outstanding efficacy. Clean products, specialized services and professional education for women, men, teens and even children in the proper approach to healthy skin.\r\n\r\nWith waxing, you can always expect total professionalism, complete discretion, and unyielding, definitive cleanliness for all waxing services including my self-taught Brazilian waxing techniques.\r\n\r\nToday and what lies ahead... I now produce organic, all natural, naturally derived, self-sustaining, and local-ingredient-infused handmade facial and body care products, including the body treatments and massage blends we use at A Touch of Tranquility. I feel it is of the utmost importance to offer our guests not only a superior quality product or treatment, but one that is also distinctive, effective, clean and designed specifically for you.\r\n\r\nWith sincerity, I express many thanks to all who have supported us throughout the years and those whom lie ahead.\r\n",
      :schedule => Schedule.new(
        :events => [
          Event.new(:day => "Monday", :off => true),
          Event.new(:day => "Tuesday", :start_time => "10:00 am", :end_time => "6:00 pm"),
          Event.new(:day => "Wednesday", :start_time => "10:30 am", :end_time => "3:00 pm"),
          Event.new(:day => "Thursday", :start_time => "10:00 am", :end_time => "6:00 pm"),
          Event.new(:day => "Friday", :start_time => "10:30 am", :end_time => "4:00 pm"),
          Event.new(:day => "Saturday", :start_time => "11:00 am", :end_time => "2:00 pm"),
          Event.new(:day => "Sunday", :off => true)
        ],
        :notes => "Other special appointments may be arranged.\n\nCall <b>Christina</b> direct: (607) 592-4847"
      ) },
    {
      :first_name => "Caitlin",
      :last_name => "Kelce",
      :credentials => "",
      :title => "Henna Artist",
      :services => "Henna",
      :notes => "",
      :bio => "Caitlin has been a Henna artist since 2001, and has been doing art in general for as long as she can remember, thanks to a very supportive and creatively nurturing family. She has a Bachelors in Fine Arts in Graphic Design with a minor in Web Design. She fell in love with henna as a teenager and started hennaing her friends and family, learning and practicing as much as she could. She is certified by the International Certification for Natural Henna Artists, and has studied the henna plant and its many art forms and safe practices for applying temporary body art.\n\n<a href='http://www.fireflyhenna.com/'>FireflyHenna.com</a>\n\n<a href='http://icnha.org/our-members/kelce-caitlin/' target='_blank'><img src='/images/henna/seal.png' alt='International Certification for Natural Henna Arts'/></a>",
      :schedule => Schedule.new(
        :events => [
          Event.new(:day => "Monday", :off => true),
          Event.new(:day => "Tuesday", :off => true),
          Event.new(:day => "Wednesday", :off => true),
          Event.new(:day => "Thursday", :off => true)
        ],
        :notes => "Other special appointments may be arranged."
      ) }
  ]

  staff.each do |s|
    a = Staff.find_or_initialize_by(:first_name => s[:first_name], :last_name => s[:last_name])
    puts "Saving #{a.class} #{a.name}"
    a.attributes = s
    a.save!
  end

  Category.create(
    :name => "Treatment Enhancements",
    :description => "Awesome add-ons to every massage package",
    :products => [
      Product.new(
        :name => "Mini-Mint Scalp Treatment",
        :description => "Warm and particularly luxurious little add on will no-doubt leave you drooling...Includes Peppermint and grapefruit Mango butter...",
        :product_attributes => [
          ProductAttribute.new(:price => 20)
        ]
      ),
      Product.new(
        :name => "Mini-Tranquility Foot Treatment",
        :description => "Who doesn't want more time on their feet? Add this little 'extra' to any service; There's nothing like Herbal Hot towels on the feet in unison with the Tranquility foot balm and more...",
        :product_attributes => [
          ProductAttribute.new(:price => 20)
        ]
      ),
      Product.new(
        :name => "Hydrating Hand Treatment",
        :description => "Who knew you could have EXTRA time on your hands? Yes YOU can! Give yourself a little treat to moisturize and relax your very busy hands too!",
        :product_attributes => [
          ProductAttribute.new(:price => 20)
        ]
      ),
      Product.new(
        :name => "Herbal Hot Towels",
        :description => "There are 'Hot Towels', and then there are 'Tranquility Hot Towels' that are enhanced to be therapeutic as well as serenely blissful...",
        :product_attributes => [
          ProductAttribute.new(:price => 5)
        ]
      ),
      Product.new(
        :name => "Hot Packs",
        :description => "If you feel you need a hot pack added because of muscle tightness or... You just love the comfort and warmth - let us know!",
        :product_attributes => [
          ProductAttribute.new(:price => 0)
        ]
      ),
      Product.new(
        :name => "30 Minute Signature Scalp Treatment",
        :description => "Enjoy this deeply relaxing, luxurious treatment with any service - Effectively eases stress in the head and neck using hot oil. Any headaches or pain in muscles and joints will be merely a memory after this... serenity is the only description.",
        :product_attributes => [
          ProductAttribute.new(:price => 45)
        ]
      ),
      Product.new(
        :name => "50 Minute Signature Scalp Treatment",
        :description => "Enjoy this deeply relaxing, luxurious treatment with any service - Effectively eases stress in the head and neck using hot oil. Any headaches or pain in muscles and joints will be merely a memory after this... serenity is the only description.",
        :product_attributes => [
          ProductAttribute.new(:price => 65)
        ]
      ),
      Product.new(
        :name => "Hand Rejuvenation Treatment",
        :description => "Mini facial/peel for the hands! Helps reduce pigmented discolorations and dry skin!",
        :product_attributes => [
          ProductAttribute.new(:price => 20)
        ]
      ),
      Product.new(
        :name => "2-Layer Eye Lift Treatment",
        :description => "Great for tired/puffy eyes, fine lines, and dark circles. Add to a facial or select as a stand alone service.",
        :product_attributes => [
          ProductAttribute.new(:price => 20)
        ]
      ),
      Product.new(
        :name => "Aromatherapy",
        :description => "We'll be happy to add aromatherapy of your choice or blend one up especially just for you, to enhance your service!",
        :product_attributes => [
          ProductAttribute.new(:price => 5)
        ]
      ),
      Product.new(
        :name => "Signature Aromatherapy Blend",
        :description => "We'll be happy to add either of our signature aromatherapy blends to enhance your service! * 'Hot Cinnamon and Citrus' (most popular!) or try our 'Tranquility Blend' (deeply relaxing and meditative).",
        :product_attributes => [
          ProductAttribute.new(:price => 10)
        ]
      ),
      Product.new(
        :name => "Immune Boost",
        :description => "Our handmade immune-enhancement packs - add during any treatment",
        :product_attributes => [
          ProductAttribute.new(:price => 20)
        ]
      ),
      Product.new(
        :name => "30 Minute Reflexology DURING Session",
        :description => "Add Reflexology DURING another session!\n\nStimulation of reflex points on the feet that correspond to organs and specific areas of the body to strengthen the immune system, control stress and improve overall health and well-being.",
        :product_attributes => [
          ProductAttribute.new(:price => 30)
        ]
      )
    ]
  )

  collections = [
    {
      :name => "Bodywork",
      :description => "A Touch Of Tranquilty does awesome bodywork",
      :categories => [
        Category.new(
          :name => "Massage Therapy",
          :description => "Massage therapy is ideal for those with chronic muscle pain, tightness, tension headaches or injuries. We will design the perfect pain reducing treatment utilizing various massage modalities for your specific needs. In most cases a series of sessions may be necessary to find relief within your body.",
          :products => [
            Product.new(
              :name => "Relaxation Massage",
              :description => "If you just need to relax and de-stress this is the massage for you. Using long, rhythmic strokes and gentle manipulation of muscles to improve circulation, flexibility, relieve tension, soothe minor aches and pains.",
              :product_attributes => [
                ProductAttribute.new(:time => 30, :price => 35),
                ProductAttribute.new(:time => 45, :price => 50),
                ProductAttribute.new(:time => 60, :price => 65),
                ProductAttribute.new(:time => 75, :price => 80),
                ProductAttribute.new(:time => 90, :price => 95),
                ProductAttribute.new(:time => 20, :price => 130)
              ]
            ),
            Product.new(
              :name => "Couples Sessions",
              :description => "Beautiful",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 130),
                ProductAttribute.new(:time => 75, :price => 150),
                ProductAttribute.new(:time => 90, :price => 190)
              ]
            ),
            Product.new(
              :name => "Head, Neck and Facial Session",
              :description => "Enjoy a full 30 minutes of facial massage (with our signature facial oil blend) along with scalp and neck massage.",
              :product_attributes => [
                ProductAttribute.new(:time => 30, :price => 35),
                ProductAttribute.new(:time => 60, :price => 65)
              ]
            ),
            Product.new(
              :name => "Earth and Sky Massage",
              :description => "60 minutes of head, neck, face, feet and hands.",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 65)
              ]
            ),
            Product.new(
              :name => "Tandem",
              :description => "Achieving bliss is definitely in 4-handed bodywork; 2 practitioners working simultaneously. This is unbelievable!",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 130),
                ProductAttribute.new(:time => 90, :price => 190)
              ]
            ),
            Product.new(
              :name => "Chair Massage",
              :description => "This massage is performed with clothes on for more convenience.",
              :product_attributes => [
                ProductAttribute.new(:time => 15, :price => 15),
                ProductAttribute.new(:time => 30, :price => 30)
              ]
            )
          ]
        ),
        Category.new(
          :name => "Specialty Bodywork",
          :description => "A Touch of Tranquility's Specialty Massages are above and beyond the 'normal' bodywork session. With years of Massage experience we have gathered and now incorporated all the highest quality elements into one opulent treatment.",
          :products => [
            Product.new(
              :name => "Tranquility Massage",
              :description => "Our Tranquility Massage is an exceptional massage experience with a special blend of hand mixed and warmed oils blended with unique and exotic essential oils, all combine to ease muscle pain, balance you and send your mind into a deep meditative state.",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 75),
                ProductAttribute.new(:time => 90, :price => 105)
              ]
            ),
            Product.new(
              :name => "Hot Cinnamon and Citrus Massage",
              :description => "An extraordinary massage experience. enjoy the wonderful warming scents of sweet-spicy aromatherapeutic oils of <b>cinnamon and citrus</b> in a relaxing therapeutic massage. ease muscle aches and pains, reduce anxiety, heal and purify the body.",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 75),
                ProductAttribute.new(:time => 90, :price => 105)
              ]
            ),
            Product.new(
              :name => "Hot Stone Massage",
              :description => "Experience the most relaxing, luxurious, and therapeutic massage combined with aromatherapy and deep heat. Smooth basalt lava stones are heated and incorporated into your session.",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 75),
                ProductAttribute.new(:time => 90, :price => 105)
              ]
            ),
            Product.new(
              :name => "Warm Bamboo Massage",
              :description => "A fresh and inventive way to provide Swedish and deep-tissue massage by rolling and kneading the body with warm bamboo. Creates relaxation and well-being, and works to balance, calm, and energize you physically, mentally, and spiritually.",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 75),
                ProductAttribute.new(:time => 90, :price => 105)
              ]
            )
          ]
        ),
        Category.new(
          :name => "Massage and Pregnancy",
          :description => "Prenatal massage is simply massage given to an expecting mother with a few changes made in positioning as her body changes. Prenatal massage also requires knowledge of a pregnant woman's anatomy as her body shifts throughout her pregnancy.",
          :products => [
            Product.new(
              :name => "Relaxing Massage for Mother and Baby",
              :description => "Head, neck, face, feet and hands.",
              :product_attributes => [
                ProductAttribute.new(:time => 30, :price => 35),
                ProductAttribute.new(:time => 45, :price => 50),
                ProductAttribute.new(:time => 60, :price => 65)
              ]
            )
          ]
        ),
        Category.new(
          :name => "Body Treatments",
          :description => "Our body treatments are all our own protocols. Most of the products are designed and hand-produced on-site. We always use the very best organic and all natural ingredients we can find, and we look intensely. Quality is of the utmost importance to us. We currently have 3 types of 'Body Treatments', which include mud wraps, salt and sugar scrubs, and our all new menu of 'Exfoliating Wraps'."),
        Category.new(
          :name => "Scalp Treatments",
          :description => "A scalp treatment is a blend of organic oils that are all specifically chosen to help with dryness, irritation, dandruff, eczema, psoriasis, etc. They are all extremely nourishing and hydrating to the skin, scalp and hair. They also readily absorb into the skin, you will want to leave the oil blend on the hair for few hours to let it completely penetrate and condition.",
          :products => [
            Product.new(
              :name => "Brahmi Eucalyptus and Peppermint",
              :description => "Peppermint and bergamot are known to be refreshing and uplifting as well as headache and stress relieving. Sweet marjoram and eucalyptus are stimulating and therapeutic as they help to deeply relax the mind, ease muscle spasms, tension, soothe sinusitis, respiratory conditions, and this blend is effective in immune system stimulation.\n\n15 minute Mini add-on also available upon request.",
              :product_attributes => [
                ProductAttribute.new(:time => 30, :price => 45),
                ProductAttribute.new(:time => 50, :price => 65)
              ]
            ),
            Product.new(
              :name => "Brahmi Tranquility Blend",
              :description => "Let the intoxicating scent and therapeutic effects of palo santo, oranges, vetiver, and pine calm, ground, and deeply relax your mind and body, reduce pain in muscles and joints, loosen tight facia, increase circulation and stimulate your immune system, all the while helping to bring you into balance during any of our hectic seasons\n\n15 minute Mini add-on also available upon request.",
              :product_attributes => [
                ProductAttribute.new(:time => 30, :price => 45),
                ProductAttribute.new(:time => 50, :price => 65)
              ]
            )
          ]
        ),
        Category.new(
          :name => "Foot Treatments",
          :description => "From foot massage and reflexology to little body treatments to treat your feet!",
          :products => [
            Product.new(
              :name => "Foot Treatment",
              :description => "This treatment begins with a refreshing and softening treatment, exfoliation, reflexology and ends with a nourishing, cooling peppermint moisturizer.",
              :product_attributes => [
                ProductAttribute.new(:time => 50, :price => 60)
              ]
            ),
            Product.new(
              :name => "Reflexology",
              :description => "n'>Stimulation of reflex points on the hands and feet that correspond to organs and specific areas of the body to strengthen the immune system, control stress and improve overall health and well-being.",
              :product_attributes => [
                ProductAttribute.new(:time => 15, :price => 15),
                ProductAttribute.new(:time => 20, :price => 20),
                ProductAttribute.new(:time => 30, :price => 30)
              ]
            ),
            Product.new(
              :name => "Hot Stone Reflexology",
              :description => "us hot stones, essential oils, reflexology and foot massage.",
              :product_attributes => [
                ProductAttribute.new(:time => 50, :price => 60)
              ]
            )
          ]
        ),
        Category.new(
          :name => "Signature Treatments",
          :description => "Handmade therapies designed with massage therapy as the focus, performed in a specific sequence.",
          :products => [
            Product.new(
              :name => "Sadana",
              :description => "Inspired by the massage client who needs more. Some of us are so busy concentrating on our lives, work, and family that we forget about ourselves. So then comes Sadana, the massage treatment that helps one to settle down and remain. Warm, highly antioxidant, and hydrating muds incorporate with the hot stones and much much more.",
              :product_attributes => [
                ProductAttribute.new(:time => 120, :price => 170)
              ]
            ),
            Product.new(
              :name => "Ardra",
              :description => "Warm and succulent from the sea to detox and cleanse with nourishing oils, mind, and a green tea infusion. Seaweed and highly mineralized Dead Sea Salts stimulate and invigorate tired, sore, and worn-out bodies.",
              :product_attributes => [
                ProductAttribute.new(:time => 120, :price => 165)
              ]
            ),
            Product.new(
              :name => "Jalasa",
              :description => "Massage integration with the most nourishing minerals and purest essential oils on earth. Truly a haven for encouraging personal healing and relaxation from the outside in.",
              :product_attributes => [
                ProductAttribute.new(:time => 120, :price => 160)
              ]
            ),
            Product.new(
              :name => "Asi",
              :description => "Wrap, detox, hydrade, massage. Detoxifying mineral infusion.",
              :product_attributes => [
                ProductAttribute.new(:time => 120, :price => 160)
              ]
            )
          ]
        )
      ]
    },
    {
      :name => "Wraps",
      :description => "",
      :categories => [
        Category.new(
          :name => "Body Scrubs",
          :products => [
            Product.new(
              :name => "Exfoliate and Reydrate Aromatherapy Scrub",
              :description => "Sugar and salt aromatherapy scrub. Gently removes dry skin with mineral-rich Dead Sea salts, moisture retaining sugar, and a blend of nuturing, hydrating essential oils. For emotional balancing or detoxification - let us know when booking which would suit you best. Leaves skin petal soft, hydrated, and glowing.\n\nAdd to enhance any wrap or massage!",
              :product_attributes => [
                ProductAttribute.new(:time => 45, :price => 60)
              ]
            ),
            Product.new(
              :name => "Sugar and Roses",
              :description => "Exfoliate and rehydrate with sugar and roses! Sugar body scrub gently removes dry, dull skin with sweet humectant rich sugar along with the one and only, exceptionally remarkable, emotional and hormonal balancing rose essential oil. Leaves skin petal soft, hydrated, and glowing.\n\nAdd to enhance any wrap or massage!",
              :product_attributes => [
                ProductAttribute.new(:time => 45, :price => 65)
              ]
            )
          ]
        ),
        Category.new(
          :name => "Body Wraps",
          :products => [
            Product.new(
              :name => "Eucalyptus Wrap",
              :description => "Envelop yourself in the perfect warming stress-relieving hydration wrap of the season! Our very own special blend of essential oils infused into a hand-blended wrap to superbly hydrate dry, itch skin, ease mental and physical stress, and clear your head",
              :product_attributes => [
                ProductAttribute.new(:time => 90, :price => 120)
              ]
            ),
            Product.new(
              :name => "Warm Seaweed Wrap",
              :description => "Exceptionally beneficial to detoxify, re-mineralize and replenish the skin with protein-rich sea algae. Beginning with a body cleanse and exfoliation, next you will relax wrapped for 20-minutes as vitamins and minerals absorb into your skin, ending with a body massage with moisturizer.",
              :product_attributes => [
                ProductAttribute.new(:time => 90, :price => 120)
              ]
            ),
            Product.new(
              :name => "Red Sedona Heat Wrap",
              :description => "Experience this warm, soothing wrap designed to help relieve the aches and pains of stressed, fatigued and tight muscles. Delivering natures richest red seaweed and golden Arizona desert mud as a mineralizing, highly antioxidant, healing and nourishing heat therapy that loosens muscles and is the ultimate relaxation.",
              :product_attributes => [
                ProductAttribute.new(:time => 90, :price => 120)
              ]
            ),
            Product.new(
              :name => "Cooling Body Mask",
              :description => "This revitalizing treatment begins with a dry exfoliation to prepare the skin for maximum absorption. A cooling sensation envelopes you as menthol and mineral salts stimulate circulation, calm inflammation and pain.",
              :product_attributes => [
                ProductAttribute.new(:time => 90, :price => 120)
              ]
            ),
            Product.new(
              :name => "Tamanu Butter Cocoon",
              :description => "Our very own one-of-a-kind recipe Tamanu Massage Butter is unanimously voted to be the one of the best hydrators used by those who have had the pleasure! This is truly the ultimate in healing and hydration for the skin. We begin by slathering you in our very own exclusive Tamanu Massage Butter with a firm and rhythmic massage that will send you into la-la land. After you're plentifully massaged you will relax in a warm cocoon for 25 minutes, and hot herbal compresses follow to remove any excess butter. We should call it a Nirvana session for your skin.",
              :product_attributes => [
                ProductAttribute.new(:time => 90, :price => 130)
              ]
            )
          ]
        ),
        Category.new(
          :name => "Exfoliating Wraps",
          :products => [
            Product.new(
              :name => "Coconut Avocado Exfoliating Wrap",
              :description => "This is one of the most effective all natural, organic hydration treatments you can experience! Coconut, sugar, avocado oil, and a sweet exotic essential oil will take your skin into tranquility land.",
              :product_attributes => [
                ProductAttribute.new(:time => 50, :price => 75)
              ]
            ),
            Product.new(
              :name => "Wild Honey Apricot Exfoliating Wrap",
              :description => "Nothing hydrates quite like Peter Seling's enzyme-rich raw and wild honey combined with nutrient-rich apricot and skin remineralizing Dead See Salts. Truly an experience for the skin.",
              :product_attributes => [
                ProductAttribute.new(:time => 50, :price => 75)
              ]
            ),
            Product.new(
              :name => "Goatmilk Turmeric Detoxifying Exfoliating Wrap",
              :description => "This is one of our favorite treatments. Inspired by the Ayurvedic health philosophy. Very fine skin polishing exfoliant with sumptuous skin nourishing goatmilk with (the most amazing herb on the planet) turmeric and more detoxifies and nourishes the skin in totally different ways than any oil based treatments. Epicurean for the skin.",
              :product_attributes => [
                ProductAttribute.new(:time => 50, :price => 75)
              ]
            )
          ]
        )
      ]
    },
    {
      :name => "Hair Removal",
      :description => "We perform hair removal services for men and women both!",
      :categories => [
        Category.new(
          :name => "Women's Hair Removal",
          :description => ""),
        Category.new(
          :name => "Men's Hair Removal",
          :description => "")
      ]
    },
    {
      :name => "Skin Care",
      :description => "A Touch Of Tranquility will make your skin feel like buttah.",
      :categories => [
        Category.new(
          :name => "Personalized Facials",
          :description => "A Touch Of Tranquility skin care services always include skin consultation, cleansing, exfoliation, warm steam, extractions (if needed), as well as a tranquil scalp and facial massage.\n\nOur results driven facials are customized per your concerns and needs. One of our highly trained estheticians will design your facial experience just for you! \n\nOur estheticians are here to educate you how to take the best care of your skin at home.",
          :products => [
            Product.new(
              :name => "Mini Facial",
              :description => "This quick pick me up facial treatment is all about exfoliation, relaxation and hydration. For those who want to sample what a facial is about or are short on time.",
              :product_attributes => [
                ProductAttribute.new(:time => 30, :price => 40)
              ]
            ),
            Product.new(
              :name => "Rejuvenating Facial",
              :description => "Designed for aging and environmentally damaged skin. A skin care treatment that will wow you with the basics 'Image Skin Care' has to offer. Minimizes the appearance of fine lines and wrinkles, leaving the skin youthful and radiant. Great for all skin types.",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 70),
                ProductAttribute.new(:time => 90, :price => 100)
              ]
            ),
            Product.new(
              :name => "Vital C Facial",
              :description => "REHYDRATE-REPAIR-RENEW!\n\nDesigned for sensitive, dehydrated, rosacea and irritated skin. Rich in Vitamin C and anti-oxidants. Soothes, calms and renews tired, dull looking skin.",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 70)
              ]
            ),
            Product.new(
              :name => "O2 Oxygen Facial",
              :description => "This revolutionary and luxurious treatment exfoliates, illuminates and oxygenates! It infuses plant-derived stem cells, peptides, and a high concentration of enzymatic botanicals into the skin, leaving it luminous, refreshed and rejuvenated!",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 120)
              ]
            ),
            Product.new(
              :name => "Max Repairing Facial",
              :description => "Latest advancement in anti-aging! This exclusive facial REPAIRS cell damage. Provides protection at the cellular level against nutritional imbalance, oxidative stress, UV damage, and even repairs DNA and plumps skin.\n\n*Post treatment kit of Image products to take home\n\n**Great for all skin types**",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 90)
              ]
            ),
            Product.new(
              :name => "The Signature Facelift",
              :description => "A 4-layered peel gentle enough for first timers. This revolutionary signature facelift will change the image of your skin in just one application. Utilizing a 30% Vitamin C resurfacing Enzyme that speeds up cellular turnover to brighten, tighten and lighten your skin in just one treatment. For rosacea, pregnancy, dry/  dehydrated, smokers, dull/tired post microdermabrasion, post surgery.\n\n *Post treatment kit of Image products to take home\n\n**Great for all skin types",
              :product_attributes => [
                ProductAttribute.new(:time => 50, :price => 85),
                ProductAttribute.new(:time => 80, :price => 115)
              ]
            ),
            Product.new(
              :name => "Facial for Teenagers",
              :description => " This treatment concentrates on the difficulties of Teen Skin and will be customized for your individual needs.We feel education is most important in understanding how to take care of problematic skin, you 'll have a simple, understandable treatment plan and go home with a sample kit of products to continue maintaining the healing and balancing effects of your skin care treatment.\n\n *Post treatment kit of Image products to take home\n\n**Great for all skin types",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 75)
              ]
            ),
            Product.new(
              :name => "Acne Clear Cell Facial",
              :description => "CLARIFY-CLEAR-CLEANSE!\n\nGreat for acne. Formulated with a fleet of anti-acne ingredients to improve acne and acne-prone oily skin.",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 75)
              ]
            ),
            Product.new(
              :name => "Back Cleansing",
              :description => "Deep cleansing treatment for dryness, dehydration, acne, or other skin conditions on your back. We' ll assess your skin care needs and guide you through the best treatment plan .60 minute ",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 90)
              ]
            )
          ]
        ),
        Category.new(
          :name => "Organic Skin Care",
          :description => "Our immediate visible results facials are customized per your concerns and needs. One of our highly trained estheticians will design your facial experience just for you with clean, nourishing organic skin care.",
          :products => [
            Product.new(
              :name => "Organic Passionfruit Peel",
              :description => "An ultra hydrating botanical skin care treatment infused with organic Japanese green tea and a copper complex peptide that continuously balances your skin from within and lastingly restores its ideal moisture level. Organic aloe vera, arnica montana and licorice quickly help reduce redness and other signs of irritation while bringing sensitive skin into healthy balance. Acceleration of wound healing, cell regeneration and stimulation of elastin and collagen synthesis. Essential antioxidants and minerals to improve skin health. Hyaluronic acid and Antioxidants leave your skin intensely hydrated with a healthy glow.",
              :product_attributes => [
                ProductAttribute.new(:time => 30, :price => 40),
                ProductAttribute.new(:time => 60, :price => 70),
                ProductAttribute.new(:time => 90, :price => 100)
              ]
            ),
            Product.new(
              :name => "Organic Passion Peptide Peel",
              :description => "A papaya, pineapple, pumpkin and mango infused blend of organic and medically effective ingredients designed to rebalance tired, stressed and dull-looking skin. This non-chemical peel naturally rebalances, regenerates, restores and soothes your skin with organic ingredients.",
              :product_attributes => [
                ProductAttribute.new(:time => 30, :price => 85)
              ]
            )
          ]
        ),
        Category.new(
          :name => "Facial Peels",
          :description => "Our peels are very active and immediate visible results can be seen. Each peel will be customized per your concerns and needs. One of our highly trained estheticians will design and modify your peel to maximize your results and guide you through a treatment plan to manage your targeted goals.\n\nAll peels are 30 minutes and include treatment plan, directions, and at home maintenance products.",
          :products => [
            Product.new(
              :name => "Vitamin C Peel",
              :description => "REHYDRATE-REPAIR-RENEW!\n\nA peel designed for sensitive, dehydrated, rosacea and irritated skin. Rich in Vitamin C and anti-oxidants. Soothes, calms and renews tired, dull looking skin and evens out fine lines. Incredible visible results.",
              :product_attributes => [
                ProductAttribute.new(:price => 85)
              ]
            ),
            Product.new(
              :name => "Acne Lift Peel",
              :description => "A beta-hydroxy acid cocktail. This safe and outstanding resurfacing modality has a dual benefit. It reduces and treats all kinds of acne while resurfacing and smoothing the skin after just one treatment",
              :product_attributes => [
                ProductAttribute.new(:price => 85)
              ]
            ),
            Product.new(
              :name => "The Lightening Lift",
              :description => "An Alpha Hydroxy peel using lactic and kojic acid for natural lightening of superficial pigmentation, sun/brown spots, and uneven skin tone",
              :product_attributes => [
                ProductAttribute.new(:price => 85)
              ]
            ),
            Product.new(
              :name => "The Max Age Repairing Lift",
              :description => "This revolutionary treatment tightens and strengthens the skin, increases moisture retention, prevents and reverses the signs of aging, and repairs cell damage",
              :product_attributes => [
                ProductAttribute.new(:price => 95)
              ]
            ),
            Product.new(
              :name => "Jessner's Peel",
              :description => "This peel addresses moderate to severe photo damage, discoloration or mottled skin, rough texture, and clogged and congested skin as well as fine lines and wrinkle",
              :product_attributes => [
                ProductAttribute.new(:price => 150)
              ]
            )
          ]
        )
      ]
    },
    {
      :name => "Firefly Henna",
      :description => "A Touch of Tranquility Massage Therapy and Wellness Spa is thrilled to invite the very talented Caitlin Kelce of Firefly Henna to join us!\n\nProviding the highest quality product and service you would only expect From A Touch of Tranquility.\n\nOur focus is to help you feel your best by being attentive to your particular needs and cultivating a safe, effective, healing, relaxing and professional-result-oriented massage just for you.",
      :categories => [
        Category.new(
          :name => "Group and Party Henna Sessions",
          :description => "All group and party sessions include design choices from our portfolio for the group or custom created designs for your theme. All guests will receive embellishments, such as gems and glitter for your henna. The artist will apply traditional lemon and sugar sealant to help promote a darker stain and detailed instructions for each guest to take home.",
          :products => [
            Product.new(
              :name => "Small Group Henna (5 people max)",
              :description => "",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 85)
              ]
            ),
            Product.new(
              :name => "Henna Party (8 people max)",
              :description => "",
              :product_attributes => [
                ProductAttribute.new(:time => 120, :price => 145)
              ]
            )
          ]
        ),
        Category.new(
          :name => "Henna Sessions",
          :description => "Stuff about henna",
          :products => [
            Product.new(
              :name => "Individual Henna Sessions",
              :description => "All individual sessions include your choice of a design from our portfolio or a custom design created on the spot. Artist will apply traditional lemon and sugar sealant to help promote a darker stain and detailed instructions will be given to take home.",
              :product_attributes => [
                ProductAttribute.new(:time => 10, :price => 15),
                ProductAttribute.new(:time => 30, :price => 35),
                ProductAttribute.new(:time => 45, :price => 50),
                ProductAttribute.new(:time => 60, :price => 70),
                ProductAttribute.new(:time => 90, :price => 105),
                ProductAttribute.new(:time => 20, :price => 140)
              ]
            ),
            Product.new(
              :name => "Henna Crown Art",
              :description => "Henna Crowns are a temporary, safe and all-natural form of body-art for people experiencing hair loss. We take all precautions to keep you safe using 100% Natural Organic Henna Powder, 100% Natural High Altitude Lavender Essential Oil, and Natural Lemon Juice and Sugar in our paste. A Henna Crown is a way to give you beauty and confidence during a vulnerable time. Please contact us before your appointment to discuss symbols and motifs for your crown design.",
              :product_attributes => [
                ProductAttribute.new(:time => 120, :price => 120)
              ]
            )
          ]
        ),
        Category.new(
          :name => "Special Occasion Henna",
          :description => "We offer an array of designs for you to choose from for your big event. If you have specific idea in mind we are happy to put something together to make your dream design come to life. Gems and glitter can be added to embellish your special design. Sealant and wrapping are provided and detailed instructions for aftercare will be given for you to take home.",
          :products => [
            Product.new(
              :name => "Pregnancy Belly Henna",
              :description => "",
              :product_attributes => [
                ProductAttribute.new(:time => 120, :price => 120)
              ]
            ),
            Product.new(
              :name => "Bridal Shower Henna (Bride + 8 guests max)",
              :description => "",
              :product_attributes => [
                ProductAttribute.new(:time => 150, :price => 200)
              ]
            )
          ]
        )
      ]
    },
    {
      :name => "Wellness",
      :description => "",
      :categories => [
        Category.new(
          :name => "Ancient and Healing Arts",
          :description => "",
          :products => [
            Product.new(
              :name => "Reiki",
              :description => "A Japanese technique for stress reduction that also promotes healing. Based on the idea that energy flows through us and is what allows us to be alive. If one's energy is low or blocked, we are more likely to get sick or feel stress. If it is high or open, we are more capable of being happy and healthy.\n\n<b>Reiki</b> is an ancient form of energetic healing practice performed by only the laying of the hands on or near the body. <b>Reiki</b> helps to balance the mind and body, and can contribute to healing on the physical, emotional, mental, and spiritual levels. It promotes relaxation, accelerates the body's natural healing processes, increases creativity, clears toxins, aligns the chakras, and imparts the recipient with a sense of well-being.\n\nPlease wear comfortable clothes and we ask no metal on the body for this type of bodywork.",
              :product_attributes => [
                ProductAttribute.new(:time => 60, :price => 75),
                ProductAttribute.new(:time => 30, :price => 45)
              ]
            ),
            Product.new(
              :name => "Shiatsu",
              :description => "A 5000 year old form of holistic healing. <b>Shiatsu</b>, which can be translated as <i>\"finger pressure\"</i>, has been described as needle-free <u>acupuncture</u>.\n\n<b>Shiatsu</b> involves applying pressure, acupressure, stretching, and massage to special points or areas on the body called <b>Meridians</b> or energy pathways, in order to maintain physical and mental well-being, treat disease, or alleviate discomfort. It treats the whole body, not just one symptom.\n\n<b>Shiatsu</b> has a great reputation for reducing stress and reliving muscular pain or tension, especially neck and back pain. It also appears to have sedative effects and may alleviate insomnia. In a broader sense, <b>shiatsu</b> is believed to enhance health, physical vitality, and emotional well-being, and also to improve circulation and boost the immune system. Some people use it to treat various disorders of the gastrointestinal tract, menstrual and menopausal problems, chronic pain, migraines, arthritis, anxiety, depression, and many other ailments. Comfortable clothing is required for this session.",
              :product_attributes => [
                ProductAttribute.new(:time => 90, :price => 105),
                ProductAttribute.new(:time => 60, :price => 75),
                ProductAttribute.new(:time => 30, :price => 45)
              ]
            )
          ]
        )
      ]
    },
    {
      :name => "Collections",
      :description => "",
      :categories => [
        Category.new(
          :name => "Tranquility Membership Packages",
          :description => "By purchasing an A Touch Of Tranquility membership package, you're eligible for our sliding-fee discounted rates! These are designed for those who frequent the spa due to injuries or managing stress levels.\n\nPackages include: emailed newsletter, discounts on services, exclusive deals and promotions, and first-to-know on events, seminar, and workshops.",
          :products => [
            Product.new(
              :name => "Frequent Flyer packages",
              :description => "Discounted pre-purchased services.\n\nEach package set includes 7 sessions and will need to be used within 8 months of purchase date.",
              :product_attributes => [
                ProductAttribute.new(:time => 30, :price => 215),
                ProductAttribute.new(:time => 45, :price => 320),
                ProductAttribute.new(:time => 60, :price => 405),
                ProductAttribute.new(:time => 90, :price => 615),
                ProductAttribute.new(:time => 120, :price => 825)
              ]
            )
          ]
        ),
        Category.new(
          :name => "Celebration Packages Coming Soon",
          :description => "Please call (607) 769-8080 if you have special requests!"),
        Category.new(
          :name => "Shangri-La Packages",
          :description => "The ultimate in luxury",
          :products => [
            Product.new(
              :name => "Just Beyond the Horizon",
              :product_attributes => [
                ProductAttribute.new(:price => 65)
              ],
              :description => "Sample what we are all about with a 30 Minute Massage and 30 Minute Signature Brahmi Hot Oil Scalp Remedy!"),
            Product.new(
              :name => "I Can See Paradise",
              :product_attributes => [
                ProductAttribute.new(:price => 65)
              ],
              :description => "A perfect mid-day \"please relax me\" with a 30 Minute Massage and a quick pick-me-up 30 Minute Facial to follow."),
            Product.new(
              :name => "My Utopia",
              :product_attributes => [
                ProductAttribute.new(:price => 120)
              ],
              :description => "Utopia lies within this 60 Minute Massage with a luxurious Rejuvenation Facial."),
            Product.new(
              :name => "The Lost Horizon",
              :product_attributes => [
                ProductAttribute.new(:price => 130)
              ],
              :description => "is in this package - 60 Minute Tranquility Massage surrounds you with the exotic scents of our Signature Tranquility blend leading you into a beautiful Rejuvenating Facial."),
            Product.new(
              :name => "Exquisite Bliss",
              :product_attributes => [
                ProductAttribute.new(:price => 115)
              ],
              :description => "A beautiful 90 Minute Massage tailored to your specific needs followed with an extra 30 Minutes of our Reflexology with our very own signature foot balm!"),
            Product.new(
              :name => "This Is No Myth",
              :product_attributes => [
                ProductAttribute.new(:price => 150)
              ],
              :description => "Seriously real and incredible... 60 Minute Hot Stone Massage with our signature oil blend, plentifully infused with aromatherapeutic oils, and finishing with our immediate visible result Facelift Facial or Peel of your choice."),
            Product.new(
              :name => "A Permanently Happy Land",
              :product_attributes => [
                ProductAttribute.new(:price => 145)
              ],
              :description => "Is the deeply relaxing, luxurious, and therapeutic 60 Minute Rhythmic Warm Bamboo Massage with our signature oil blend and our super hydrating target specific Facelift Facial or Peel of your choice."),
            Product.new(
              :name => "The Elixir Of Life",
              :product_attributes => [
                ProductAttribute.new(:price => 125)
              ],
              :description => "Now we're getting there... 90 Minutes of pure you time Massage with our very own signature oil blend and a 30 Minute Signature Brahmi Hot Oil Scalp Remedy."),
            Product.new(
              :name => "An Opulent Dream Lane",
              :product_attributes => [
                ProductAttribute.new(:price => 215)
              ],
              :description => "With a full 90 Minutes of Hot Cinnamon and Citrus Infusion, 50 Minutes of the amazing Facelift Facial, and finishing with a 30 Minute Signature Brahmi Hot Oil Scalp Remedy...\n\n<i>\"I must be dreaming...\"</i>"),
            Product.new(
              :name => "Into A Mystical Harmonious Valley",
              :product_attributes => [
                ProductAttribute.new(:price => 270)
              ],
              :description => "Beginning with the warming and cooling endearment of the Ardra Massage Ritual, then moving into a wondrous Facelift Facial, and finishing up with a 30 Minute Signature Brahmi Hot Oil Scalp Remedy brings you into harmony..."),
            Product.new(
              :name => "Ahhh... My Shangri-La Package",
              :product_attributes => [
                ProductAttribute.new(:price => 295)
              ],
              :description => "Every human sense is paid tribute to and nourished through this beautifully enlightening experience.Beginning with the 2 hour Sadana Massage Ritual, moving into an exquisite Maxx Reparing Facial, with a 50 Minute Signature Scalp Treatment...\n\n<i>\"You, literally, may need a ride home.\"</i>")
          ]
        )
      ]
    }
  ]

  collections.each do |cc|
    a = CategoryCollection.find_or_create_by!(:name => cc[:name])
    puts "Saving #{a.class} #{a.name}"
    a.attributes = cc
    a.save!
  end

  Schedule.create(
    :name => "Spa Hours",
    :events => [
      Event.new(:day => "Monday", :start_time => "9:30 am", :end_time => "4:00 pm"),
      Event.new(:day => "Tuesday", :start_time => "10:00 am", :end_time => "7:00 pm"),
      Event.new(:day => "Wednesday", :start_time => "9:00 am", :end_time => "7:00 pm"),
      Event.new(:day => "Thursday", :start_time => "9:00 am", :end_time => "8:00 pm"),
      Event.new(:day => "Friday", :start_time => "9:00 am", :end_time => "8:00 pm"),
      Event.new(:day => "Saturday", :start_time => "10:00 am", :end_time => "4:00 pm"),
      Event.new(:day => "Sunday", :start_time => "11:00 am", :end_time => "4:00 pm")
    ]
  )

  snippet_collections = [
    {
      :name => "Spa Policies & Medical Massage",
      :description => "Thank you for choosing A Touch of Tranquility to support and guide you through your therapy. As your professional massage therapy office we are here to help you to achieve a better quality of living for you following your accident and/or injury.\n\nClick here for a printable copy of this page for your records: <a href='forms/InsuranceClientWelcomePoliciesLetter.pdf' class='btn btn-success btn-sm'> 'Download Form'</a>\n\n",
    }
  ]

  snippet_collections.each do |s|
    a = SnippetCollection.find_or_create_by!(:title => s[:title])
    puts "Saving #{a.class} #{a.name}"
    a.attributes = s
    a.save!
  end

  snippets = [
    { :title => "Insurance and Worker's Compensation Policies", :active => true, :body => "We accept some no-fault insurance and pre-authorized worker's compensation claims, both of which you are responsible for knowing the conditions and terms of the policy (particularly if Massage Therapy is covered and under what terms). We participate in flex plan claims, United Health Care ACN United Naturally plans and various other plans. You are fully responsible for payment in the event of a denied claim. Insurance clients will also be billed a 50% time/service fee for no shows and 30% for not canceling 24 hours ahead.\n\nAgain, you are fully responsible for payment in the event of a denied claim.\n\nWe do not currently accept health insurance claims at this time.\n\nWe reserve 30 or 45 minutes for insurance clients, so please arrive a few minutes before your session start time. That way you'll be ready for your session by the time we are." },
    { :title => "Your first session", :active => true, :body => "Please arrive 15 minutes early to fill out the documents we require for treatment.\n\nBring your insurance information by or before your first session.\n\nWe will evaluate you during your first massage and set up a treatment plan that we feel will provide you the most benefit.\n\nEvery session you will have at a Touch of Tranquility will be dedicated to how you are feeling each day. We will check in with you each time you arrive for a session; therefore we know better how to treat the 'you' that comes in that day and not the 'you' from a month ago." },
    { :title => "Cancellations", :active => true, :body => "We reserve a specified amount of time for each client.\n\nPlease be mindful of our time and let us know 24 hours in advance if you cannot be present, so we can book that time with another patient who may be on our waiting list.\n\nNo-show or last minute cancellations will not be tolerated.\n\nA credit card will be kept securely on file. In the the event of a no-show or cancellation at the time of a session, we reserve the right to charge the card on file for the full amount of scheduled service. If the card is denied or you do not pay another way, we will regretfully no longer be able to treat you.\n\nThank you for your cooperation.\n\nWe look forward to helping you positively progress." },
    { :title => "Spa Address", :active => true, :body => "" },
    { :title => "Announcement", :active => false, :body => "" },
    { :title => "Book Now (Mobile)", :active => true, :body => "" },
    { :title => "Book Now", :active => true, :body => "" },
    { :title => "Landing", :active => true, :body => "Our healing spa landed in our Corning location in 2003. We have stretched, grown, and moved forward over the years because of all that has been contributed here. We have learned from you and through our practitioners, and that has brought us to a deeply centered and compassionate place with our very own identity. It is unique, thoughtful, and rich with life, details and gorgeous simplicity. We cultivate a healing sanctuary for you to feel comfortable in, enhancing you each and every time you visit." },
  ]

  snippets.each do |s|
    a = Snippet.find_or_create_by!(:title => s[:title])
    puts "Saving #{a.class} #{a.title}"
    a.attributes = s
    a.save!
  end
end
