class ClientsController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_account
  before_action :set_client, only: [
    :show, :edit, :update, :destroy, :initial_reminder, 
    :message_index_update, :revert_to_account_default_message, :revert_to_last_specific_message,
    :work_complete
  ]
  before_action :verify_ownership, except: [:index, :new, :create]

  def bulk_send_reminders
    params.permit(:client_ids)
    
  end

  # GET /clients
  def index
    if params[:query].present?
      @pagy, @clients = pagy(@account.clients.general_client_search(params[:query]).sort_by_params(params[:sort], sort_direction))
    elsif params[:sort].present?
      @pagy, @clients = pagy(@account.clients.sort_by_params(params[:sort], sort_direction))
    else 
      @pagy, @clients = pagy(@account.clients.order(last_name: :asc))
    end
    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @clients.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @clients.load
  end

  # GET /clients/1
  def show
  end
  
  def work_complete_index
    @client.work_complete(current_account, current_user)
    redirect_to clients_url, notice: "Work completed for #{@client.first_name}!"
  end

  def initial_reminder
    @client.send_initial_reminder(current_account, current_user)
    redirect_to clients_url, notice: "Reminder sent to #{@client.first_name}!"
  end

  def bulk_reminder_send
    params.require(:client_ids)
    clients = params[:client_ids]
    clients.each do |c|
      Client.find(c).send_initial_reminder(current_account, current_user)
    end
    redirect_to clients_url, alert: "Reminders sent!"
  end

  def revert_to_account_default_message
    @client.set_last_reminder_message
    @client.clear_out_reminder_message
    redirect_to client_url(@client), alert: "Reminder message set to your account default for #{@client.full_name}!"
  end

  def revert_to_last_specific_message
    @client.client_profiles.first.update(reminder_message: @client.client_profiles.first.last_reminder_message)
    redirect_to client_url(@client), alert: "Reminder message set to the previous specific message for #{@client.full_name}!"
  end

  # GET /clients/new
  def new
    @client = Client.new
    @client.client_profiles.new
    @payment_options = @account.sp_payment_links.pluck(:name, :id)
    @payment_options << ["", ""]
    @payment_options = @payment_options.reverse
  end

  # GET /clients/1/edit
  def edit
    @payment_options = @account.sp_payment_links.pluck(:name, :id)
    @payment_options << ["", ""]
    @payment_options = @payment_options.reverse
  end

  # POST /clients
  def create
    @client = Client.new(client_params)
    # @client.account_id = current_account.id
    if @client.save
      @client.update(account_id: current_account.id)
      # ClientProfile.create!(client_id: @client.id)
      redirect_to clients_path, notice: "Client was successfully created."
    else
      @payment_options = @account.sp_payment_links.pluck(:name, :id)
      @payment_options << ["", ""]
      @payment_options = @payment_options.reverse
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to @client, notice: "Client was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def message_index_update
    if @client.update(client_params)
      redirect_to clients_path, notice: "Message to #{@client.first_name} has been updated!"
    else
      render clients_path, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    redirect_to clients_url, notice: "Client was successfully destroyed."
  end

  private

  def set_account 
    @account = current_account
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def client_params
    params.require(:client).permit(
      :first_name, 
      :last_name, 
      :email, 
      :phone_number,
      :preferred_contact_method,
      client_profiles_attributes: [
        :id, 
        :account_id,
        :address1, 
        :address2, 
        :city, 
        :state, 
        :zip_code,
        :reminder_message,
        :payment_option,
        :dollar_amount,
        :_destroy
      ]
    )
  end

  def verify_ownership
    check_user_permission(@client)
  end
end
