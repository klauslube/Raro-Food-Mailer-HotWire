class ChefMailer < ApplicationMailer
  default from: email_address_with_name('mailer@example.com', 'mailer')
          to: 
  def order_created(order)
    @order = order
    mail(subject: 'Pedido Cadastrado')
  end
end
