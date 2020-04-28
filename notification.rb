require './utils'
require './notification_class'

def main(file_name, user_id)
  file = Utils.read_file(file_name)
  return if !file
  notifications_json = Utils.parse_json(file)
  return if !notifications_json
  
  p notifications_json
end
