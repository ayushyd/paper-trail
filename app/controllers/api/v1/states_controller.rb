module Api
	module V1
		class StatesController < ApplicationController

			before_action :set_country

			def index
				if @states = @country.states.all
				    render json: {states: ActiveModelSerializers::SerializableResource.new(@states, each_serializer: StateSerializer)}
                else
                	render json: {error: @state.errors.full_messages},status: :not_found
                end
			end

			def create
				@state = @country.states.new(state_params)
				if @state.save

					render json: {message: "State was created successfully", state: StateSerializer.new(@state)}
			    else
			    
			        render json: {error: @state.error.full_messages}, status: :not_found
			    end		
			end

			private

			def state_params
				params.require(:state).permit(:name)
			end

			def set_country
				@country = Country.find_by(id: params[:country_id])
			end
		end
	end
end