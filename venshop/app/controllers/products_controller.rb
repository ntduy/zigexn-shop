class ProductsController < ApplicationController
	def index
		# @products = Product.all
		request = Vacuum.new('JP')
		request.configure(
			aws_access_key_id: 'AKIAIDP7RIM7JJIUBUAA',
			aws_secret_access_key: '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',
			associate_tag: 'tag'
			)

		params = {
			'SearchIndex' => 'Baby',
			'Keywords'=> 'birds',
			'ResponseGroup' => "ItemAttributes,Images",
			'ItemPage' => 2
		}

		raw_products = request.item_search(query: params)
		hashed_products = raw_products.to_h

		@products = []

		hashed_products['ItemSearchResponse']['Items']['Item'].each do |item|
			product = OpenStruct.new
			product.name = item['ItemAttributes']['Title']
			product.url = item['DetailPageURL']
			product.price = item['ItemAttributes']['ListPrice'].to_h
			product.category = params['SearchIndex']
			product.image_url = item['LargeImage']['URL']
			# product.totalresults = item['List']['TotalResults']
			@products << product 
		end
		File.open("seeds.rb", 'a') do |f| 
			@products.each do |p|
				f.write("Product.create!(name: \"#{(p.name)})\",image_url: \"#{(p.image_url)}\",
					description: \"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A quae fugit maxime fuga, iusto, expedita dignissimos impedit vel veniam ratione ipsam eos enim similique excepturi quaerat harum reiciendis soluta. Fugiat.\",
					amount: \"#{(p.price['Amount'])}\",
					currencycode: \"#{(p.price['CurrencyCode'])}\",
					formattedprice: \"#{(p.price['FormattedPrice'])}\",
					status: \"available\")\n
				")
			end
		end
	end

	def show
		@product = Product.find(params [:id])
	end
end
