class QuotationsController < ApplicationController
  before_action :set_quotation, only: %i[ show edit update destroy update_second_half  ]

  # GET /quotations or /quotations.json
  def index
    @quotations = Quotation.all
  end

  # GET /quotations/1 or /quotations/1.json
  def show
  end

  # GET /quotations/new
  def new
    @quotation = Quotation.new
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations or /quotations.json
  def create
    @quotation = Quotation.new(quatation_params)
    if @quotation.save
      @quotation.build_premium_calculation
      calculate_premium
    end
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  # PATCH/PUT /quotations/1 or /quotations/1.json
  def update
    if @quotation.update(quatation_params)
      calculate_premium
    end
    respond_to do |format|
      format.js { render 'create.js.erb', layout: false }
    end
  end

  # DELETE /quotations/1 or /quotations/1.json
  def destroy
    @quotation.destroy

    respond_to do |format|
      format.html { redirect_to quotations_url, notice: "Quotation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def calculate_premium
    prime_avant_tax = (((@quotation.municiple_evaluation_of_property-(500000))/1000)*(1.17))+320
    @quotation&.premium_calculation&.prime_avant_tax = prime_avant_tax
    emission_fees = 20
    @quotation&.premium_calculation&.emission_fees = emission_fees
    tax = ((prime_avant_tax)*9)/100
    @quotation&.premium_calculation&.tax = tax
    @quotation_premium = prime_avant_tax + emission_fees + tax
    @quotation.premium_calculation.save
    @quotation&.build_quotation_transaction unless @quotation&.quotation_transaction.present?
    @quotation&.build_property_legal_description unless @quotation&.property_legal_description.present?
    @quotation&.build_property_information unless @quotation&.property_information.present?
    @quotation&.build_note unless @quotation&.note.present?
  end

  def update_second_half
    respond_to do |format|
      if @quotation.update(quatation_params)
        format.js { render layout: false }
      else
        format.js { render 'create.js.erb', layout: false }
      end
    end
  end

  def thank_you
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quatation_params
      params.require(:quotation).permit(:email, :first_name, :last_name, :address, :postal_code, :city, :phone, :province, :municiple_evaluation_of_property, quotation_transaction_attributes: [:language, :home_owner, :second_home_owner, :third_home_owner, :type_of_property, :present_owner, :purchase_date],
        property_legal_description_attributes: [:lot_number, :proprty_address, :postal_code, :city],
        property_information_attributes: [:bound_by_water, :ensure_municipal_water_sewer, :ensure_property, :client_knowledge],
        note_attributes: [:description, :referral_agent_name, :referral_agent_email],
        premium_calculation_attributes: [:prime_avant_tax, :emission_fees, :tax],
        request_callback_attributes: [:phone_number, :availability] )
    end
end
