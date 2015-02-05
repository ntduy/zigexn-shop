class Cart < ActiveRecord::Base
	def initizlize(User_id: 0, status: "not yet", name: "", email:"", address: "", phone: "" )
		@user_id = User_id
		@status = status
		@name = name
		@email = email
		@address = address
		@phone = phone
	end
end
