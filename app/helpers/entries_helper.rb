module EntriesHelper
  def convert_to_publish(entry)
    "#{entry.content} 続きを→【<a href='#{entry.url}' target='_blank' rel='noopener noreferrer'>#{entry.feed.name}</a>】で読む♪"
  end
end