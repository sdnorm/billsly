class SpPaymentLinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account
  before_action :set_sp_payment_link, only: [:show, :edit, :update, :destroy]

  # GET /sp_payment_links
  def index
    @pagy, @sp_payment_links = pagy(@account.sp_payment_links.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @sp_payment_links.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @sp_payment_links.load

    @sp_payment_link = SpPaymentLink.new
  end

  # GET /sp_payment_links/1
  def show
  end

  # GET /sp_payment_links/new
  def new
    @sp_payment_link = SpPaymentLink.new
  end

  # GET /sp_payment_links/1/edit
  def edit
  end

  # POST /sp_payment_links
  def create
    @sp_payment_link = SpPaymentLink.new(sp_payment_link_params)

    if @sp_payment_link.save
      redirect_to @sp_payment_link, notice: "Sp payment link was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sp_payment_links/1
  def update
    if @sp_payment_link.update(sp_payment_link_params)
      redirect_to @sp_payment_link, notice: "Sp payment link was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /sp_payment_links/1
  def destroy
    @sp_payment_link.destroy
    redirect_to sp_payment_links_url, notice: "Sp payment link was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sp_payment_link
    @sp_payment_link = SpPaymentLink.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def sp_payment_link_params
    params.require(:sp_payment_link).permit(:name, :link, :account)
  end
end
