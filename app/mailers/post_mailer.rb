class PostMailer < ApplicationMailer
  def new_post_email
    @post = params[:post]

    mail(to: "mateusz.pilat@yahoo.com", subject: "You got a new order!")
  end
end
