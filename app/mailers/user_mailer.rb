class UserMailer < ApplicationMailer
  default from: "youremail@email.com"


  def new_user(user)
    headers["Message-ID"] = "< welcome #{user.id}@blocitoff.example>"

    @user = user

    mail(to: user.email, subject: "Welcome")
  end
end
