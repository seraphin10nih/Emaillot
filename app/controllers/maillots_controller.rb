class MaillotsController < ApplicationController
  before_action :set_maillot, only: [:show, :edit, :update, :destroy]

  # GET /maillots
  # GET /maillots.json
  def index
    @maillots = Maillot.all
  end

  # GET /maillots/1
  # GET /maillots/1.json
  def show
  end

  # GET /maillots/new
  def new
    @maillot = Maillot.new
  end

  # GET /maillots/1/edit
  def edit
  end

  # POST /maillots
  # POST /maillots.json
  def create
    @maillot = Maillot.new(maillot_params)

    respond_to do |format|
      if @maillot.save
        format.html { redirect_to @maillot, notice: 'Maillot was successfully created.' }
        format.json { render :show, status: :created, location: @maillot }
      else
        format.html { render :new }
        format.json { render json: @maillot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maillots/1
  # PATCH/PUT /maillots/1.json
  def update
    respond_to do |format|
      if @maillot.update(maillot_params)
        format.html { redirect_to @maillot, notice: 'Maillot was successfully updated.' }
        format.json { render :show, status: :ok, location: @maillot }
      else
        format.html { render :edit }
        format.json { render json: @maillot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maillots/1
  # DELETE /maillots/1.json
  def destroy
    @maillot.destroy
    respond_to do |format|
      format.html { redirect_to maillots_url, notice: 'Maillot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maillot
      @maillot = Maillot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maillot_params
      params.require(:maillot).permit(:title, :description, :price, :image_url)
    end
end
