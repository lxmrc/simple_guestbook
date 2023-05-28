class MessagesController < ApplicationController
  before_action :set_message, only: %i[show edit update destroy]
  before_action :set_guestbook, only: %i[create]

  def create
    @message = @guestbook.messages.new(message_params)

    if @message.save
      redirect_to "/#{@guestbook.user.username}", notice: 'Message was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @message.destroy
    redirect_to @guestbook, notice: 'Message was successfully destroyed.', status: :see_other
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
