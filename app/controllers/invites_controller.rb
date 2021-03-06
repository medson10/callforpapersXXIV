class InvitesController < ApplicationController
  def new
  end

  def send_email
    InvitesMailer.invite_to_talk(send_email_params[:name],
                                 send_email_params[:email]).deliver_now

    redirect_to new_invite_url, notice: 'Email enviado!'
  end

  private
  def send_email_params
    params.permit(:email, :name)
  end
end
