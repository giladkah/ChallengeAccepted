## Considersations:

## Seller story:

Sellers can CRUD their Locations, Order Types, Menu Items and Order Types. Seller can CRUD for a location a day part Seller can CRUD for a location a price level by order type [and day part]

Brand has one-to-many relations with: Location, Order Type, Menu Item and Order Type

Location has one to many relations with Day Part and Price Configurations.

PriceConfiguration is a model that will save the mapping from OrderType and DayType to PriceLevel:
There are a few possible choices modeling the relation between price levels and menu items.

A. If we use ActiveRecord and mysql, it means that we have a rigid relation between the two. For example, for each price level we will have many menu items. The problem here is that “Spicy Reuben” will appear both in “Happy Hour” and in “Regular” with different prices. B. We can also assume that a brand doesn’t have a lot of price levels and we can give 10 columns for example for unused price levels for each menu item. It’ll be easier to use in some ways, but the problem will be to maintain it and to create a migration if the brand wants more than 10 price levels.
If we use NoSql like Mongo, we can put everything for a menu item in one document and contain that list of different price levels.
UX wise, it’ll be important to show the seller what data is missing once he/she created a new price level. E.g, prompt that “Spicy Reuben” doesn’t have a price for ”Happy Hour”. Also it’ll be essential to always have a regular price - a default, if seller forgot to specify the price level for this menu item
## Buyer Story

Buyer can order a menu item with a specific location, order type [and day part]

Menu Item will have a one-to-many relation with orders. Same as Location, Order Type and day part
Brand will have one-to-many relation with orders through Menu Item and the rest

When buyer enters location, order type and the time, the price level is calculated by the specifications, and if there is one, a menu item is purchased with the price level price and an order is created

## mockup site

https://sleepy-brushlands-57841.herokuapp.com/ The site here gives the relations between Brand and its one-to-many relations and gives some of the seller stories what's missing: The menu-items <-> price levels mysql/mongo relation. the double nesting for location and day-part and price-configuration. Order and the buyer flow

## Validations

The needed validations are for uniqness of input for brands. For each brand uniqness for locations, menu items, order types and price levels. Also, need to validate uniqness of price configuration per order type and day part. Also need validation for day parts that don't interfere with one another
