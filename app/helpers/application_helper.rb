module ApplicationHelper

  def sidebar_active_class topic
    request.original_fullpath == topic_path(topic.id) ? 'active' : ''
  end

  def trim_length
  	400
  end

  def vote_button_class comment, cookie_id
  	(cookies[cookie_id]||'').split(',').include?(comment.id.to_s) ? '' : 'vote_button'
  end

end
