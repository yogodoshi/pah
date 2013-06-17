class Content < ActiveRecord::Base
  attr_accessible :text, as: :admin
  validates :name, :slug, :text, presence: true
  def self.markdown(slug)
    RDiscount.new(content(slug).text).to_html.html_safe
  rescue
    nil
  end
  def self.raw(slug)
    content(slug).text
  rescue
    nil
  end
  def self.ensure(slug, name, text)
    return unless content(slug).nil?
    content = new
    content.slug = slug.to_s
    content.name = name
    content.text = text
    content.save!
  end
  
  private
  def self.content(slug)
    where(slug: slug.to_s).first
  end
end
