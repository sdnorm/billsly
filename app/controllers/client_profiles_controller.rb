class ClientProfilesController < ApplicationController
  before_action :set_client_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_client

  # GET /client_profiles
  def index
    @pagy, @client_profiles = pagy(ClientProfile.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @client_profiles.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @client_profiles.load
  end

  # GET /client_profiles/1
  def show
  end

  # GET /client_profiles/new
  def new
    @client_profile = @client.client_profiles.build
  end

  # GET /client_profiles/1/edit
  def edit
  end

  # POST /client_profiles
  def create
    @client_profile = @client.client_profiles.build(client_profile_params)

    if @client_profile.save
      redirect_to @client_profile, notice: "Client profile was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client_profiles/1
  def update
    if @client_profile.update(client_profile_params)
      redirect_to @client_profile, notice: "Client profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /client_profiles/1
  def destroy
    @client_profile.destroy
    redirect_to client_profiles_url, notice: "Client profile was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client_profile
    @client_profile = ClientProfile.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def client_profile_params
    params.require(:client_profile).permit(:client_id, :reminder_message. :payment_options)
  end

  def set_client
    @client = Client.find(params[:client_id])
  end

end
