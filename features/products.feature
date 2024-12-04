Feature: Validate product details
  As a customer
  I want to see the details of a product
  So that I can get more information about the product and the available amount on the store

  Scenario Outline: Validate product details from many products
    Given I am on the Products page
    When I scroll to the "<product_name>" section
    Then the product name should be "<product_name>"
    And the marketing text should be "<marketing_text>"
    And an image should be shown
    And "Unit Price" should be "<unit_price>"
    And "# In Stock" should be "<in_stock>"
    And "Item Number" should be "<item_number>"
    And the description below the image should be "<description>"

Examples:
    | product_name        | marketing_text                                                                                                               | unit_price | in_stock | item_number | description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
    | Back Country Shorts | Our quick drying shorts are a customer favorite. Perfect for a day of any outdoor activity or just lounging around the camp. | 24.95      | 59       | 1005        | Lightweight nylon shorts can take on any activity and double as swimwear. Supplex nylon fabric is strong and dries quickly. Nylon liner dries quickly, allowing shorts to be used as swimwear. Two side pockets and one back zip pocket with mesh bottoms for drainage. Elasticised belt provides a comfortable, snug fit. Made in USA.                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
    | Hiking Boots        | Climb any mountain with our PermaDry all leather hiking boots.                                                               | 109.90     | 32       | 1004        | A solid choice for through-hikes and other demanding backpacking with heavy loads, our boots are surprisingly light--just 2 lbs. 13 oz. Full-grain nubuck leather uppers are treated for water-resistance and offer the support and water-repellency of true one-piece construction. The padded, gusseted tongues and padded, leather-lined ankle collars keep out trail debris; Achilles cut-outs offer great heel comfort. Structured toe boxes and heel counters protect you from rocks, roots and other trail hazards. Monoflex insoles with stainless steel shanks are carefully designed to provide torsional stability on rough terrain, yet allow comfortable foot flex. Molded polyurethane midsoles and rubber lug outsoles cushion, support and give reliable traction on all kinds of terrain. Imported |