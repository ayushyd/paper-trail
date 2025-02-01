class UserMailer < ApplicationMailer

	def welcome_email(user, countries = [])
		@user = user
        @countries = countries.presence || []
		mail(to: @user.email, subject: "Welcome to my site")
	end
end
