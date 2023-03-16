class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.where("created_at >= ?", 1.day.ago).order(created_at: :desc)
    # @announcements = Announcement.all.order(created_at: :desc)
  end

  def show
    @announcement = Announcement.find(params[:id])

    @seen_announcement = current_user.seen_announcements.find_by(announcement_id: @announcement.id)
    # debugger
    @seen_announcement ||= SeenAnnouncement.new
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      flash[:success] = "Announcement successfully created."
      redirect_to announcements_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def mark_seen
    announcement = Announcement.find(params[:id])
    current_user.seen_announcements.create(announcement: announcement, seen: true)
    redirect_to announcements_path
  end

  private

  def announcement_params
    params.require(:announcement).permit(:content).with_defaults(user_id: current_user.id)
  end

  
end
