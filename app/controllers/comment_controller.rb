class CommentController < ApplicationController

    def reply_create
        new_reply= Reply.new
        new_reply.content = params[:content]
        new_reply.editor = params[:editor]
        new_reply.post_id = params[:postid]
        new_reply.save
        
        show_path = "/show/" + params[:postid].to_s
        redirect_to show_path
        
    end
    
    def reply_delete
        destroy_reply= Reply.find(params[:reply_id])
        destroy_reply.destroy
        
        
        show_path = "/show/" + destroy_reply.post_id.to_s
        redirect_to show_path
    end
end