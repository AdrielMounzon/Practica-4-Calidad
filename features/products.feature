Feature: Validate product details
  As a customer
  I want to see the details of a product
  So that I can get more information about the product and the available amount on the store

  Scenario Outline: Validate product details from many products
    Given I am on the Products page
    When I scroll to the "<product_name>" section
    Then the product name should be "<product_name>"
    And the marketing text should be "<marketing_text>"
    And an image of the product should be shown
    And "Unit Price" should be "<unit_price>"
    And "# In Stock" should be "<in_stock>"
    And "Item Number" should be "<item_number>"
    And the description below the image should be "<description>"

Examples:
    | product_name            | marketing_text                                                                                                               | unit_price | in_stock | item_number | description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
    | Back Country Shorts     | Our quick drying shorts are a customer favorite. Perfect for a day of any outdoor activity or just lounging around the camp. | 24.95      | 59       | 1005        | Lightweight nylon shorts can take on any activity and double as swimwear. Supplex nylon fabric is strong and dries quickly. Nylon liner dries quickly, allowing shorts to be used as swimwear. Two side pockets and one back zip pocket with mesh bottoms for drainage. Elasticised belt provides a comfortable, snug fit. Made in USA.                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
    | Hiking Boots            | Climb any mountain with our PermaDry all leather hiking boots.                                                               | 109.90     | 32       | 1004        | A solid choice for through-hikes and other demanding backpacking with heavy loads, our boots are surprisingly light--just 2 lbs. 13 oz. Full-grain nubuck leather uppers are treated for water-resistance and offer the support and water-repellency of true one-piece construction. The padded, gusseted tongues and padded, leather-lined ankle collars keep out trail debris; Achilles cut-outs offer great heel comfort. Structured toe boxes and heel counters protect you from rocks, roots and other trail hazards. Monoflex insoles with stainless steel shanks are carefully designed to provide torsional stability on rough terrain, yet allow comfortable foot flex. Molded polyurethane midsoles and rubber lug outsoles cushion, support and give reliable traction on all kinds of terrain. Imported |
    | Padded Socks            | Our favorite padded socks will make your next back country trek easier on your feet.                                         | 19.99      | 47       | 1003        | These heavyweight socks are designed for long distances. Reinforced heels and flat-seam toes prevent blisters. Made of DuraTek for warmth and wicking; nylon and spandex add durability and exceptional shape retention. 80% DuraTek/18% nylon/2% spandex. Made in USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
    | Glacier Sun Glasses     | Our best glacier sun glasses will protect you on your next expedition or when you hit the slopes.                            | 67.99      | 138      | 1002        | Use these full-coverage, full-protection sun glasses for all your outdoor activities. Polycarbonate lenses provide lightweight, shatterproof protection. Lenses offer 100% UV protection; gray tint for true color transmission. Coating on inside of lens decreases light reflections from behind. Wire-injected nylon frames are unbreakable and offer a snug, sure fit.                                                                                                                                                                                                                                                                                                                                                                                                                                          |
    | External Frame Backpack | Our most popular external frame backpack                                                                                     | 179.95     | 8        | 1001        | An ideal pack for long trail trips, its strong heli-arc welded 6061-T6 aircraft-quality aluminum frame with V-truss design resists diagonal distortion. Thoughtful design allows head clearance when the bag is in lower position. Four outside pockets keep necessary gear and accessories within easy reach. Fully-adjustable suspension features curved, tapered shoulder straps with load-lift straps and sternum strap provide load carrying comfort. Hipbelt has generous padding. Two large main compartments; lower sleeping bag compartment has outside zip access. Extender bar and extension collar. Heavy-duty nylon ripstop packcloth. Made in USA.                                                                                                                                                    |
    | 3 Person Dome Tent      | Our best 3 person backpack dome tent                                                                                         | 299.99     | 23       | 1000        | Here's a superb three-season mountaineering/backpacking tent at a great price! This dome sleeps 3 and weighs in at only 4.5 lbs. Unique quick-clips provide fast and easy setup. Tough, coated-nylon taffeta floor withstands lots of use. Rain fly and integral vestibule included. Imported                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |     