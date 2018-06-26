class Users::RegistrationsController < Devise::RegistrationsController
  # before_filter :check_permissions, :only => [:new, :create, :cancel]
  skip_before_filter :require_no_authentication


=begin
  def check_permissions
    authorize! :create, resource
  end
=end


  protected

=begin
  def after_update_path_for(resource)
    puts "\n\n\n HOOOOOOOOOOLA"
    user_path(resource)
  end
=end
end
