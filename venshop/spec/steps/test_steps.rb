require 'rails_helper'
# module UserSteps

#Visit =================================
step "i visit :path page" do |path|
	visit path
end


#click something==========================
step "I click button :button :times time(s)" do |button,times|
	(1..times) { click_button button }
end

step "I click :link" do |link|
	click_on link
end

step "I click the first :value" do |value|
	first('input[value= "%{value}"]' % {value: value}).click
end


#Fill something ===========================
step "I fill :textbox with :value" do |textbox, value|
	fill_in (textbox), with: value 
end

step "i check check box :value" do |value|
	check('A Checkbox')
end


#THEN==================================
step "I will get something like :content" do |content|
	expect(page).to have_content(content)
end

step "I won't get something like :content" do |content|
	expect(page).to_not have_content(content)
end

# end
# RSpec.configure { |c| c.include UserSteps  }
