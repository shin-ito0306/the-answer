class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications
    @notifications.where(checked: 0).update_all(checked: 1)
  end
end
