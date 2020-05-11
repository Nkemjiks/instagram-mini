module PostHelper
  def is_post_liked_class(post)
    if current_user.voted_up_on? post 
    'likes'
    else
      'unlike' 
    end
  end
end
