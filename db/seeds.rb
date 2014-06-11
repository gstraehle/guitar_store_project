puts('Clearing users')
User.delete_all
puts('Clearing orders and carts')
Order.delete_all
puts('Clearing products')
Product.delete_all
puts('Clearing order products')
OrderProduct.delete_all

puts('Creating products')
product1 = Product.create(quantity: 5, avg_rating: 4, brand: 'Martin',alt_image_1: 'http://www.casamarilla.cl/productos/HD35.jpg' , alt_image_2: 'http://www.martinguitar.com/media/k2/attachments/HD-35_f.jpg' , alt_image_3: 'http://www.christies.com/lotfinderimages/D53567/cf_martin_and_company_a_guitar_style_hd-35sjc_nazareth_pa_2002_d5356726h.jpg' , category: 'Acoustic' , description: 'The HD-35 acoustic guitar combines Martin\'s visually striking 3-piece back design with many of the prewar features of the legendary herringbone D-28. Tonally, the guitar\'s rosewood back produces a strong bass, making it ideal for rhythm playing. The top is constructed of solid Sitka spruce and braced with scalloped 1/4" high-performance braces to deliver big, open tones. Includes case.' , image: 'Martin-HD35.png' , model: 'HD-35' , msrp: 2999 , orientation: 'Right-Handed' , price: 2999 , series: 'Standard Series' , year: 2014 , bridge_type: 'Belly' , number_of_frets: 20 , neck_type: 'Dovetail Joint' , body_wood: 'East Indian RosewoodSelect Hardwood' , case_type: 'Hardshell Case' , tuning_machines: 'Sealed Gears, D-14 Fret Body Size with Solid Top, Back, and Sides, Polished Gloss Body Finish, Solid/Square Taper Headstock and Solid East Indian Rosewood Headplate with Raised Gold Foil Decal')
product2 = Product.create(quantity: 1, avg_rating: 3.5, brand: 'Gibson', alt_image_1: 'http://static.musiciansfriend.com/derivates/6/999/259/838/DV019_Jpg_Regular_1343658299806_D.jpg' , alt_image_2: 'http://blog.andertons.co.uk/wp-content/uploads/2013/08/Trad-Pro-II.jpg' , alt_image_3: 'http://static.musiciansfriend.com/derivates/6/999/259/832/DV019_Jpg_Regular_1343658299746_C.jpg' , category: 'Electric' , description: 'Taking design and visual cues from the Les Pauls of the \'80s and \'90s, the Les Paul Traditional Pro II features powerful pickups with push/push for coil splits and boost circuit, \'60s neck profile, Grover locking tuners, antique binding, period-correct pickguard, vintage Gibson top hat knobs, and the revolutionary Plek set up. With all the fat, sweet, snarling Les Paul tone that purists love, the new Gibson Les Paul Standard Traditional Pro II sports a mahogany body with a thick maple cap for the perfect blend of warmth and clarity. The top is finished in high-gloss lacquer, while the back, sides, and neck have a smooth satin finish that feels great and lets the wood resonate fully. Each Les Paul Traditional also comes with Gibson USA\'s standard black snakeskin case. Includes case.2014' , image: 'LPTD-LHSCH1-Finish-Shot.jpg' , model: 'Les Paul Traditional' , msrp: 4000 , orientation: 'Right-Handed' , price: 2615 , series: 'Les Paul' , year: 2014 , bridge_type: 'Tune-O-Matic' , number_of_frets: 22 , neck_type: 'Mortise & Tenon' , body_wood: 'MahoganyMahogany' , case_type: 'Hardshell Case' , tuning_machines: 'Vintage Style')
product3 = Product.create(quantity: 3, avg_rating: 3.5, brand: 'Cordoba', alt_image_1: 'http://media.guitarcenter.com/is/image/MMGS7/Cordoba-35T-CE-Tenor-Acoustic-Electric-Ukulele-Standard/J08457000000000-00-250x250.jpg' , alt_image_2: 'http://www.cordobaguitars.com/uploads/guitars/25tkce_side.jpg' , alt_image_3: 'http://www.cordobaguitars.com/productimages/resized/d45ca7296438ce0d7d51daf3949f2fea-1360006055-large.jpg' , category: 'Ukulele' , description: 'The 35T-CE belongs to Cordoba’s new 30 series, a premium line of boutique, all-solid tenor ukuleles approached from a classical or Spanish guitar building perspective. Most notably, Cordoba is using an integrated neck joint or “Spanish Heel” instead of a traditional dovetail joint to join the body and neck of the ukulele. This method of construction offers a lighter weight and more stable heel joint that increases resonance and is less prone to movement as the ukulele ages. Cordoba collaborated with renowned luthier Pepe Romero Jr. on the 30 series, adopting Romero’s vision of building ukuleles as if they are small guitars using traditional Spanish building methods. The result is an incredibly lightweight tenor ukulele with a deeper and wider body, featuring a Spanish heel neck joint, fan bracing, and a wider fingerboard for easy playability.' , image: 'C35TCEXXX-P.jpg' , model: '35T-CE' , msrp: 850 , orientation: 'Right-Handed' , price: 749 , series: '30 Series' , year: 2013, bridge_type: 'Rosewood' , number_of_frets: 18 , neck_type: 'Spanish Heel' , body_wood: 'AcaciaMahogany' , case_type: 'Polyfoam Case' , tuning_machines: 'Open Gears, Premium Solid Tonewoods, Hand-Rubbed Thin Polyurethane Finish, Chrome Grover Tuning Machines')
product4 = Product.create(quantity: 5, avg_rating: 4.5, brand: 'H. Jimenez', alt_image_1: 'http://img1.prosperent.com/images/250x250/images.samash.com/sa/HLB/HLBQ2XXXX-P.fpx%3Fcell%3D500%252C500%26cvt%3Djpg' , alt_image_2: 'http://www.grothmusic.com/images/product/medium/ae00-18883_3_.png' , alt_image_3: 'http://images.samash.com/sa/HLB/HLBQ3EXXX-P.fpx?cell=540,400&qlt=90&cvt=jpg' , category: 'Acoustic-Electric' , description: 'This H. Jimenez El Musico Bajo Quinto is crafted from a well-seasoned and tight grained resonate spruce top with one H. Jimenez style pearloid mica, and is paired with tonally rich mahogany for the back and sides, offering a robust voice that is sure to cut through and be heard. A rosewood and maple edge trimming accompanied by an arrow rosette gives the El Musico exceptional visual appeal. A florentine cutaway caters to the comfort and elegance of the El Musico. The ultra-playable neck is capped with an 18-fret rosewood fingerboard that boasts the H. Jimenez signature laser logo. For optimum performance, the H. Jimenez El Musico comes standard with a specially designed Thunderwing rosewood adjustable saddle bridge. The El Musico Acoustic-Electric Bajo Quinto comes performance ready with a factory installed, natural sounding Seymour Duncan SA-1 soundhole pickup. The sleek passive no-hum design offers the convenience of an onboard volume control and is wired directly to a strap button/end pin style jack. Comes protected by a padded gig bag with zipper pouch and shoulder straps.' , image: 'HLBQ2EXXX-P.jpg' , model: 'LBQ2E' , msrp: 999 , orientation: 'Right-Handed' , price: 679 , series: 'Bajo Quinto' , year: 2012 , bridge_type: 'Thunderwing' , number_of_frets: 18 , body_wood: 'Mahogany' , case_type: 'Padded Gig Bag' , tuning_machines: 'Open Gears, Specially Designed Rosewood Bridge with Adjustable Saddles')
product5 = Product.create(quantity: 7, avg_rating: 5.0, brand: 'Taylor', alt_image_1: 'http://images.samash.com/sa/T21/T214CEGXX-P_1.fpx?cell=540,400&qlt=90&cvt=jpg' , alt_image_2: 'http://images.samash.com/sa/T21/T214CEGXX-P_2.fpx?cell=540,400&qlt=90&cvt=jpg' , alt_image_3: 'http://images.samash.com/sa/T21/T214CEGXX-P_3.fpx?cell=540,400&qlt=90&cvt=jpg' , category: 'Acoustic-Electric' , description: 'The Taylor 214ce Rosewood/Spruce Grand Auditorium Acoustic-Electric Guitar features a desirable gloss finish that you\'ll take a shine to. The Grand Auditorium was the first guitar shape designed from scratch by Bob Taylor. It was unveiled to commemorate the company\'s 20th Anniversary in 1994, and since then it has more than lived up to its promise. Although the Taylor GA acoustic-electric guitar has the width and depth of a dreadnought, its narrower waist gives it the appearance of a smaller instrument, adds treble "zing" across the guitar\'s tonal spectrum, sharpens the definition of individual notes, and also enables it to rest comfortably in the lap. Because Taylor removes mass from the width of the GA\'s braces, the guitar top moves faster, resulting in a snappy, bell-like tone. The Taylor GA acoustic-electric guitar is designed to be a strong fingerpicking guitar that also can handle medium strumming, and is exceptionally versatile. The cutaway feature on the Taylor guitar\'s body makes reaching the upper-register frets a snap, giving you comfortable access up and down the ebony fret board.' , image: 'T214CEGXX-P.jpg' , model: '214-CE-G' , msrp: 1328 , price: 999 , series: 'Two-Hundred' , year: 2014)
product6 = Product.create(quantity: 1, avg_rating: 3.5, brand: 'Ibanez', alt_image_1: 'http://images.samash.com/sa/IAF/IAF75_1.fpx?cell=540,400&qlt=90&cvt=jpg' , alt_image_2: 'http://images.samash.com/sa/IAF/IAF75_2.fpx?cell=540,400&qlt=90&cvt=jpg' , alt_image_3: 'http://www.imusician.co.uk/acatalog/00067164.jpg' , category: 'Electric' , description: 'The Ibanez AF75TDG is a gorgeous hollowbody guitar from the Artcore Series. This versatile electric guitar boasts body and neck binding, Ibanez ACH pickups, and a vintage-style vibrato that brings the coveted sounds of country and rockabilly right to your fingertips. Twang out!' , image: 'IAF75.jpg' , model: 'AF75' , msrp: 551 , price: 449 , series: 'Artcore Series' , year: 2014)
product7 = Product.create(quantity: 3, avg_rating: 4.5, brand: 'Fender', alt_image_1: 'http://c804221.r21.cf2.rackcdn.com/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/f/e/fen-1131027-00_2.jpg' , alt_image_2: 'http://c804221.r21.cf2.rackcdn.com/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/f/e/fen-1131027-00_3.jpg' , alt_image_3: 'http://www.musik-produktiv.com/pic-010060198xxl/fender-american-standard-stratocaster-hss-mn-jpm.jpg' , category: 'Electric' , description: 'The Fender Standard Stratocaster Electric Guitar is the guitar design that changed the world. Includes select alder body, 21-fret gloss maple neck with a maple fretboard, 2 single-coil pickups and a humbucker bridge pickup, a vintage-style tremolo, and die-cast tuning keys. At this low price, why play anything but the real thing?' , image: '86ceb3c861ac3d7b0737b2ccde488ca3.png' , model: 'Standard Stratocaster' , msrp: 1600 , orientation: 'Right-Handed' , price: 124 , year: 2014 , bridge_type: 'Synchronized Tremolo' , number_of_frets: 21, neck_type: 'Bolt On' , body_wood: 'AlderMaple' , case_type: 'Hardshell Case' , tuning_machines: 'Sealed Gears')
product8 = Product.create(quantity: 2, avg_rating: 4.5, brand: 'Fender', alt_image_1: 'http://c4.zzounds.com/layout/zzounds/new/images/landing-page/static/namm-2013/embiggen/7/2.jpg' , alt_image_2: 'http://c4.zzounds.com/layout/zzounds/new/images/landing-page/static/namm-2013/embiggen/7/1.jpg' , alt_image_3: 'http://c4.zzounds.com/layout/zzounds/new/images/landing-page/static/namm-2013/embiggen/7/5.jpg' , category: 'Electric' , description: "The highly acclaimed Fender® Select series introduces an all-new lineup for 2013. These finely crafted guitars and basses put decades of Fender expertise on display, with elegant features and design options for discerning musicians everywhere. Experience the latest figured tops, beautiful finishes, choice tone woods, figured and quartersawn maple necks with compound-radius fingerboards, an innovative new inlaid fingerboard design on two of the models, specially voiced pickups, and several new first-rate features that mark Fender\'s top-line best as remarkable instruments.The new Fender Select Telecaster® HH is powerful, beautiful and light, with a potent pair of Wide Range Special humbucking pickups, chambered alder body, gorgeous Malaysian blackwood top, comfortable back contour and Natural gloss lacquer finish. Its modern C-shaped birdseye maple neck has a comfortable contoured heel, satin lacquer finish and Bi-Flex™ truss rod system; the compound radius birdseye maple fingerboard has 22 medium jumbo frets and a gloss lacquer finish." , image: 'f9f9cc2d017d52e9db3f650dec1d0a50.png' , model: 'Select Telecaster HH' , msrp: 2250 , orientation: 'Left-Handed' , price: 2149 , series: 'Fender Select' , year: 2013 , bridge_type: '6-Saddle' , number_of_frets: 22 , neck_type: 'Bolt On' , body_wood: 'AlderBirdseye Maple' , case_type: 'Hardshell Case' , tuning_machines: 'Locking')

puts('Creating users')
kathleen = User.create(email: "kathleen@example.com", password: 'password')
george = User.create(email: "george@example.com", password: 'password')

puts('Creating orders')
order1 = Order.create(user: kathleen, processed_at: "2014-06-09 16:32:16", created_at: "2014-06-09 16:29:16", updated_at: "2014-06-09 16:32:16")
order2 = Order.create(user: george, processed_at: "2014-06-09 16:30:04", created_at: "2014-06-09 15:56:14", updated_at: "2014-06-09 16:30:04")

puts('Creating carts')
cart1 = Order.create(user: kathleen, processed_at: nil, created_at: "2014-06-09 15:54:36", updated_at: "2014-06-09 15:54:36")
cart2 = Order.create(user: george, processed_at: nil, created_at: "2014-06-09 15:57:40", updated_at: "2014-06-09 15:57:40")

puts('Creating order products')
OrderProduct.create(order: order1, product: product1, quantity: 2, unit_price: 2222)
OrderProduct.create(order: order1, product: product2, quantity: 1, unit_price: 2615.0)
OrderProduct.create(order: cart1, product: product3, quantity: 1, unit_price: 749.0)
OrderProduct.create(order: cart1, product: product4, quantity: 1, unit_price: 679.0)
