class NotificationMailer < ApplicationMailer
  default from: "hogehoge@example.com"

  def send_confirm_to_user(plan)
    @plan = plan
    mail(
      subject: "決済されました", #メールのタイトル
      to:  ENV["USER_NAME"] #宛先
    ) do |format|
      format.text
    end
  end
end
