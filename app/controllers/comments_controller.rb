class CommentsController < ApplicationController

    def create
        Comment.create(text: comment_params[:text], match_id: comment_params[:match_id], user_id: current_user.id)
        redirect_to "/"   #コメントと結びつくツイートの詳細画面に遷移する
      end
    
      private
      def comment_params
        params.permit(:text, :match_id)
      end
end
