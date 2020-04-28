require './utils'
require './notification_class'

def main(file_name, user_id)
  file = Utils.read_file(file_name)
  return if !file
  notifications_json = Utils.parse_json(file)
  return if !notifications_json
  date_1 = Utils.get_date_string(1574325866040)
  date_2 = Utils.get_date_string(1574325959410)
  p date_1
  p date_2
  notifications_map = generate_notifications_map(notifications_json, user_id)
  grouped_notifications = group_notifications(notifications_map)
  sorted_notifications = sort_notifications_by_date(grouped_notifications)

  print_notifications(sorted_notifications)
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

def group_notifications(notifications_map)
  grouped_notifications = Hash.new
  notifications_map.each do | target_id, notification_type_id |
    notifications_map[target_id].each do | notification_type_id, sender_id |
      to_print = ''
      latest_date = 0
      users = ''

      notifications_map[target_id][notification_type_id] =
        notifications_map[target_id][notification_type_id].sort_by { | sender_id, date | date }
      
      _, earliest_date = notifications_map[target_id][notification_type_id].first
      
      notifications_map[target_id][notification_type_id].each do | sender_id, date |
        if date - earliest_date > 30 * 1000
          # this notification is more than 30 secs from earliest
          # set new earliest date and batch the last few messages together

          # set previous batch first
          notification_type_string = Notification.get_notification_type_string(notification_type_id)
          date_string = Utils.get_date_string(latest_date)
          to_print = "[#{date_string}] #{users} #{notification_type_string}"
          grouped_notifications[latest_date] = to_print

          # start new batch
          earliest_date = date
          users = ''
        end
        if date > latest_date
          latest_date = date
        end
        if users == ''
          users = sender_id
        else
          users = users + ' and ' + sender_id
        end
      end
      notification_type_string = Notification.get_notification_type_string(notification_type_id)
      date_string = Utils.get_date_string(latest_date)
      to_print = "[#{date_string}] #{users} #{notification_type_string}"
      grouped_notifications[latest_date] = to_print
    end
  end
  grouped_notifications
end

def sort_notifications_by_date(grouped_notifications)
  grouped_notifications.sort_by { |date, notification| date }
end

def print_notifications(sorted_notifications)
  sorted_notifications.each do | _, notification_string |
    p notification_string
  end
end

main(ARGV[0], ARGV[1])
