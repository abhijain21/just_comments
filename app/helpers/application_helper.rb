module ApplicationHelper

  def sidebar_active_class topic
    request.original_fullpath == topic_path(topic.id) ? 'active' : ''
  end

  def trim_length
  	400
  end

end
