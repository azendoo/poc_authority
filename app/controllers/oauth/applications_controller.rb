class Oauth::ApplicationsController < Doorkeeper::ApplicationsController
  respond_to :html
#  before_filter :authenticate_user!

#  def index
#    @applications = current_user.applications
#    respond_with @applications
#  end

  def new
    @application = Doorkeeper::Application.new
  end

  def create
    @application = Doorkeeper::Application.new(application_params)
    @application.owner = current_user

    if @application.save
      flash[:notice] = I18n.t(:notice, :scope => [:doorkeeper, :flash, :applications, :create])
      respond_with [:oauth, @application]
    else
      render :new
    end
  end

#  def show
#    @application = current_user.applications.find(params[:id])
#    respond_with @application
#  end
#
#  def edit
#    @application = current_user.applications.find(params[:id])
#  end
#
#  def update
#    @application = current_user.applications.find(params[:id])
#    if @application.update_attributes(application_params)
#      flash[:notice] = I18n.t(:notice, :scope => [:doorkeeper, :flash, :applications, :update])
#      respond_with [:oauth, @application]
#    else
#      render :edit
#    end
#  end
#
#  def destroy
#    @application = current_user.applications.find(params[:id])
#    flash[:notice] = I18n.t(:notice, :scope => [:doorkeeper, :flash, :applications, :destroy]) if @application.destroy
#    redirect_to oauth_applications_url
#  end
#
  private

  def current_user
    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

end
