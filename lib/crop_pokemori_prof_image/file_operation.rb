require 'pathname'

module FileOperation
  def make_directory_if_not_exist(directory)
    directory = Pathname.new(change_to_fullpath(directory)).to_s
    unless File.exists?(directory)
      command = "mkdir #{directory}"
      `#{command}`
    end
    directory
  end

  def basename_of_image_file(image_file)
    File.basename(image_file, '.*')
  end

  def remove_image_file(filename)
    File.delete(filename)
  end

  def change_to_fullpath(filename)
    Pathname.new(Dir.pwd).join(filename).to_s
  end
end
