require 'json'
require 'date'

module Utils
  def self.read_file(file_name)
    begin
      File.read(file_name)
    rescue StandardError => e
      p e.message
      return nil
    end
  end

  def self.get_date_string(date_in_ms)
    date_in_seconds = date_in_ms/1000;
    date_time = DateTime.strptime(date_in_seconds.to_s, '%s')
    date_time.strftime('%F %T')
  end

  def self.parse_json(file)
    begin
      JSON.parse(file, :symbolize_names => true)
    rescue StandardError => e
      p e.message
      return nil
    end
  end
end
