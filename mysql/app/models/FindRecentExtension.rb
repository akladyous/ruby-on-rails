module FindRecentExtension
  def find_recent
    where("created_at > ?", 5.days.ago)
  end
  def with_photo
    where.not(photo_id: nil)
  end
end
