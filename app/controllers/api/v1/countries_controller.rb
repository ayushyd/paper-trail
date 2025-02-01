module Api
	module V1
		class CountriesController < ApplicationController

			def index
			    @countries = current_user&.countries 
			    render json: {
                countries: @countries.map { |country| CountrySerializer.new(country, scope: current_user).as_json }
                }
            end


			def create
				@country = current_user&.countries.new(country_params)
				@user = current_user
				if @country.save
                    CountryMailer.send_user_email(@user, @country).deliver_now
					render json: {message: "Country was created successfully!", country: CountrySerializer.new(@country, scope: current_user).as_json}
			    else 
			    
			        render json: {error: @country.errors.full_messages}, status: :not_found		
				end
			end

			private

			def country_params
				params.require(:country).permit(:name)
			end
		end
	end
end