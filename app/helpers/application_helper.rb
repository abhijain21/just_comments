module ApplicationHelper

  # set active class for whichever topic is selected in the sidebar
  def sidebar_active_class topic
    request.original_fullpath == topic_path(topic.id) ? 'active' : ''
  end

  # the length at which comments would be trimmed
  def trim_length
  	400
  end

  # check cookies and return whether an upvote / downvote button should be clickable (vote_button class)
  def vote_button_class comment, cookie_id
  	(cookies[cookie_id]||'').split(',').include?(comment.id.to_s) ? '' : 'vote_button'
  end

end
