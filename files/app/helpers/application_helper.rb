# -*- encoding : utf-8 -*-
module ApplicationHelper
  def display_text(item, attribute)
    if attribute == 'log'
      content_tag :pre, item.send(attribute)
    else
      super
    end
  end
  def display_paperclip(item, attribute)
    if item.send(attribute).content_type =~ /^image\/.+/
      image_tag paperclip_file_url(item, attribute)
    else
      link_to item.send("#{attribute}_file_name"), paperclip_file_url(item, attribute)
    end
  end
  def display_string(item, attribute)
    if attribute == 'hashed_code'
      item.hashed_code.nil? ? "Ainda não gerado." : link_to(item)
    else
      super
    end
  end
  def table_paperclip_field(attribute, item)
    link_to item.send("#{attribute}_file_name"), paperclip_file_url(item, attribute)
  end

  private
  def paperclip_file_url(item, attribute)
    (item.send(attribute).s3_permissions == :private) ? item.send(attribute).expiring_url(10.minutes) : item.send(attribute).url
  end
end
