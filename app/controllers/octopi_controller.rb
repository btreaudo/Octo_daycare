class OctopiController < ApplicationController
  before_action :set_octopus, only: [:show, :edit, :update, :destroy]

  # GET /octopi
  # GET /octopi.json
  def index
    @breeds = Breed.all
    breed_ids = params[:breed_ids]
    if params[:search]
      @octopi = Octopus.where("name LIKE ?", "%#{params[:search]}%")
        if @octopi.size.zero?
        flash[:notice] = "No result found"
        @octopi = Octopus.all
      end
  elsif params[:breed_ids]
    @octopi = Octopus.where(breed_id: params[:breed_ids])
            if @octopi.size.zero?
        flash[:notice] = "There are no breeds of this kind"
        @octopi = Octopus.all
      end
        else
      @octopi = Octopus.all
    end
  end


  # GET /octopi/1
  # GET /octopi/1.json
  def show
  end

  # GET /octopi/new
  def new
    @octopus = Octopus.new
  end

  # GET /octopi/1/edit
  def edit
  end

  # POST /octopi
  # POST /octopi.json
  def create
    @octopus = Octopus.new(octopus_params)

    respond_to do |format|
      if @octopus.save
        format.html { redirect_to @octopus, notice: 'Octopus was successfully created.' }
        format.json { render :show, status: :created, location: @octopus }
      else
        format.html { render :new }
        format.json { render json: @octopus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /octopi/1
  # PATCH/PUT /octopi/1.json
  def update
    respond_to do |format|
      if @octopus.update(octopus_params)
        format.html { redirect_to octopi_path, notice: 'Octopus was successfully updated.' }
        format.json { render :show, status: :ok, location: @octopus }
      else
        format.html { render :edit }
        format.json { render json: @octopus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /octopi/1
  # DELETE /octopi/1.json
  def destroy
    @octopus.destroy
    respond_to do |format|
      format.html { redirect_to octopi_url, notice: 'Octopus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_octopus
      @octopus = Octopus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def octopus_params
      params.require(:octopus).permit(:name, :owner_id, :breed_id, :dob, :vet_name, :vet_phone, :in_daycare, :avatar)
    end
end
