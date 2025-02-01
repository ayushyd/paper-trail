namespace :email do
	desc "Send Email"
	task send_user_email: :environment do 
		users = User.all 
		counrties = Country.all

		users.each do |user|
			counrties.each do|country|
				CountryMailer.send_user_email(user, country).deliver_now
			end
		end

		puts "Email Send Successfully!"
	end	
end