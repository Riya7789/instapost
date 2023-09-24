class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
        if @comment.valid?
          redirect_to root_path
        else
          flash[:alert] = "Invalid params"
          redirect_to root_path
        end
      end
    
      <% post.comments.each do |comment| %>
        <p><%= comment.user.name %> <%= comment.text %></p>
        <%= link_to 'Delete', post_comment_path(post_id: post.id, id: comment.id), method: :delete %>
      <% end %>
      
      private
    
      def comment_params
        params.require(:comment).permit(:text, :post_id)
      end
    end
end
