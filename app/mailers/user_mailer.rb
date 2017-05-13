class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def confirmation_email(user, order)
    @name = user.name
    @email = user.email
    @order = order
    mail(to: @email, subject: 'Order # #{@order.id}')
  end
end
