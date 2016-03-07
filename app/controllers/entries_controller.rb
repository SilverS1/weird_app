class EntriesController < ApplicationController

	def home
	end
	
	def new
		@entry = Entry.new
	end
	
	def create
		@entry = Entry.new(entry_params)
		if @entry.save
			redirect_to root_url
		else
			render 'new'
		end
	end
	
	def edit
		@entry = Entry.find(params[:id])
	end
	
	def update
		@entry = Entry.find(params[:id])
		if @entry.update_attributes(entry_params)
			redirect_to root_url
		else
			render 'edit'
		end
	end
	
	def destroy
		@entry = Entry.find(params[:id]).destroy
	end
	
	private 
	
	def entry_params
		params.require(:entry).permit(:title, :content)
	end

end
