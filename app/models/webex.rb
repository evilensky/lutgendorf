class Webex < ActiveRecord::Base

  def self.next_webex_session
    where('meeting_time > ?', DateTime.now).order('meeting_time ASC').first.url rescue '#'
  end
end
