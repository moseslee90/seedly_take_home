require 'json'

module Utils
  def self.read_file(file_name)
    begin
      File.read(file_name)
    rescue StandardError => e
      p e.message
      return nil
    end
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
