# encoding: utf-8
class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = Invitation.new(params[:invitation])
    if @invitation.save
      #if logged_in?
      subject = "Приглашение от Polza.co"
      Mailer.invitation(@invitation.email, subject).deliver
      #  flash[:notice] = "Thank you, invitation sent."
      #  redirect_to projects_url
      #else
      flash[:notice] = "Thank you, we will notify when we are ready."
      redirect_to root_url
      #end
    else
      render :action => 'new'
    end
  end
end