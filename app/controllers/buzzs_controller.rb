class BuzzsController < ApplicationController
  before_action :set_buzz, only: [:show, :edit, :update, :destroy]

  # GET /buzzs
  # GET /buzzs.json
  def index
    @buzzs = Buzz.all
  end

  # GET /buzzs/1
  # GET /buzzs/1.json
  def show
  end

  # GET /buzzs/new
  def new
    @buzz = Buzz.new
  end

  # GET /buzzs/1/edit
  def edit
  end

  # POST /buzzs
  # POST /buzzs.json
  def create
    @buzz = Buzz.new(buzz_params)

    respond_to do |format|
      if @buzz.save
        format.html { redirect_to @buzz, notice: 'Buzz was successfully created.' }
        format.json { render :show, status: :created, location: @buzz }
      else
        format.html { render :new }
        format.json { render json: @buzz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buzzs/1
  # PATCH/PUT /buzzs/1.json
  def update
    respond_to do |format|
      if @buzz.update(buzz_params)
        format.html { redirect_to @buzz, notice: 'Buzz was successfully updated.' }
        format.json { render :show, status: :ok, location: @buzz }
      else
        format.html { render :edit }
        format.json { render json: @buzz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buzzs/1
  # DELETE /buzzs/1.json
  def destroy
    @buzz.destroy
    respond_to do |format|
      format.html { redirect_to buzzs_url, notice: 'Buzz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buzz
      @buzz = Buzz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buzz_params
      params.require(:buzz).permit(:post)
    end
end
