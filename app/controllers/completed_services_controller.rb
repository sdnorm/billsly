class CompletedServicesController < ApplicationController
  before_action :set_completed_service, only: [:show, :edit, :update, :destroy]

  # GET /completed_services
  def index
    @pagy, @completed_services = pagy(CompletedService.sort_by_params(params[:sort], sort_direction))

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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_completed_service
    @completed_service = CompletedService.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def completed_service_params
    params.require(:completed_service).permit(:account_id, :client_profile_id)
  end
end
