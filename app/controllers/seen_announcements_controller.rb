class SeenAnnouncementsController < ApplicationController
  def create
    @seen_announcement = SeenAnnouncement.new(seen_announcement_params)
    if @seen_announcement.save
      # flash[:notice] = "Mark as read."
      redirect_to announcements_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @seen_announcement = current_user.seen_announcements.find_by(announcement_id: params[:seen_announcement][:announcement_id])
    if @seen_announcement.update(seen_announcement_params)
      # flash[:notice] = "Updated"
      redirect_to announcements_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def seen_announcement_params
    params.require(:seen_announcement).permit(:seen, :announcement_id).with_defaults(user_id: current_user.id)
  end
end
