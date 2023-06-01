class ChefMailer < ApplicationMailer
  default from: email_address_with_name('mailer@example.com', 'mailer')

  def notify_new_item(item)
    @order_item = item
    @order = @order_item.order
    @dish = @order_item.dish 
    
    mail(to: @dish.chef.user.email, subject: 'Novo prato adicionado ao pedido')
  end
end
