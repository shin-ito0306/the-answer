class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications.order(created_at: "DESC")
    current_user.checked_by_user
  end
end
