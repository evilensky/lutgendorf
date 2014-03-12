module SharedMethods
  def is_released?(participant)
    if content_release
      Date.today - participant.study_start_date.to_date >= content_release.release_date * 7 rescue true
    else
      true
    end
  end
end