# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(_resource)
    chefs_path
  end
end
