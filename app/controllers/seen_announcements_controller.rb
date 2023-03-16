class SeenAnnouncementsController < ApplicationController
  def create
    # debugger
    @seen_announcement = SeenAnnouncement.new(seen_announcement_params)
    if @seen_announcement.save
      flash[:notice] = "Mark as read."
      redirect_to announcements_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    # debugger
    @seen_announcement = current_user.seen_announcements.find_by(announcement_id: params[:seen_announcement][:announcement_id])
    if @seen_announcement.update(seen_announcement_params)
      redirect_to announcements_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def seen_announcement_params
    # debugger
    params.require(:seen_announcement).permit(:seen, :announcement_id).with_defaults(user_id: current_user.id)
  end
end
