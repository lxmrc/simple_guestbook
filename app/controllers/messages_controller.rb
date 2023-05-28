class MessagesController < ApplicationController
  before_action :set_guestbook
  before_action :set_message, only: %i[publish destroy]

  def create
    @message = @guestbook.messages.new(message_params)

    if @message.save
      redirect_to "/#{@guestbook.user.username}",
                  notice: "Message sent! Your message will appear here if #{@guestbook.user.username} publishes it."
    else
      redirect_to "/#{@guestbook.user.username}", status: :unprocessable_entity
    end
  end

  def publish
    @message.update(published: true)
    redirect_to "/#{@guestbook.user.username}", notice: 'Message published.'
  end

  def destroy
    @message.destroy
    redirect_to "/#{@guestbook.user.username}", notice: 'Message deleted.', status: :see_other
  end

  private

  def set_guestbook
    @guestbook = Guestbook.find(params[:guestbook_id])
  end

  def set_message
    @message = @guestbook.messages.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
end
