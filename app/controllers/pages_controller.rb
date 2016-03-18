class PagesController < ApplicationController
	include Devise::Controllers::Helpers

	API_KEY = "AIzaSyDeRjJ-3FOHFDYWlEAkwv_CQEpkoeA7azw"
	BASE_URL = "https://maps.googleapis.com/maps/api/staticmap?zoom=15&size=700x300"
	PIPE_URL_CHARACTER = "%7C"
	MARKER_PARAMETER = "&markers="
	KEY_PARAMETER = "&key=" + API_KEY

	def index
		@loggedIn = owner_signed_in?
		@restaurants = Restaurant.all
		@markers = ""
		@restaurants.each do |restaurant|
			@address = restaurant.address.gsub!(' ', '%20')
			@markers+= MARKER_PARAMETER + restaurant.address
		end
		@mapUrl = BASE_URL + @markers + KEY_PARAMETER

	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@address = @restaurant.address.gsub(' ', '%20')
		@mapUrl = BASE_URL + MARKER_PARAMETER + @address + KEY_PARAMETER
		@loggedIn = (current_owner && current_owner.id == @restaurant.owner.id)
	end

	def new
		@restaurant = current_owner.restaurants.build

	end

	def create
		@restaurant = current_owner.restaurants.build(restaurant_params)
		if (@restaurant.save)
			redirect_to ({action: 'index'})
		else
			render 'new'
		end
	end

	def edit
		@restaurant = current_owner.restaurants.find(params[:id])
	end

	def update
		@restaurant = current_owner.restaurants.find(params[:id])
		if (@restaurant.update(restaurant_params))
			redirect_to @restaurant
		else
			render 'edit'
		end
	end

	def destroy
		@restaurant = current_owner.restaurants.find(params[:id])
		@restaurant.destroy
		redirect_to ({action: 'index'})
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :address, :phone)
	end

end
