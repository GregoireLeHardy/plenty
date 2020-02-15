class DonationsController < ApplicationController
  def create
    project = Project.find(params[:donation][:project_id])
    donation = Donation.create!(project: project, project_sku: project.sku, price_cents: (params[:donation][:doner_price]), state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: project.name,
        images: [project.photo],
        # change amount to the user params input
        amount: multiply(donation.price_cents),
        currency: 'eur',
        quantity: 1
      }],
      success_url: donation_url(donation),
      cancel_url: donation_url(donation)
    )

    donation.update(checkout_session_id: session.id)
    redirect_to new_donation_payment_path(donation)
    authorize donation
  end

  def show
    @donation = current_user.donations.find(params[:id])
    authorize @donation
  end

  def multiply(amount)
    return amount.to_i * 100
  end

  # add a method that multiplies the params of the form by 100 and increment the price_cents field with it.
  private

  def donation_params
    params.require(:donation).permit(:doner_price, :project_id)
    authorize @donation
  end
end
