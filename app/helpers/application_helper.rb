# frozen_string_literal: true

module ApplicationHelper
  def gravatar_for(user, opts = {})
    opts[:alt] = user.name
    if user.profile_picture?
      image_tag "#{user.profile_picture}", opts
    else
      image_tag "https://robohash.org/#{user.email}", opts
    end
  end
end 
