class ReviewMailer < ApplicationMailer
  default from: "bubble.t.stops@gmail.com"

  def alert_email(review)
    @review = review
    mail(
      to: @review.shop.user.email,
      subject: "A review has been submitted for your shop"
    )
  end
end
