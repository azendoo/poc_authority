class Oauth::ApplicationsController < Doorkeeper::ApplicationsController
  respond_to :html

  before_filter :authenticate_admin!

  def index
    @applications = Doorkeeper::Application.all
  end

  def new
    @application = Doorkeeper::Application.new
  end

  def create

    # for testing purpose, lets play with owner :
    if !params[:application][:owner_id].blank?
      current_owner = User.find(params[:application][:owner_id])
    else
      render :new
    end

    @application = Doorkeeper::Application.new(application_params)
    @application.owner = current_owner unless current_owner.nil?

    if @application.save
      flash[:notice] = I18n.t(:notice, :scope => [:doorkeeper, :flash, :applications, :create])
      respond_with [:oauth, @application]
    else
      render :new
    end
  end

  def show
    @application = Doorkeeper::Application.find(params[:id])
  end

  def edit
    @application = Doorkeeper::Application.find(params[:id])
  end

  def update
    @application = Doorkeeper::Application.find(params[:id])
    if @application.update_attributes(application_params)
      flash[:notice] = I18n.t(:notice, :scope => [:doorkeeper, :flash, :applications, :update])
      respond_with [:oauth, @application]
    else
      render :edit
    end
  end

  def destroy
    @application = Doorkeeper::Application.find(params[:id])
    flash[:notice] = I18n.t(:notice, :scope => [:doorkeeper, :flash, :applications, :destroy]) if @application.destroy
    redirect_to oauth_applications_url
  end

  private

  def application_params
    if params.respond_to?(:permit)
      params.require(:application).permit(:name, :redirect_uri)
    else
      params[:application].slice(:name, :redirect_uri) rescue nil
    end
  end
end
