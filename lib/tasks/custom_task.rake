namespace :custom_task do
	desc "User list"
	task list_users: :environment do 
		User.all.each do |user|
			puts "User #{user.id} - #{user.email}"
		end
	end	
end