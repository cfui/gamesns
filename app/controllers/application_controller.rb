class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
	    "/admin"
    when Enduser
        edit_enduser_path(current_enduser.id)
	 end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
    # refileのsecret_keyの登録
  Refile.secret_key = '2cf6c760df2320d55a265d95d1fc30e3704b6609c80d0a4122deefc7e45b8464d82acac060020eaf22e996a3bd4091ad1b3612cac9fb0e158cb8c1019f698f54'

end

