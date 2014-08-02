module FileHelpers
  def read_from_app(file_path)
    File.read("tmp/aruba/myapp/#{file_path}")
  end

  def pathname_from_app(file_path)
    Pathname.new("tmp/aruba/myapp/#{file_path}")
  end
end

World(FileHelpers)
