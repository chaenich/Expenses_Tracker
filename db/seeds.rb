require_relative( "../models/transaction.rb" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb" )
require("pry")

Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()

# Merchant setup ---------------------------------
merchant1 = Merchant.new({
  "merchant_name" => "Tesco"
})
merchant2 = Merchant.new({
  "merchant_name" => "Sainsburys"
})
merchant3 = Merchant.new({
  "merchant_name" => "Mortgages-R-Us"
})
merchant4 = Merchant.new({
  "merchant_name" => "British Airways"
})
merchant5 = Merchant.new({
  "merchant_name" => "Octopus Energy"
})
merchant6 = Merchant.new({
  "merchant_name" => "Co-op"
})
merchant7 = Merchant.new({
  "merchant_name" => "Mortgage Insurance Co."
})
merchant8 = Merchant.new({
  "merchant_name" => "Water Co."
})
merchant9 = Merchant.new({
  "merchant_name" => "Sun-screen Superstore"
})
merchant10 = Merchant.new({
  "merchant_name" => "Holiday-Lets-From-Heaven"
})
merchant11 = Merchant.new({
  "merchant_name" => "Local Pub"
})
merchant12 = Merchant.new({
  "merchant_name" => "Tommy's TakeAway"
})
merchant13 = Merchant.new({
  "merchant_name" => "Other pub where not barred"
})
merchant14 = Merchant.new({
  "merchant_name" => "Gym"
})
merchant15 = Merchant.new({
  "merchant_name" => "Lothian Buses"
})

merchant1.save
merchant2.save
merchant3.save
merchant4.save
merchant5.save
merchant7.save
merchant8.save
merchant9.save
merchant10.save
merchant11.save
merchant12.save
merchant13.save
merchant14.save
merchant15.save

# Tag setup ---------------------------------
tag1 = Tag.new({
  "tag_name" => "Food"
})
tag2 = Tag.new({
  "tag_name" => "Travel"
})
tag3 = Tag.new({
  "tag_name" => "Bills"
})
tag4 = Tag.new({
  "tag_name" => "Mortgage"
})
tag5 = Tag.new({
  "tag_name" => "Holiday"
})
tag6 = Tag.new({
  "tag_name" => "Leisure"
})
tag1.save()
tag2.save()
tag3.save()
tag4.save()
tag5.save()
tag6.save()

# Transactions setup ---------------------------------
# transaction amount field is in pence
transaction1 = Transaction.new({
  "amount" => 1230,
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id
})
transaction2 = Transaction.new({
  "amount" => 8260,
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id
})
transaction3 = Transaction.new({
  "amount" => 723,
  "merchant_id" => merchant2.id,
  "tag_id" => tag1.id
})
transaction4 = Transaction.new({
  "amount" => 1168,
  "merchant_id" => merchant2.id,
  "tag_id" => tag1.id
})
transaction5 = Transaction.new({
  "amount" => 60000,
  "merchant_id" => merchant3.id,
  "tag_id" => tag4.id
})
transaction6 = Transaction.new({
  "amount" => 60000,
  "merchant_id" => merchant3.id,
  "tag_id" => tag4.id
})
transaction7 = Transaction.new({
  "amount" => 95000,
  "merchant_id" => merchant4.id,
  "tag_id" => tag5.id
})
transaction8 = Transaction.new({
  "amount" => 9000,
  "merchant_id" => merchant5.id,
  "tag_id" => tag3.id
})
transaction9 = Transaction.new({
  "amount" => 9000,
  "merchant_id" => merchant5.id,
  "tag_id" => tag3.id
})
transaction10 = Transaction.new({
  "amount" => 2260,
  "merchant_id" => merchant6.id,
  "tag_id" => tag1.id
})
transaction11 = Transaction.new({
  "amount" => 5200,
  "merchant_id" => merchant7.id,
  "tag_id" => tag4.id
})
transaction12 = Transaction.new({
  "amount" => 5200,
  "merchant_id" => merchant7.id,
  "tag_id" => tag4.id
})
transaction13 = Transaction.new({
  "amount" => 3200,
  "merchant_id" => merchant8.id,
  "tag_id" => tag3.id
})
transaction14 = Transaction.new({
  "amount" => 3200,
  "merchant_id" => merchant8.id,
  "tag_id" => tag3.id
})
transaction15 = Transaction.new({
  "amount" => 3840,
  "merchant_id" => merchant9.id,
  "tag_id" => tag5.id
})
transaction16 = Transaction.new({
  "amount" => 67000,
  "merchant_id" => merchant10.id,
  "tag_id" => tag5.id
})
transaction17 = Transaction.new({
  "amount" => 1220,
  "merchant_id" => merchant11.id,
  "tag_id" => tag6.id
})
transaction18 = Transaction.new({
  "amount" => 2430,
  "merchant_id" => merchant11.id,
  "tag_id" => tag6.id
})
transaction19 = Transaction.new({
  "amount" => 740,
  "merchant_id" => merchant11.id,
  "tag_id" => tag6.id
})
transaction20 = Transaction.new({
  "amount" => 2200,
  "merchant_id" => merchant12.id,
  "tag_id" => tag1.id
})
transaction21 = Transaction.new({
  "amount" => 1550,
  "merchant_id" => merchant12.id,
  "tag_id" => tag1.id
})
transaction22 = Transaction.new({
  "amount" => 3370,
  "merchant_id" => merchant12.id,
  "tag_id" => tag1.id
})
transaction23 = Transaction.new({
  "amount" => 820,
  "merchant_id" => merchant12.id,
  "tag_id" => tag1.id
})
transaction24 = Transaction.new({
  "amount" => 5478,
  "merchant_id" => merchant12.id,
  "tag_id" => tag1.id
})
transaction25 = Transaction.new({
  "amount" => 1820,
  "merchant_id" => merchant13.id,
  "tag_id" => tag6.id
})
transaction26 = Transaction.new({
  "amount" => 2920,
  "merchant_id" => merchant13.id,
  "tag_id" => tag6.id
})
transaction27 = Transaction.new({
  "amount" => 3500,
  "merchant_id" => merchant14.id,
  "tag_id" => tag6.id
})
transaction28 = Transaction.new({
  "amount" => 3500,
  "merchant_id" => merchant14.id,
  "tag_id" => tag6.id
})
transaction29 = Transaction.new({
  "amount" => 170,
  "merchant_id" => merchant15.id,
  "tag_id" => tag2.id
})
transaction30 = Transaction.new({
  "amount" => 400,
  "merchant_id" => merchant15.id,
  "tag_id" => tag2.id
})

transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()
transaction5.save()
transaction6.save()
transaction7.save()
transaction8.save()
transaction9.save()
transaction10.save()
transaction11.save()
transaction12.save()
transaction13.save()
transaction14.save()
transaction15.save()
transaction16.save()
transaction17.save()
transaction18.save()
transaction19.save()
transaction20.save()
transaction21.save()
transaction22.save()
transaction23.save()
transaction24.save()
transaction25.save()
transaction26.save()
transaction27.save()
transaction28.save()
transaction29.save()
transaction30.save()

# binding.pry
# nil
