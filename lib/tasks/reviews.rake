namespace 'reviews' do
  desc 'Add the reviews to the db'
  task 'add' => :environment do
    reviews = [
      {
        date: 'Sep 30, 2015',
        active: false,
        customer_name: 'Jessica  H',
        rating: 5,
        title: 'Awesome experience',
        body: "Never had a bad experience. Jill is awesome. I always leave feeling relaxed. Reasonable prices and great customer service."
      },
      {
        date: 'Sep 23, 2015',
        active: false,
        customer_name: 'Brenda VanPelt',
        rating: 5,
        title: 'perfection',
        body: "My back and neck and head the best results i could get i sleep in a chair due to the pain in my neck and back after christine got done i could move and breathe easier and no longer have the nerve jumping in my hand from the compression in my neck thank you so much you are the best."
      },
      {
        date: 'Sep 22, 2015',
        active: false,
        customer_name: 'Diane H',
        rating: 5,
        title: 'A Touch of Heaven!',
        body: "Every time I pass through the Corning area, I make sure I have enough time to fit in a spa visit.  LOVE LOVE LOVE the hot oil scalp treatment and this last time, my daughter and I did henna tattoos.  It was fun and everyone is absolutely amazed when I tell them that Caitlin drew the design free hand.  Everyone is professional and friendly!  "
      },
      {
        date: 'Sep 19, 2015',
        active: false,
        customer_name: 'Kira Herman',
        rating: 5,
        title: 'One among the best of the best',
        body: "As a frequent customer to spas I can truly say 'A Touch of Tranquility' is among the best of the best. Each employee makes you feel completely comfortable and accepted making your experience a relaxing one. The hot oil scalp massage is a thing of pure bliss! This was my second trip to the spa in Corning and I can assure you, despite the 3 and a half hour drive, there will be more trips in the future!"
      },
      {
        date: 'Sep 17, 2015',
        active: false,
        customer_name: 'K.S.',
        rating: 5,
        title: 'Amazing',
        body: "I absolutely love going to A Touch of Tranquility! Everyone is so nice and knows exactly what they are doing. I love being able to go get a great massage, and actually feel relaxed coming out. I would never go anywhere else but here!"
      },
      {
        date: 'Sep 15, 2015',
        active: false,
        customer_name: 'R.C.',
        rating: 5,
        title: 'Just keeps getting better!',
        body: "I shouldn't be surprised but every time I return it is a little more extraordinary.  Christina becomes even more exceptional as you return again and again.  She and the products she creates are one of a kind!"
      },
      {
        date: 'Aug 3, 2015',
        active: true,
        customer_name: 'Laura D',
        rating: 5,
        title: 'So. Awesome.',
        body: "No matter what I need from them,  they deliver.  A relaxing massage,  a deep massage,  Brazilian and eyebrow waxing (ps. Absolute best waxing ever)  They even work with you if you have sensitive skin!  Make sure you check them out next time you need something done! "
      },
      {
        date: 'Aug 1, 2015',
        active: true,
        customer_name: 'Casey Smith',
        rating: 5,
        title: 'Amazing place',
        body: "I came here my very first visit and the woman was so kind and friendly! Great place with very helpful, friendly, and knowledgable staff!! "
      },
      {
        date: 'Aug 1, 2015',
        active: true,
        customer_name: 'J.S.',
        rating: 5,
        title: 'Absolutely Perfection!!',
        body: "As always Christina knows what my body needs more than I do!  I didn't realize how over due I was for a session.  I walked out of that office like jell-O!  I love that I know I will always get a wonderful massage from a skillful therapist!  Thank you so much!!! "
      },
      {
        date: 'July 30, 2015',
        active: true,
        customer_name: 'Andrea  Ervay',
        rating: 5,
        title: 'One of the Best Massages Ever',
        body: "I am always hesitant to check out a new massage therapist. However, I was in town visiting and wanted to treat my mom to a massage. After calling around to a couple places, Christina was very friendly when I called Tranquility so I decided to book with her and her colleague. I had been traveling so I was looking for a relaxation massage, and Christina exceeded my expectations. My mom also had a great experience and said her massage therapist was so good, she fell asleep! Definitely recommend! "
      },
      {
        date: 'July 25, 2015',
        active: true,
        customer_name: 'Jessica Bard',
        rating: 5,
        title: 'Great Massage!',
        body: "I had a great experience at A Touch Of Tranquility. I had a gift card for a 90 minute massage. The staff is professional and know what they're doing. The facility is clean. Over all, I had a very relaxing full body massage experience. "
      },
      {
        date: 'July 21, 2015',
        active: true,
        customer_name: 'D.W.',
        rating: 5,
        title: 'Massage',
        body: "Jill does an amazing job.  She can do a deep tissue massage or a relaxation massage, whatever you need.  She is friendly and professional.  I have recommended her to several friends and they have been pleased with her work as well.  I have been going every other week for over a year now and she has really helped to decrease my lower back pain.  I would highly recommend her if you are looking for a great massage!"
      },
      {
        date: 'July 20, 2015',
        active: true,
        customer_name: 'k.k.',
        rating: 5,
        title: 'great staff in a relaxing atmosphere',
        body: "The staff is friendly and attentive.  I have had 2 different massage therapists who were both excellent.  An hour massage is money well spent for me!  "
      },
      {
        date: 'July 19, 2015',
        active: true,
        customer_name: 'R.B.',
        rating: 5,
        title: 'Flexibility',
        body: "Although Julie does not normally do the sort of deep-tissue massage I prefer, she  responded  with strength and skill to my feedback throughout the wonderful 90-minute session.    I hope to book with  her again!"
      },
      {
        date: 'July 13, 2015',
        active: true,
        customer_name: 'Nikki Cheatham',
        rating: 5,
        title: 'N/A',
        body: "A very pleasant experience from start to finish.  Carissa addressed my specific skin issue concerns, was knowledgeable and professional"
      },
      {
        date: 'July 4, 2015',
        active: true,
        customer_name: 'C.H.',
        rating: 5,
        title: 'excellent!',
        body: "I was able to get a same day appointment the day before Fourth of July. Excellent service; friendly, quick and reasonably priced. Thank you!"
      },
      {
        date: 'July 4, 2015',
        active: true,
        customer_name: ' .c.',
        rating: 5,
        title: 'Great Job',
        body: "Can fit schedule, great massage, on schedule. Can recommend to anyone needing tight muscles fixed.  Therapists are professional, timely and very good."
      },
      {
        date: 'July 1, 2015',
        active: true,
        customer_name: 'Kim M',
        rating: 5,
        title: 'Highly recommend for chronic pain!',
        body: "I have been receiving massage here for chronic pain for several years now--and would highly recommend it to anyone needing either pain relief or just a relaxing escape. Christina has been my primary therapist, but I have also received massage from Kim Cudlin. Christina has perfected the art of relieving painfully tight muscles without causing more pain in the process. Kim is extremely strong, and able to deliver strong pressure where needed and more delicate pressure to the more tender areas."
      },
      {
        date: 'June 28, 2015',
        active: false,
        customer_name: 'm.m.',
        rating: 1,
        title: 'Review massage',
        body: "This was not my best experience and these are the reasons why. There was no soft relaxing music being played in my room. I could hear in detail conversations occurring in the salon where the therapists were . it was very disruptive and NOT at all relaxingat one point I heard a blow dryer. I also heard the tick of the clock for an hour. Another short coming was that the massage bed warmer was not on and there were no jot compress towels placed after an area was massaged.  Maybe this is not common"
      },
      {
        date: 'June 27, 2015',
        active: true,
        customer_name: 'J.F.',
        rating: 5,
        title: 'waxing',
        body: "My appointment was timely, and the results of the waxing were excellent with respect to positive experience at the spa, advice as to after care, and reasonable pricing.  I will definitely visit again, and will recommend to friends given my overall experience.  Thank you!"
      },
      {
        date: 'June 20, 2015',
        active: true,
        customer_name: 'R.C.',
        rating: 5,
        title: 'Just what my body needed!',
        body: "A Touch of Tranquility is highly recommended!I run, walk, swim, bike, and workout a lot.  When I'm not sleeping, I'm working between a chair and keyboard.  This was just what my body needed.  I was so focused on nutrition and exercise I neglected the importance of giving my body true relaxation and reset.  Julie Rose is fantastic!  For those who work between a chair and keyboard the hand massage is a must.  I've already booked another appointment. "
      },
      {
        date: 'June 13, 2015',
        active: true,
        customer_name: 'Kim M.',
        rating: 5,
        title: 'Compassionate, expert, pleasurable relief for chronic pain',
        body: "As someone who suffers from chronic pain, I could not more highly recommend Christina. She has worked hard to perfect her technique--and is able to relieve my pain while not causing me more pain in the process--something I have not found with past massage therapists. For an hour every week. I can escape to this peaceful, welcoming place and be pampered. I love it!"
      },
      {
        date: 'June 11, 2015',
        active: true,
        customer_name: 'Patricia Lobo',
        rating: 5,
        title: 'The best massage I have had',
        body: "This was my first massage and facial in the U.S. And the best out of all I had so far. The place is so peaceful and calm, I enjoyed the massage, I could feel my leg muscles losen up. Julie was amazing!!! I will come back for sure. You guys rock!!!"
      },
      {
        date: 'June 5, 2015',
        active: true,
        customer_name: 'N.T.',
        rating: 5,
        title: 'another amazing massage',
        body: "Once again Christina hit the ball out of the park, releasing muscle knots that have been there for years and creating a deep tissue relaxation that lasts for days. Just when you think she can't get any better she does."
      },
      {
        date: 'May 12, 2015',
        active: true,
        customer_name: 'Tara Kirtland',
        rating: 5,
        title: 'Outstanding Service',
        body: "I came to get a Brazilian and didn't have a preference in staff members seeing as I am new to the area and Just wanted a wax.  I ended up having an appointment with Carissa and she was outstanding.  It didn't hurt me at all and she was super friendly, courteous and professional.   I had no red bumps like I use to get with my old wax lady. I loved the oil she had me apply after to help the healing process.  I will definetly be back and will use Carissa from here on out for my waxing services.  "
      },
      {
        date: 'Apr 30, 2015',
        active: true,
        customer_name: 'L.k.',
        rating: 5,
        title: 'No more pain!',
        body: "Having never had a massage I was a little reluctant about booking a visit.  I didn't know if they would be able to help my chronic back pain and I didn't want to waste the money.  Thankfully I didn't listen to myself and went.  I've abused my poor body for years and my back has paid the price.  My lower back would almost always ache and no matter what I did it would hurt.  Julie worked her magic and it is amazing, here I sit a day later with NO pain.  It was a fantastic experience!!!!!"
      },
      {
        date: 'Apr 28, 2015',
        active: true,
        customer_name: 'Diane H',
        rating: 5,
        title: 'Truly luxurious',
        body: "I signed up for the 50 minute hot oil scalp therapy.  Even though it is called scalp therapy, it is a whole body experience!  Our technician used many simple touches that made the experience so relaxing and luxurious.  I will do this treatment every time I find myself in Corning.  I highly recommend it but be warned, do not plan to do anything after the service - you will not want to be seen in public with that hair!"
      },
      {
        date: 'Apr 22, 2015',
        active: true,
        customer_name: 'Lisa B',
        rating: 5,
        title: 'whole body relaxation!',
        body: "Decided to try a different massage therapist and was glad I did. Jill had a very gentle and relaxing touch. Christina is still the ONE! But Jill runs a close 2nd!"
      },
      {
        date: 'Apr 16, 2015',
        active: true,
        customer_name: 'KATIE S',
        rating: 5,
        title: 'Waxing',
        body: "My experience with waxing was amazing. I love the way the girl was so nice and caring. She told me straight up if it would hurt or not, and I appreciated that so much. I will be returning again! Excellent service :)"
      },
      {
        date: 'Apr 13, 2015',
        active: true,
        customer_name: 'molly lowery',
        rating: 5,
        title: 'massage',
        body: "Very good experience. Will be back to have more work done! Relaxed and could feel a difference that day."
      },
      {
        date: 'Apr 9, 2015',
        active: true,
        customer_name: 'R.C.',
        rating: 5,
        title: 'Bliss!',
        body: "An hour in Christina's hands is one of the most delightful things you can do for yourself.  Her touch and ability are exceptional...and you will always want to return for more!"
      },
      {
        date: 'Apr 3, 2015',
        active: true,
        customer_name: 'Arian K',
        rating: 5,
        title: 'Health and relaxation',
        body: "I had only been to Christina for waxing services and recently decided to try massage. Glad I made that choice! Christina's beautiful, grounded nature came through in my massage, and I walked away feeling physically and emotionally wonderful! "
      },
      {
        date: 'Mar 18, 2015',
        active: true,
        customer_name: 'Alison Hurlbert',
        rating: 5,
        title: 'Pure Relaxation',
        body: "On walking into their waiting area, I was immediately at ease. The environment is tranquil, and the staff are so enjoyable! My massage therapist's name was Julie. Julie is a bright, bubbly young woman and a credit to her profession. We discussed target areas that I felt needed to be worked on, and as the title says, pure relaxation. I absolutely will be going back in the future and would recommend Touch of Tranquility to anyone in need of pampering!"
      },
      {
        date: 'Mar 16, 2015',
        active: true,
        customer_name: 'Ellie L',
        rating: 5,
        title: 'Wonderful!',
        body: "We received the couples massage, and enjoyed the experience very much. The therapists were very professional. Music was a bit loud, for me...... We would go back, for sure."
      },
      {
        date: 'Mar 16, 2015',
        active: true,
        customer_name: 'r.b.',
        rating: 5,
        title: 'close attention',
        body: "The massage therapists at Touch of Tranquility are not only highly skilled, but also pay close attention to the client's needs.  This is definitely not a cookie-cutter operation!"
      },
      {
        date: 'Feb 18, 2015',
        active: true,
        customer_name: 'future customer',
        rating: 4,
        title: 'massag',
        body: "I got a deep tissue and relaxation massage. The atmosphere was relaxing in itself. I enjoyed the massage and would come again. They had amazing tea to try before or after. Loved it!!!"
      },
      {
        date: 'Feb 15, 2015',
        active: true,
        customer_name: 'sandy M',
        rating: 5,
        title: 'wonderful!',
        body: "my sister sent me for a massage/facial as a gift.  This was the 2nd time I had gone and it was a great experience both times. Massage was soooo relaxing and the facial made my face look and feel wonderful. I would definitely go back again."
      },
      {
        date: 'Feb 11, 2015',
        active: true,
        customer_name: 'Stacey  Farr',
        rating: 5,
        title: 'Perfect get away',
        body: "As a new stressed out mom suffering from car accident injury this place is a life saver. They are great working with me and my schedule. I recommend everyone I can to them.   "
      },
      {
        date: 'Feb 3, 2015',
        active: true,
        customer_name: 'Kim Benz',
        rating: 5,
        title: '5 stars',
        body: "I am so thankful for the help and relief Jill has given me so far. Everyone there is so friendly and any and all questions you have will be answered. I'd highly recommend you to anyone. :)"
      },
      {
        date: 'Jan 30, 2015',
        active: true,
        customer_name: 'K.D.',
        rating: 5,
        title: 'Money well spent',
        body: "This was my first massage experience and I wasn't sure what to expect  but Jill was fantastic. I left feeling much better than when I arrived and will be making this a regular thing!"
      },
      {
        date: 'Jan 29, 2015',
        active: true,
        customer_name: 'Jenny Chorba',
        rating: 5,
        title: 'Massage and Facial',
        body: "Christina put me into a state of deep relaxation that I have needed for some time now.  The environment is beautiful and comfortable, I immediately felt at ease in the space.  My head, face, neck and whole body felt amazing afterward and I continue to feel great today.  Thank you so much, Christina!!  You are truly gifted."
      },
      {
        date: 'Jan 23, 2015',
        active: true,
        customer_name: 'Nikole Mays',
        rating: 5,
        title: 'Prenatal Massage',
        body: "I had a wonderful experience at A Touch of Tranquility Massage. I had a 30 minute prenatal massage with Jill. She worked on my entire back and legs. I was relaxed, and had instant relief of my entire back, and I am still feeling great two days later. Thank you Jill, I can't wait to visit again!"
      },
      {
        date: 'Jan 19, 2015',
        active: true,
        customer_name: 'R.G.',
        rating: 5,
        title: 'couples massage',
        body: "I scheduled a mommy/daughter couples massage, the ladies were very friendly with my daughter, Julie especially made her feel comfortable and welcome. The room was small but it was cozy. "
      },
      {
        date: 'Jan 8, 2015',
        active: true,
        customer_name: 'Tammy Morse',
        rating: 5,
        title: 'cinnamon &amp; citrus massage.',
        body: "Jill is a very therapeutic massage therapist.  Her time frame was to help the lower back and neck.  Every muscle and nerve which led up to these parts of the body. Intern helps headaches, anxitey, and forms of depressions.  "
      },
      {
        date: 'Jan 7, 2015',
        active: true,
        customer_name: 'R.B.',
        rating: 5,
        title: 'Shiatsu',
        body: "Kim Cudlin’s shiatsu last week was one of the best massages of any sort I’ve ever had.  This technique allows the therapist to access areas that are difficult to get to with table massage.  I was still glowing from Kim’s work the next day, and the increase in  arms’ range of motion is still evident five days later!"
      },
      {
        date: 'Dec 15, 2014',
        active: false,
        customer_name: 'Lisa Barrett',
        rating: 5,
        title: 'The Best Ever',
        body: "I absolutely love this place. I am however torn between Catrina and Christina. They both are wonderful. Christina develops a plan if you have a specific area of pain and Cat hits all the little places that some miss! I so hope I get a gift certificate for Christmas! "
      },
      {
        date: 'Dec 14, 2014',
        active: true,
        customer_name: 'JEANIE  HUGHES-JIVIDEN',
        rating: 5,
        title: 'A relaxing experience',
        body: "Thanks to Jill for a wonderful massage that left me relaxed and my neck much more mobile than when I entered! The atmosphere at Tranquility lends itself well to it's title. "
      },
      {
        date: 'Dec 11, 2014',
        active: true,
        customer_name: 'Ashley G',
        rating: 5,
        title: 'Amazing!',
        body: "Christine is an expert in her craft!  I truly feel as though I'm having therapy during my session because she takes the time to listen to my concerns and tailors the massage to address them so that I feel nothing short of amazing afterwards. If you're looking for a massage therapist that is professional, skilled, and has a holistic approach then I highly recommend for you to try touch of tranquility. Prices are affordable. You won't be disappointed!"
      },
      {
        date: 'Dec 6, 2014',
        active: true,
        customer_name: 'kiki pierotti',
        rating: 5,
        title: 'Christina Lower',
        body: "After a glorious 45 minute massage by Christina Lower, I went to bed for the first time in weeks with no chronic pain and felt better than I have in quite awhile. Christina is amazing, and I will now continue to see her on a more regular basis."
      },
      {
        date: 'Dec 1, 2014',
        active: true,
        customer_name: 'Spencer T',
        rating: 5,
        title: 'AMAZING SERVICES &amp; WONDERFUL STAFF!!!',
        body: "I've been going to A Touch of Tranquility for over 4yrs and have tried many of their services.  Everyone is very friendly, helpful and great with what they do.  Definitely worth checking out."
      },
      {
        date: 'Nov 25, 2014',
        active: true,
        customer_name: 'sean sweeney',
        rating: 5,
        title: 'massage therapy for strained neck/back',
        body: "I went in feeling very fatigued and I could not move my neck very much from left to right.  Jill Stephens worked intensively and carefully on my neck and lower back. The next day I was on the construction site back to work. It was my first time at Touch of Tranquility but certainly not the last. Thanks so much !"
      },
      {
        date: 'Nov 23, 2014',
        active: true,
        customer_name: 'T.R.',
        rating: 5,
        title: 'Great experience!',
        body: "I was very happy with my experience. Every step of the process was explained to me and I have not been to any other place that me made feel as comfortable as I did there. Will definitely come again."
      },
      {
        date: 'Oct 27, 2014',
        active: true,
        customer_name: 'C.H.',
        rating: 5,
        title: 'Excellent Experience!',
        body: "I have been to this spa twice for a Brazilian wax and will be returning regularly for sure! Christina is very friendly and knowledgeable. Everything was clean, organized, welcoming and professional. I had previously gotten a Brazilian done at Ageless. However, the waxes used at Touch of Tranquility were more gentle and removed hair more effectively. I was pleased with Christina's commitment to customer care and excellence and will not go anywhere else for a Brazilian from now on!"
      },
      {
        date: 'Oct 16, 2014',
        active: true,
        customer_name: 'Karen',
        rating: 5,
        title: 'Wonderful place!',
        body: "Every visit has been a wonderful experience for me. Massages, waxing, what ever. The staff is awesome and make you feel right at home and very comfortable. I have just bought a home several miles from here, but will drive the extra miles to return for the services offered because of how happy I am with them, and the prices are great too!"
      },
      {
        date: 'Oct 12, 2014',
        active: true,
        customer_name: 'Wendy  Johnson',
        rating: 5,
        title: 'thank you for making me feel so much better. I live in Boston and save my massages here in Corning',
        body: "Christina was amazing! She was not afraid to get the knots out of my hips during my 1st visit. She made me feel extremely comfortable and relaxed. During my 2nd vist the same day that I made due to an injury in my rotacuff she ways gentle.  Her soft smooth touch massaging an oversized know conflict NO pain, yet she released the tention in there. I can now move my shoulder more freely and I am a happy person. My hip will take time and perhaps another visit will fee up the stiffness in there :)"
      },
      {
        date: 'Oct 10, 2014',
        active: true,
        customer_name: 'JENNA M',
        rating: 5,
        title: 'So amazing best place to go',
        body: "Christina is amazing !!! Would never go anyplace else !!! It is very private she is so nice and makes you feel so comfortable !!"
      },
      {
        date: 'Oct 3, 2014',
        active: true,
        customer_name: 'Shobana S',
        rating: 5,
        title: 'Amazing and Tranquil Experience',
        body: "Christine has magic in her fingers. Had great massage followed by MAX facial. Feel my skin got a great make-over:) She is so knowledgeable and friendly. When I complained about hair fall she rightly diagnozed and discussed possible reasons  and  also included hot oil scalp treatment and suggested a regimen. Thank You Christine. You rock!! Will be back for massages ...  Love the ambience ..."
      },
      {
        date: 'Oct 2, 2014',
        active: true,
        customer_name: 'C.G.',
        rating: 5,
        title: 'highly recommend',
        body: "First time client, but I plan to return again and take advantage of the other services offered.  Relaxing atmosphere (and well kept-in terms of cleanliness) and professional staff, I can't wait to schedule my next appointment."
      },
      {
        date: 'Oct 1, 2014',
        active: true,
        customer_name: 'R.C.',
        rating: 5,
        title: 'The BEST',
        body: "Always the very best ~ Christina's scalp and oxygen facial are a surrender to bliss.  Days later a soft wisp of the fragrant oil calms the soul.  Absolutely one of the most wonderful ways to care for yourself.  "
      },
      {
        date: 'Sep 30, 2014',
        active: true,
        customer_name: 'H.S.',
        rating: 5,
        title: 'Great experience-this could become a habit!',
        body: "My entire experience was great: no waiting, courteous staff, Jill has magic hands, the environment was nice and clean, and I'll go back again.  Thank you."
      },
      {
        date: 'Sep 21, 2014',
        active: true,
        customer_name: 'Vilas Vaidya',
        rating: 5,
        title: 'Relaxing and Rejuvenating Massage',
        body: "I was looking for a good place to get a massage done, as it is a part of quarterly health regimen. The place is nice, clean and hygienic. Jill appeared to be expert , and did a good job. Soothing music was an added advantage. Will look forward to visit again. "
      },
      {
        date: 'Sep 8, 2014',
        active: true,
        customer_name: 'N.T.',
        rating: 5,
        title: "Christina's massages",
        body: "On a scale of 1-5, Christina's massages consistently rate between 5 and 10. She has worked her way down through layers of knots that have been there for years and I have recovered the range of motion in my shoulders. Yes, I will keep coming back.  :)"
      },
      {
        date: 'Sep 8, 2014',
        active: true,
        customer_name: 'Lisa B',
        rating: 5,
        title: 'AHHHHHHHH',
        body: "Wonderful, very professional and treats your whole self not just body. Thanks Christine. If I was rich I would do it every day and am considering a long term stint to help with migraines."
      },
      {
        date: 'Sep 8, 2014',
        active: true,
        customer_name: 'Cady J',
        rating: 5,
        title: 'Excellent!',
        body: "I love getting my massages here. The girls are professional yet make you feel very comfortable.  Pricing is very reasonable and definitely worth it! "
      },
      {
        date: 'Aug 20, 2014',
        active: false,
        customer_name: 'rlamoreaux',
        rating: 5,
        title: 'Relief',
        body: "Candice did an excellent job working the knots out of my back and legs. The day after now I'm feeling much better!"
      },
      {
        date: 'Aug 14, 2014',
        active: false,
        customer_name: 'Amanda H',
        rating: 5,
        title: 'Highly Recommended',
        body: "Excellent massage therapy! The place is beautiful and relaxing and they make you feel so comfortable. Candice does an excellent job with helping to remove the knots in my back. Thank you, Touch of Tranquility!"
      },
      {
        date: 'Aug 12, 2014',
        active: true,
        customer_name: 'D.M.',
        rating: 5,
        title: 'Special Appointments',
        body: "A Touch of Tranquility has in my experience gone far and above the norm to create a schedule to meet your needs."
      },
      {
        date: 'Aug 11, 2014',
        active: true,
        customer_name: 'DIANE W',
        rating: 5,
        title: 'Awesome massage',
        body: "Jill gives awesome massages; she has such a calming personality that she makes me feel totally relaxed; I have been getting regular massages for the past 6 months and if you are looking for an amazing massage, ask for Jill."
      },
      {
        date: 'Aug 7, 2014',
        active: true,
        customer_name: 'Shauna W',
        rating: 5,
        title: 'Excellent service and experience',
        body: "Christina was friendly and she knows what she's doing! A Brazilian is never a fun time, but she is quick, professional and as painless as possible! Will return! "
      },
      {
        date: 'Aug 3, 2014',
        active: true,
        customer_name: 'Kiki Pierotti',
        rating: 5,
        title: 'Delightful!',
        body: "I fully enjoy the serenity and relaxation at Touch of Tranquility. Christina is wonderful, she alleviates all of my tension and pain with her masterful touch. I look forward to our visits and highly recommend her amazing skills and lovely personality..."
      },
      {
        date: 'July 10, 2014',
        active: true,
        customer_name: 'A.K.',
        rating: 5,
        title: 'Wonderful Discovery!',
        body: "I have been to a few places in the area for body treatments, and by far this is the best! Comforting and quick! Christina is just fabulous! "
      },
      {
        date: 'July 4, 2014',
        active: true,
        customer_name: 'C.C.',
        rating: 5,
        title: 'Christina is great!',
        body: "  I always come to her to get my eyebrows waxed and she alwAys does such a nice job!  Will be going back soon."
      },
      {
        date: 'July 2, 2014',
        active: false,
        customer_name: 'Laura  Johnson',
        rating: 5,
        title: 'Candice is AMAZING',
        body: "I really enjoyed my 60 minute massage with Candice! She explained everything that she would do before the massage. She got all the knots out of my shoulders and neck and made sure that I was comfortable. I felt amazing after I left and I definitely will be going back to her soon! :) "
      },
      {
        date: 'June 17, 2014',
        active: true,
        customer_name: 'C.H.',
        rating: 5,
        title: 'Christina is Truely Amazing',
        body: "As usual an absolutely wonderful massage with  Christina.  She's the best!  Once I started to going to Christina I stopped going to chiropractor. Your the best! Thank you!"
      },
      {
        date: 'June 1, 2014',
        active: false,
        customer_name: 'S.B.',
        rating: 5,
        title: 'Candace was great',
        body: "I had my second massage with Candace last week as I was dealing with a misaligned SI joint in my lower back.  It didn't respond to a chiropractic adjustment before the massage, but Candace realy loosened it up (and did her normal magic on my shoulders and neck), and now I'm good as new.  Thanks!"
      },
      {
        date: 'June 1, 2014',
        active: true,
        customer_name: 'Barb M',
        rating: 5,
        title: 'My First Massage',
        body: "My first massage was a birthday treat. Christine was friendly and patient as she told me what to expect from the warm stone massage. Very relaxing and enjoyable experience. Definitely want to do this again! "
      },
      {
        date: 'May 24, 2014',
        active: true,
        customer_name: 'Renee Herrick',
        rating: 5,
        title: 'Healing massage',
        body: "Christina always remember exactly what needs to be done. She  has even put me to sleep a time or two. She the best at giving a great healing massage. So go see her:)"
      },
      {
        date: 'May 22, 2014',
        active: true,
        customer_name: 'A.T.',
        rating: 5,
        title: 'Awesome massage!',
        body: "After finals week of college I was so sttessed out and just needed some relaxation.  I came to touch of tranquility and recieved the best relaxing massage. This was my first massage, but this was my sisters second (we went together to celebrate finishing school) she said this massage put her last one to shame. It was such a relaxing environment and the girls certainly made it easy to relax! I loved this place/environment and will definitely be back again soon!!"
      },
      {
        date: 'May 2, 2014',
        active: true,
        customer_name: 'Amy W',
        rating: 5,
        title: 'Outstanding!!',
        body: "I was so nervous before my treatment but Christina made me feel instantly at ease.  I loved the results and will definitely be back again.  She is very professional and knowledgable and I will definitely recommend her to my family and friends!"
      },
      {
        date: 'Apr 8, 2014',
        active: true,
        customer_name: 'LESLIE D',
        rating: 5,
        title: 'Excellent',
        body: "I had a massage by Kim and it was excellent, room was warm and relaxing. I have no complaints, only suggestion would be putting a warm pack over eyes but I didn't ask. Will be going again."
      },
      {
        date: 'Apr 3, 2014',
        active: true,
        customer_name: 'Christina E',
        rating: 5,
        title: 'Amazing Massage!',
        body: "This was my first time here and I absolutely loved it! Staff was very helpful. I left feeling relaxed and my back pain gone! "
      },
      {
        date: 'Mar 27, 2014',
        active: true,
        customer_name: 'B.C.',
        rating: 5,
        title: 'Great experience',
        body: "First time having a massage and got a great deal out of it. Very relaxing and made my aches and pains go away. "
      },
      {
        date: 'Mar 14, 2014',
        active: true,
        customer_name: 'Carol Ann',
        rating: 5,
        title: 'By Far the Best Massage I Have Ever Had!',
        body: "The ' Elixir of Life ' is a MUST! Treated myself to this last night and I feel like a new person.  Scheduled my next one before I left."
      },
      {
        date: 'Mar 14, 2014',
        active: true,
        customer_name: 'Kristen Stewart',
        rating: 5,
        title: 'Massage - Head and Neck',
        body: "The 45 minute treatment was wonderful! I will be back for a longer full body massage. Also, I really like the online scheduling/appointments."
      },
      {
        date: 'Mar 13, 2014',
        active: true,
        customer_name: 'Dawne Mulhollen',
        rating: 5,
        title: 'Great!',
        body: "The 45 minute massage was wonderful. I never had one before and I already scheduled my next appointment!"
      },
      {
        date: 'Mar 10, 2014',
        active: true,
        customer_name: 'Tiffany T',
        rating: 5,
        title: 'So relaxing!',
        body: "Very relaxing, professional, and good with explaining things as I'm a talker and ask lots of questions."
      },
      {
        date: 'Mar 9, 2014',
        active: true,
        customer_name: 'N.T.',
        rating: 4,
        title: 'Great Day!',
        body: "We had the Asi wrap and Vita C facials. Both were great! Left feeling relaxed and refreshed! Just proves you don't have to travel far to receive a good day of pampering!"
      },
      {
        date: 'Mar 9, 2014',
        active: true,
        customer_name: 'Shobana S',
        rating: 5,
        title: 'Professional and Courteous',
        body: "Christina is fantastic.She is highly skilled and knowledgeable. She gave me a great facial and an amazing massage. Calming environment and sweet smelling oils and lotions put me in comfort wanting more of these sessions.Thank You Christina."
      },
      {
        date: 'Mar 6, 2014',
        active: true,
        customer_name: 'R.D.',
        rating: 5,
        title: 'professional service',
        body: "Cristina is very calming and easily puts you at ease.  She is skilled and does a great job waxing.  I have been going to her for some time and although the task is embarrassing, her demeanor helps me get through it."
      },
      {
        date: 'Mar 2, 2014',
        active: true,
        customer_name: 'LORI B',
        rating: 5,
        title: 'Repeat Recipient :)',
        body: "Every time I go, Christina specifically asks what she can do for me, so I appreciate the customized experience. I also recently experienced a couples' massage with my significant other.  As the recipient of many massages from therapists with various training and techniques, he stated that Jill utilized techniques that he had not experienced before, and found them highly effective for his chronic issue. Great vibes here!"
      },
      {
        date: 'Feb 23, 2014',
        active: true,
        customer_name: 'J.L. ',
        rating: 3,
        title: 'very relaxing but was lacking',
        body: "My experience here with a full body massage was just ok. It was definitely relaxing and soothing but I kept waiting to be massaged when really all I felt I got was a rub down. My muscles weren't worked on at all the way I've had in other massages. I would go back but would definitely try another one of the massage therapists there or specifically ask for a deeper massage. The environment here was very relaxing and the music was very soothing. "
      },
      {
        date: 'Feb 21, 2014',
        active: false,
        customer_name: 'A.A.',
        rating: 5,
        title: 'I highly recommend Candice',
        body: "Best ever birthday gift to myself. Candice was amazing , very professional. Ready to go back that's for sure."
      },
      {
        date: 'Feb 16, 2014',
        active: true,
        customer_name: 'Brian Larsen',
        rating: 5,
        title: 'Couples massage',
        body: "On the 15th of February my wife and I shared a couples massage at Touch of Tranquility in Corning and received an unbelievable massage from two very talented and professional therapists... I highly recommend their massages and will be definately be a repeat customer. Thank you Kim and Jill for the wonderful experience and thank you Christina for having such talented massage therapists."
      },
      {
        date: 'Feb 15, 2014',
        active: true,
        customer_name: 'C.G.',
        rating: 5,
        title: 'Something that you can really use in life',
        body: "&lt;3 They all have helped tremendously since I have started to go there after my accident, now I will be going back every chance that I get. You don’t have to wait till your hurt, enjoy life and relax for a little bit of time ;-) Do yourself a big favor and go spend an hour with them to see what I mean. It is a whole new world &lt;3"
      },
      {
        date: 'Feb 7, 2014',
        active: false,
        customer_name: 'J.L.',
        rating: 5,
        title: '2 hours of heaven!',
        body: "Candice was so wonderful I came home and booked my next session. I was amazed at how strong she was."
      },
      {
        date: 'Jan 31, 2014',
        active: true,
        customer_name: 'L.L.',
        rating: 5,
        title: 'Got the kinks out',
        body: "Slow, powerful massage from Kim. Pleasant atmosphere and cup of tea while waiting for a friend. Thank you."
      },
      {
        date: 'Jan 28, 2014',
        active: true,
        customer_name: 'V.M.',
        rating: 5,
        title: 'Great massage with Kim',
        body: "Kim is very strong, skillful and relaxing. Felt great! If I lived in the area I would definitely return. Appreciated the accommodating Sunday hours."
      },
      {
        date: 'Jan 19, 2014',
        active: true,
        customer_name: 'Ali B',
        rating: 5,
        title: 'Waxing',
        body: "Simply amazing! So professional and helpful to make it as painless as possible. The ladies there are so easy to talk to. Will always go back."
      },
      {
        date: 'Jan 18, 2014',
        active: true,
        customer_name: 'R.G.',
        rating: 5,
        title: 'customer',
        body: "Quaint little business. Relaxing atmosphere, great service, reasonable prices. Will return for another massage! "
      },
      {
        date: 'Jan 4, 2014',
        active: false,
        customer_name: 'Gen Longwell',
        rating: 5,
        title: 'With Gratitude!!',
        body: "Candice worked on my severe neck/back problem. I was impressed with her work on the base of my skull and neck.  Looking forward to our next appointment. "
      },
      {
        date: 'Dec 24, 2013',
        active: true,
        customer_name: 'Matthew Parsons',
        rating: 5,
        title: 'Great work!',
        body: "This was one of the best massages I've ever received. The price was very reasonable too. I will be recommending A Touch of Tranquility to all of my friends."
      },
      {
        date: 'Dec 21, 2013',
        active: false,
        customer_name: 'Matthew G',
        rating: 5,
        title: 'Massage',
        body: "I was a hurting mess when I came in.  Bailey is excellent..... i can't wait for my next one!!!  Thank you so much!"
      },
      {
        date: 'Dec 14, 2013',
        active: true,
        customer_name: 'Kay Marvin',
        rating: 5,
        title: 'much needed massage',
        body: "Found my full body massage very relaxing. Had a problem with my hip when I first when in. Had the therapist concentrate on it and have not had A PROBLEM SINCE! Thank You SARAH!!!!"
      },
      {
        date: 'Dec 5, 2013',
        active: true,
        customer_name: 'R.C.',
        rating: 5,
        title: 'THE BEST!',
        body: "If nothing else was said that is really all you need to know about a session with Christina.  The oxygen facial was an extraordinary experience ~ add a scalp treatment and you really don't want to leave."
      },
      {
        date: 'Dec 3, 2013',
        active: false,
        customer_name: 'April Roush-Stanley',
        rating: 5,
        title: 'Giving Thanks',
        body: "Thank you Candice Cowan for a wonderful Massage and for your attention to detail and the care you provided with such compassion and skill!"
      },
      {
        date: 'Dec 2, 2013',
        active: true,
        customer_name: 'Bernadette',
        rating: 4,
        title: 'Personalized Pampering',
        body: "I felt pamered from the moment I arrived with a cup of hot tea on a cold blustery day.  Christina really took time to ask me questions to personalize my experience as well as my massage oil to meet my specific needs.  She offered skin care suggestions without being pushy.  I thoroughly enjoyed the experience and plan to return in the near future.  "
      },
      {
        date: 'Dec 2, 2013',
        active: false,
        customer_name: 'Kaitlyn',
        rating: 5,
        title: 'Amazing',
        body: "Mom got me a message because I was so stressed with college. It was amazing! I felt so good when Candice was finished. Can't wait for another session on my next college break!"
      },
      {
        date: 'Nov 25, 2013',
        active: false,
        customer_name: 'C.P.',
        rating: 5,
        title: 'Terrific!',
        body: "It amazes me how stress has affected my back, neck and shoulders. Baily has made me very relaxed and I feel wonderful afterwards..  I wish I had time to have Baily work on me weekly."
      },
      {
        date: 'Sep 26, 2013',
        active: true,
        customer_name: 'Patti Traylor',
        rating: 5,
        title: 'Excellent',
        body: "With my sister-in-law's wedding just days away, there wasn't much time in her schedule for a massage and facial - but Touch of Tranquility was able to accommodate her, another bridesmaid, and myself. I had one of the most relaxing and cleansing facials ever. Fantastic service!  We'll be back!"
      },
      {
        date: 'Sep 16, 2013',
        active: true,
        customer_name: 'N.T.',
        rating: 5,
        title: 'The best place in town',
        body: "I recommend Christina and A Touch of Tranquility to everyone unreservedly. I have been coming here for nearly a year now and will continue to do so."
      },
      {
        date: 'Sep 13, 2013',
        active: false,
        customer_name: 'Kim M',
        rating: 5,
        title: 'Lifesaver!',
        body: "When I first came to A Touch of Tranquility, I was having severe shoulder and neck pain. Candice knew just the right amount of pressure to apply to work the tightness out of my muscles and start me on the way to feeling better. She is highly skilled, very professional  and extremely caring. Since then, I have been seeing her every week or two and couldn't be more pleased with how much better I feel."
      },
      {
        date: 'Aug 14, 2013',
        active: true,
        customer_name: 'MBK',
        rating: 5,
        title: 'Christina is amazing!',
        body: "So glad I followed my friend's advice and made an appointment with Christina. Not only has she given perhaps the best massages I've ever had, but she is simply delightful.  Affordable and excellent. I, too, am hooked!"
      },
      {
        date: 'Aug 5, 2013',
        active: true,
        customer_name: 'Lisa Barrett',
        rating: 5,
        title: 'OH MY! IT WAS WONDERFUL',
        body: "This was my 1st massage ever, I was so nervous. Christina put me at ease and made it an absolutely wonderful and relaxing experience. I made the mistake of not listening to her however when she told me to drink lots of water which I think caused me to have a little headache about an hour after massage. She respected that I am sensitive to smells and picked a mellow and relaxing scent for me. I AM HOOKED!"
      },
      {
        date: 'Aug 1, 2013',
        active: true,
        customer_name: 'L.B.',
        rating: 5,
        title: 'Magic Fingers',
        body: "Christina has an amazing ability to zero in on my (multiple) problem areas.  Together with chiropractic treatment, these chronic issues seem to be resolving."
      },
      {
        date: 'Aug 1, 2013',
        active: true,
        customer_name: 'R.C.',
        rating: 5,
        title: 'Take advantage ~',
        body: "Christina offers services and technique like no one else in the area. Her way of pampering and making everything about your needs and desires are beyond delightful. From facials to massage she makes you wish it could be a daily routine."
      },
      {
        date: 'June 25, 2013',
        active: true,
        customer_name: 'Amanda Secondo',
        rating: 5,
        title: 'love It!',
        body: "This place is great! I had an appointment with Chrissy and she was amazing! I would definitely recommend this place to anyone!"
      },
      {
        date: 'Apr 26, 2013',
        active: false,
        customer_name: 'Brenda Kline',
        rating: 4,
        title: 'A much needed massage!',
        body: "This was my third massage with Candy and it was very relaxing and at the same time worked on places giving the most problems. Every so often she would make sure you were doing ok and was very pleasant through the whole session. I have a lot of trouble with my lower back and she starts by putting a warm corn bag on that which is very soothing. I definitly willbe going back:)"
      },
      {
        date: 'Apr 25, 2013',
        active: true,
        customer_name: 'Ally Payne',
        rating: 5,
        title: 'Best Massage EVER!',
        body: "Whenever I have a good experience at a business, I love sharing it! Before my massage, I told Christina that I don't mind pressure and she delivered. I couldn't believe how much I could feel the tension being relieved just by what seems like a simple move (but hey, i'm no professional). Anyway, I made an appointment for next month because I loved it so much and have told at least 5 friends about you guys. Thanks much! "
      },
      {
        date: 'Apr 12, 2013',
        active: true,
        customer_name: 'Wendy  Johnson',
        rating: 5,
        title: 'massage',
        body: "I went in for a 1 hour massage because I was stiff in my back and neck. My back feels great and so relaxed. My neck feels so much better but still has some tightness in it. She could only fit so much in in an hour. I can turn my head left to right now. I will always be a returning customer because of the way I feel when I'm being massages and also when I leave. "
      },
      {
        date: 'Apr 12, 2013',
        active: true,
        customer_name: 'R.C.',
        rating: 5,
        title: 'The best ever',
        body: "Time spent in Christina's care is pure bliss.  Her abilities exceed any other provider I have ever been to and I would highly recommend you treat yourself to her services.  I feel radiant after a facial and there is nothing to compare to the scalp treatments lingering effect of near euphoria.  Go for it ~ you will be so glad you did!"
      },
      {
        date: 'Mar 22, 2013',
        active: true,
        customer_name: 'Gerald F',
        rating: 5,
        title: 'Excellent care',
        body: "With each and every session my lower back pain becomes more of a stranger.  This is the first time in more than 25 years that I have been able to go to the gym and truly enjoy exercising,"
      },
      {
        date: 'Jan 14, 2013',
        active: true,
        customer_name: 'J.H.',
        rating: 4,
        title: 'You owe it to yourself...',
        body: "This is a great place for everything from massage, skin care, acupuncture, mud wraps and facials, and a host of other things. Owner Christina Lower and staff are fantastic people who care about relieving pains and stresses from our everyday lives. Definitely give this place a look-see and book yourself an appointment. You owe it to yourself."
      },
      {
        date: 'Jan 10, 2013',
        active: false,
        customer_name: 'Brenda Kline',
        rating: 5,
        title: 'A very relaxing beneficial massage!',
        body: "This is my second session with Candace and I found it not only relaxing but helped my problem in my lower back as well. She covers all the problem areas and and asks if you are feeling okay throughout the session. She is very plesant and does a great job. I have referred her to some my of friends looking for a good place to go for their backs as well. Thanks, Candy! "
      },
      {
        date: 'Dec 5, 2012',
        active: true,
        customer_name: 'r.l.',
        rating: 5,
        title: 'my massage therapist',
        body: "Christina is highly trained and skilled. I've never been disappointed with her work. She is also very out going and commited to helping those that have been lucky enough to find her! "
      },
      {
        date: 'Nov 29, 2012',
        active: true,
        customer_name: 'N.S.',
        rating: 5,
        title: 'great massages and great service',
        body: "I found Christina and Touch of Tranquility through her great online ratings from other clients. She is highly skilled, compassionate, and professional, able to deal with a wide variety of issues. I have never been disappointed, and you won't be either."
      },
      {
        date: 'Nov 11, 2012',
        active: true,
        customer_name: 'Brenda VanPelt',
        rating: 5,
        title: 'best massage in town',
        body: "I have never felt better in all my life If you have aches and pains or your body is tired go see christina at a touch of tranquility you wont be sorry."
      },
      {
        date: 'Oct 27, 2012',
        active: true,
        customer_name: 'K.M.',
        rating: 5,
        title: 'Brazilian Wax',
        body: "I had my first ever Brazilian Waxing... ' OMG! I will never shave there again! '  I was a little nervous, but Christina is extremely professional and made feel very comfortable.  I also bought Christina's own blend of Shower Massage Butter and it is absolutely amazing! No other product I've tried has made my skin feel so soft and smooth.  I couldn't be happier or more satisfied with my experience. "
      },
      {
        date: 'Oct 26, 2012',
        active: true,
        customer_name: 'Linda',
        rating: 5,
        title: 'Always Consistently Great!',
        body: "I have seen a number of massage therapist over the past 20 yrs in numerous cities. When Christina first performed a massage for me in this area I knew she was the therapist I wanted to stay with. She consistently is able to get to the muscles that need help. She has helped me so much that I see her weekly and she is part of my treatment plan to stay as healthy as possible given the degenerative issues I am experiencing. Keep up good work Christina!"
      },
      {
        date: 'Oct 20, 2012',
        active: true,
        customer_name: 'Carri S',
        rating: 5,
        title: 'Wonderful!!',
        body: "I have been in quite a bit of pain for some time now and finally decided to do something about it.  Christina addressed every issue I had and I left feeling better and more mobile.  It's been a long time since I've had such an effective and (at the same time) relaxing massage...I will be seeing her again to continue to improve my issues and function more completely (and with less pain) in my life!  Thank you Christina! "
      },
      {
        date: 'Oct 9, 2012',
        active: true,
        customer_name: 'M.',
        rating: 5,
        title: 'Fantastic!',
        body: "Every time I come here, with whatever I might have 'going on that day'; like stress, or my chronic lower back pain or when my neck got kinked; I am amazed at how well I am taken care of and my issues are addressed, each and every time, I feel so much better. That's why I have been coming here for years! Thank you!!"
      },
      {
        date: 'Oct 1, 2012',
        active: true,
        customer_name: 'C.C.',
        rating: 5,
        title: 'listen to your body',
        body: "Went in for a massage and thought all that was bothering me was some shoulder and neck pain but the therapist discovered alot of issues all over.  I felt great after.   Thank you."
      },
      {
        date: 'Sep 9, 2012',
        active: true,
        customer_name: 'Gerald F',
        rating: 5,
        title: 'Great results',
        body: "The message therapy has relieved my lower back pain - pain that has been a problem for 26 years.  Thanks."
      },
      {
        date: 'July 12, 2012',
        active: true,
        customer_name: 'thomasine gilbert',
        rating: 5,
        title: 'great service!!!',
        body: "It was relaxing, welcoming and they told me what to expect. The office was warm and welcoming and very clean. I do plan on returning as soon as I can. "
      },
      {
        date: 'July 7, 2012',
        active: true,
        customer_name: 'Audrey Fuller',
        rating: 5,
        title: 'very nice!',
        body: "I enjoyed my experience at Touch of Tranquility.....I felt like my issues were addressed and helped.  Thanks!"
      },
      {
        date: 'June 8, 2012',
        active: true,
        customer_name: 'Heather Slocum',
        rating: 5,
        title: 'So relaxing!',
        body: "I had a great time at Touch of Tranquility yesterday. The atmoaphere is very calming the minute you walk in the door.  Candice did a great job working out my tension and helped out a lot with my sciatica. I feel much more relaxed and limber. I will definitely be back!"
      },
      {
        date: 'June 7, 2012',
        active: true,
        customer_name: 'Gerald F',
        rating: 5,
        title: 'Lower back pain',
        body: "26 years ago I had bone grafts both sides of spine in lumbar area and fusion.  Finally, I have found someone who can help relieve pain and stop the muscle spasms."
      },
      {
        date: 'May 19, 2012',
        active: true,
        customer_name: 'Ron Schlegel',
        rating: 5,
        title: 'Massage with Kim',
        body: "This was a wonderful deep massage.  Kim made the whole experience so special.  She is a very skilled massage therapist.  I would highly recommend her to anyone."
      },
      {
        date: 'May 13, 2012',
        active: true,
        customer_name: 'Jr',
        rating: 5,
        title: 'Best massage ever had in  my life',
        body: "Went in for a massage and fell into a state of total relaxation, I felt I was dreaming the best dream I ever had......Thank You Kim, I will be back again for the dream to continue"
      },
      {
        date: 'May 5, 2012',
        active: true,
        customer_name: 'Christine H',
        rating: 5,
        title: 'Excellent Experience!!!',
        body: "I go to Christina Lower for Brazilian waxing. She always makes me feel very comfortable and does an excellent job that makes me feel great about myself. When I first moved to the area I was going to another salon, but after going to Christina I will never go anywhere else. I highly recommend her and her services."
      },
      {
        date: 'Apr 30, 2012',
        active: true,
        customer_name: 'Karen Sebastian',
        rating: 5,
        title: 'Awesome Massage',
        body: "Loved Kim.  Asked for a deep tissue massage and asked her not to hold back.  She was so awesome.  Got rid of a lot of the spasms in my back.  My friend had Candice, and loved his massage too.  They were both very friendly and personable.  Will definitely go back!!  Great Massagea!!!!!"
      },
      {
        date: 'Apr 27, 2012',
        active: true,
        customer_name: 'Karen Gallaher',
        rating: 5,
        title: 'Very relaxing',
        body: "I had a 60-minute massage and 30-minute scalp treatment with Candice- it was very relaxing and I will definitely return!!!"
      },
      {
        date: 'Apr 24, 2012',
        active: true,
        customer_name: 'Catherine Zaffarano',
        rating: 5,
        title: 'Reiki',
        body: "Reiki Session - with Kathy Holton was a perfect experience.  The venue was comfortable / peaceful and Kathy was an amazing Reiki Practitioner.  Highly Recommend~"
      },
      {
        date: 'Apr 24, 2012',
        active: true,
        customer_name: 'Christina M. Lower LMT',
        rating: 5,
        title: 'Amazing',
        body: "I was involved in a car accident and was told i needed back surgery. I decided that i wss going to try other avenues before i considered surger. I have been meeting with Christina and what a difference her massage has been for my back. I highly reccomend her I've tried other places but this is by far the best and i can see changes...no surgery!"
      },
      {
        date: 'Apr 15, 2012',
        active: true,
        customer_name: 'J.B.',
        rating: 5,
        title: 'Awesome as always!',
        body: "It does not matter who I see you guys are all awesome. And I always feel better after my massage!!! THANK YOU!!!!!"
      },
      {
        date: 'Apr 10, 2012',
        active: true,
        customer_name: 'H.M.',
        rating: 5,
        title: 'thank-you',
        body: "I have had several very good massages in the past but Kim’s was one of the very best.  She was able to read the stress that was manifesting itself in me and eliminate it.  I woke the next morning feeling the best I have in months.  This appt was a last minute request and then I asked for 30 minutes more when I arrived.  Kim happily stayed even later to give me the time I needed.  I look forward to the next! All I can say is a heartfelt thank-you."
      },
      {
        date: 'Mar 10, 2012',
        active: true,
        customer_name: 'Wendy  Johnson',
        rating: 5,
        title: 'very relaxing',
        body: "I became very relaxed as she massaged me. I felt my tight muscles in my back become tense free. My neck had a lot of muscle pain and strain. I still have stiffness, but I feel better. I am looking forward to my next massage in a week.        "
      },
      {
        date: 'Mar 10, 2012',
        active: true,
        customer_name: 'Chris Allen',
        rating: 5,
        title: 'The full body massage',
        body: "This is my first full body massage and I feel so much better. After a bad fall I wend to a chriropractor and then the full body massage and I am back to normal. "
      },
      {
        date: 'Mar 4, 2012',
        active: true,
        customer_name: 'D.B.',
        rating: 5,
        title: 'Wonderful experience',
        body: "My first massage and Kim was excellent at putting me at ease and the massage was one of life's most relaxing experiences.  I will so do it again! Thank you."
      },
      {
        date: 'Jan 20, 2012',
        active: true,
        customer_name: 'Studa',
        rating: 4,
        title: 'Excellent...',
        body: "A very relaxing and comfortable atmosphere, felt really good when I left and still days later. I would highly recommend Christina for anyone that needs to relieve stress or just wants to pamper themselves..."
      },
      {
        date: 'Nov 28, 2011',
        active: true,
        customer_name: 'C.H.',
        rating: 5,
        title: 'Amazing',
        body: "As usual Christina is incredible.  She really listens to what you tell her and appears to be in tune to what's going on with your body.  Gives the best massages ever!  She really knows her stuff.  I highly recommend her for a relaxing theraputic massage!"
      },
      {
        date: 'Nov 20, 2011',
        active: true,
        customer_name: 'Sabine S',
        rating: 5,
        title: 'Soothing',
        body: "As always a massage with Christina is so relaxing, really enjoy the care she takes to make me feel comfortable. Love the subdued lights and candles, the music......Would recommend this to anyone."
      },
      {
        date: 'Nov 9, 2011',
        active: true,
        customer_name: 'Krista A',
        rating: 5,
        title: 'the Sadana is THE BEST!!',
        body: "I have had massages and facials and body wraps (all elsewhere) but treated myself to the Sadana. This is by far the best thing I have experienced in body treatments! Christine is wonderful!! I would definitely recommend this to anyone who needs a little extra R&amp;R - or just wants to spoil themselves. I will certainly do this again! It's also nicer than the other places in Corning.",
      }
    ]


    Review.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('reviews')
    reviews.each do |review|
      rv = Review.new(review.reverse_merge(show_customer_name: false))
      rv.save(validate: false)
    end

  end
end
