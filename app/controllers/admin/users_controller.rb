module Admin
  class UsersController < Admin::BaseController
    before_action :require_admin_user

    private

    def require_admin_user
      current_user.admin?
    end

    def resource_class
      User
    end

    def resource_params
      params.require(:user).permit!
    end
  end
end
