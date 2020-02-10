class DonationsController < ApplicationController
  def create
    project = Project.find(params[:project_id])
    order = Donation.create!(project: project, ptoject_sku: project.sku, amount: project.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: project.sku,
        images: [project.photo_url],
        amount: project.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @donation = current_user.donations.find(params[:id])
  end
end

