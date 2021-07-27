class CompletedServicesController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_completed_service, only: [:show, :edit, :update, :destroy]
  before_action :set_account

  before_action :verify_ownership, except: [:index, :create, :create_from_dashboard, :create_from_client_show]

  # GET /completed_services
  def index
    if params[:sort].present?
      @pagy, @completed_services = pagy(@account.completed_services.sort_by_params(params[:sort], sort_direction))
    else
      @pagy, @completed_services = pagy(@account.completed_services.order(created_at: :desc))
    end

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @completed_services.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @completed_services.load
  end

  # GET /completed_services/1
  def show
  end

  # GET /completed_services/new
  def new
    @completed_service = CompletedService.new
  end

  # GET /completed_services/1/edit
  def edit
  end

  # POST /completed_services
  def create
    @completed_service = CompletedService.new(completed_service_params)

    if @completed_service.save
      redirect_to @completed_service, notice: "Completed service was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # POST /completed_services
  def create_from_dashboard
    @completed_service = CompletedService.new(completed_service_params)
    if @completed_service.save
      redirect_to root_path, notice: "This job was marked as completed."
    else
      redirect_to root_path, alert: "Something happened and the job/service was not marked complete! Please try again."
    end
  end

  def create_from_client_show
    @completed_service = CompletedService.new(completed_service_params)
    if @completed_service.save
      redirect_to client_path(@completed_service.client_profile.client), notice: "This job was marked as completed."
    else
      redirect_to client_path(@completed_service.client_profile.client), alert: "Something happened and the service was not marked complete! Please try again."
    end
  end

  # PATCH/PUT /completed_services/1
  def update
    if @completed_service.update(completed_service_params)
      redirect_to @completed_service, notice: "Completed service was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /completed_services/1
  def destroy
    @completed_service.destroy
    redirect_to completed_services_url, notice: "Completed service was successfully destroyed."
  end

  def test_reminder
    test_email = TestEmailReminder.new(user_id: current_user.id)
    if test_email.save
      redirect_to clients_path, notice: "Test email successfully sent."
    else
      redirect_to clients_path, alert: "Something appears to have gone wrong. Double check your email address and try again."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_completed_service
    @completed_service = CompletedService.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def completed_service_params
    params.require(:completed_service).permit(:account_id, :client_profile_id)
  end

  def verify_ownership
    check_user_permission(@completed_service)
  end
end
