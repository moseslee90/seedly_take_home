require './utils'
require './notification_class'

def main(file_name, user_id)
  file = Utils.read_file(file_name)
  return if !file
  notifications_json = Utils.parse_json(file)
  return if !notifications_json
  notifications_map = generate_notifications_map(notifications_json, user_id)
  p notifications_map
end

def generate_notifications_map(notifications, user_id)
  notifications_map = Hash.new{ |hash, key| hash[key] = Hash.new{ |hash, key| hash[key] = {} } }
  
  notifications.each do |element|
    notification = Notification.new(element)
    if notification&.user_id == user_id && notification&.sender_id != user_id
      date = Utils.get_date_string(notification.created_at)
      notifications_map[notification&.target_id][notification&.notification_type_id][notification&.sender_id] = notification.created_at
    end
  end

  notifications_map
end

main(ARGV[0], ARGV[1])
