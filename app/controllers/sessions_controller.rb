class SessionsController < Devise::SessionsController

  private

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_path
    else
      super
    end
  end
end
