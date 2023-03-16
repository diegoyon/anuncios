class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      redirect_to announcements_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def announcement_params
    params.require(:announcement).permit(:content).with_defaults(user_id: current_user.id)
  end
end
