class Notification  
  attr_accessor :user_id, :notification_type_id, :sender_id, 
  :sender_type, :target_id, :target_type, :created_at

  NOTIFICATION_TYPE = {
    post_answer: 1,
    post_comment: 2,
    upvote_answer: 3
  }

  POST_ANSWER = 'answered a question'
  POST_COMMENT = 'commented on a question'
  UPVOTE_ANSWER = 'upvoted a question'
  UNKNOWN_EVENT = 'did an unknown action on a question'

  def initialize(obj)
    @user_id = obj&.dig(:user_id)
    @notification_type_id = obj&.dig(:notification_type_id)
    @sender_id = obj&.dig(:sender_id)
    @sender_type = obj&.dig(:sender_type)
    @target_id = obj&.dig(:target_id)
    @target_type = obj&.dig(:target_type)
    @created_at = obj&.dig(:created_at)
  end

  class << self
    def get_notification_type_string(notification_type_id)
      if notification_type_id == NOTIFICATION_TYPE[:post_answer]
        POST_ANSWER
      elsif notification_type_id == NOTIFICATION_TYPE[:post_comment]
        POST_COMMENT
      elsif notification_type_id == NOTIFICATION_TYPE[:upvote_answer]
        UPVOTE_ANSWER
      else
        UNKNOWN_EVENT
      end
    end
  end
end
