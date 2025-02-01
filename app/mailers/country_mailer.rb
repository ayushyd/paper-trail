class CountryMailer < ApplicationMailer

	def send_user_email(user, country)
		@user = user
		@country = country

		mail(to: @user&.email, subject: "Country is created #{@country&.safe_name}")
	end
end
