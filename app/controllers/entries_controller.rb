class EntriesController < ApplicationController
	before_action :require_user

	def home
	end
	
	def new
		@entry = Entry.new
	end
	
	def index
		@entries = Entry.all.paginate(:per_page => 12, :page => params[:page])
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
	
	def show
		@entry = Entry.find(params[:id])
	end
	
	def destroy
		@entry = Entry.find(params[:id]).destroy
		redirect_to index_url
	end
	
	private 
	
	def entry_params
		params.require(:entry).permit(:title, :content)
	end

end
