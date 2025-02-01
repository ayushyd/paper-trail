# class CountryService

# 	def initialize(user, counrty)
# 		@user = user
# 		@counrty = counrty
# 	end

# 	def call
# 		return unless @country&.persisted? && @user.present?

# 		CountryMailer.send_user_email(@user, @counrty).deliver_now
# 	end
# end