class GuestbooksController < ApplicationController
  # before_action :authenticate_user!

  def show
    if username = params[:username]
      @guestbook = User.friendly.find(username).guestbook
    else
      @guestbook = current_user.guestbook
    end

    @message = @guestbook.messages.new
  end
end
