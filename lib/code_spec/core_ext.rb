class File
  def self.blank? file_name
    !(File.file?(file_name) || File.zero?(file_name))
  end
end