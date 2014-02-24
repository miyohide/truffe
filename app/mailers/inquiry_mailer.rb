class InquiryMailer < ActionMailer::Base
  default to: ENV['ADMIN_MAIL_ADDRESS'],
          cc: "rubymydear.n@gmail.com",
          from: "rubymydear.n@gmail.com"

  def inquiry_email(contact)
    @contact = contact 
    @user_1 = User.find(1) # N's Mail Address
    @user_2 = User.find(2) # Y's Mail Address
    @url = "http://yoshimasaotsuka.com/"
    mail(subject: t('inquiry.title') + " *** YoshimasaOtsuka.com")
  end
end
