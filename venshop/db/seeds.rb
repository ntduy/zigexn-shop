# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# def user_params
#     	params.require(:user).permit(:name, :email, :password, :password_confirmation)
#     end


User.create!(name:  "Admin",
	email: "admin@venshop.com",
	password:              "123456",
	password_confirmation: "123456",
	admin: true,
	activated: true,
	activated_at: Time.zone.now)

10.times do |n|
	name  = "testpage-#{n+1}"
	email = "example-#{n+1}@venshop.org"
	password = "password"
	User.create!(name:  name,
		email: email,
		password: password,
		password_confirmation: password,
		activated: true,
		activated_at: Time.zone.now)
end

request = Vacuum.new('US')
request.configure(
	aws_access_key_id: 'AKIAIDP7RIM7JJIUBUAA',
	aws_secret_access_key: '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',
	associate_tag: 'tag'
	)

Categories = ["Baby","Beauty","Books"]
Categories.each do |category|
	cate = Category.create!(name: category)
	for i in 1..3 do
		params = {
			'SearchIndex' => category,
			'Keywords'=> 'birds',
			'ResponseGroup' => "ItemAttributes,Images",
			'ItemPage' => i
		}
		raw_products = request.item_search(query: params)
		hashed_products = raw_products.to_h

		if !hashed_products['ItemSearchResponse']['Items']['Item'].nil?
			hashed_products['ItemSearchResponse']['Items']['Item'].each do |item|
				if product = Product.create!(name: item['ItemAttributes']['Title'], image_url: item['LargeImage']['URL'],description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui, explicabo, dicta reprehenderit iste nostrum sit voluptates facilis! Architecto ut consequatur eum doloremque nostrum. Dolore dolores suscipit perferendis fugit modi blanditiis?", price: item['ItemAttributes']['ListPrice'].to_h['Amount'].to_i/100)

					ProductCategory.create!(category_id: cate.id,product_id: product.id)
					puts "save successfully"
				else
					puts "failed"
				end
			end
		end
	end
end

