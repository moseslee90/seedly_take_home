module Utils
  def self.read_file(file_name)
    begin
      File.read(file_name)
    rescue StandardError => e
      p e.message
      return nil
    end
  end
end