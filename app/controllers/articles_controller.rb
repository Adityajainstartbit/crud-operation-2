class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]
	def show
		#@article = Article.find(params[:id])
	end
	def index
		@allarticles=Article.all

	end
	def new
		@article=Article.new

	end
	def edit

		#@article=Article.find(params[:id])

		#@article = Article.find(params[:id])
		#@article = Article.find(params[:id])
	end
	def create
		@article=Article.new(getting_details)
		# render plain: @article.inspect
		 if @article.save
		 	flash[:notice] = "Article sucessfully created."
		redirect_to article_path(@article)
 else
 	render 'new'
 end
		

	end
	def update
# 	@article = Articles.find(params[:id])
# 	 if @article.update(params.require(:article).permit(:title, :description))
# 	 	flash[:notice]="Article was updated"
# 	 	redirect_to @article 
# 	 else
# 	 	render 'edit'

# end 
#     end
 #@article = Article.find(params[:id])
    if @article.update(getting_details)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

def destroy	
	#@article = Article.find(params[:id])
	@article.destroy
	redirect_to "/articles"

	end
	private
	def find_article
		@article = Article.find(params[:id])

	end
	  def getting_details
	  	params.require(:article).permit(:title, :description)

	  end

end