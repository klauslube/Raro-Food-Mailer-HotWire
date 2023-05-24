class SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    chefs_path
  end

end
