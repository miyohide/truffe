class InquiryMailer < ActionMailer::Base
  default to: Proc.new { "rubymydear.n@gmail.com" },
          from: "rubymydear.n@gmail.com"

  def inquiry_email(contact)
    @contact = contact 
    @user_1 = User.find(1) # Natsumi Mail Address
    @user_2 = User.find(2) # Yoshimasa Mail Address
    @url = "http://yoshimasaotsuka.com/"
    mail(subject: "Contact Notice Mail *** YoshimasaOtsuka.com")
  end
end
