class BlogsController < ApplicationController
    def index
        @blogs = Blog.all
    end

    def show
    end

    def new
        @blog = Blog.new
    end

    def create
        @blog = Blog.new(allowed_params)

        if @blog.save
            redirect_to(blogs_path)
        else
            render 'new'
        end

    end

    def edit
        @blog = Blog.find(params[:id])
    end

    def update
        @blog = Blog.find(params[:id])

        if @blog.update(allowed_params)
            redirect_to(blogs_path)
        else
            render 'edit'
        end
    end

    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
    end

    private

    def allowed_params
        params.require(:blog).permit(:title, :content, :author)
    end
end