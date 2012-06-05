module UploadFileTestHelper
  def uploaded_file(filename, content_type = "text/csv")
    t = Tempfile.new(filename.split("/").last)
    t.binmode
    path = File.join(Rails.root, "spec", "fixtures", filename)
    FileUtils.copy_file(path, t.path)
    (class << t; self; end).class_eval do
      alias local_path path
      define_method(:original_filename) {filename}
      define_method(:content_type) {content_type}
    end
    return t
  end
end

RSpec.configure do |config|
  config.include UploadFileTestHelper, :type => :controller
end