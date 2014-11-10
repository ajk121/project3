class CommentsController < ApplicationController
 load_and_authorize_resource

 def new 
  @comments = Comment.new
end 

def create
  comment = current_user.comments.new(params[:comment])
  event = Event.find(params[:event_id])
  comment.commentable = event
  comment.save
  
  respond_to do |format|
      format.html {redirect_to :back, notice: 'comment posted'}
      format.json {redirect_to :back, notice: 'comment posted'}
  end

  
end

def update
  @comment = Comment.find(params[:id])
  @comment.update_attributes(params[:comment])
  redirect_to @comment.commentable
end 

def edit 
  @comment = Comment.find(params[:id])
end 

def show
  @comment = Comment.find(params[:id])
end

def destroy
  comment = Comment.find(params[:id])
  event = comment.commentable
  comment.destroy
  redirect_to event
end 

end