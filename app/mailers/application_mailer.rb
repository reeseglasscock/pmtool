# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'reese@teamsuitemanager.com'
  layout 'mailer'
end
