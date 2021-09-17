class NotificationsController < ApplicationController

  def index
    @notifications = current_user.received
    current_user.checked_by_user
  end
end
