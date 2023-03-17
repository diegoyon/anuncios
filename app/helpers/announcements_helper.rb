module AnnouncementsHelper
  def set_background_color(announcement)
    seen_announcement=current_user.seen_announcements.find_by(announcement_id: announcement.id)
    if seen_announcement
      if seen_announcement.seen
        background_color = "" 
      else
        background_color = "bg-info" 
      end
    else
      background_color = "bg-info"
    end  
  end
end
