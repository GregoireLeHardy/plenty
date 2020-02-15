class PaymentsController < ApplicationController
  def new
    @donation = current_user.donations.where(state: 'pending').find(params[:donation_id])
    authorize @donation
  end
end
