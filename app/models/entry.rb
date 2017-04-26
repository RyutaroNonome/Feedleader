class Entry < ActiveRecord::Base
  belongs_to :feed

  def add_origin_link
    "#{convert_to_publish} 続きを→【<a href='#{url}' target='_blank' rel='noopener noreferrer'>#{feed.name}</a>】で読む♪".html_safe
  end

  def convert_to_publish
    content.slice!(0) if content[0] == "\n"
    line_number = 0
    f = ''
    r = 0

    content.each_line { |line| line_number += 1 }
    break_point = (line_number * 0.3).to_i

    content.each_line.with_index do |line, i|
      f += line
      start_tags = line.match(/<[^\/].*?>/)
      end_tags = line.match(/<\/.*?>/)
      r += 1 if start_tags && !(start_tags.length == 1 && start_tags.to_s.match(/<img/))
      r -= 1 if end_tags
      break if i > break_point && r == 0 && line.match(/<\/.+>/)
    end

    f
  end
end