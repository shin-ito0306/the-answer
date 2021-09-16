class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications
    @notifications.confirmed_by_user
  end
end
