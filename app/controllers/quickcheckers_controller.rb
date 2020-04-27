class QuickcheckersController < ApplicationController
  before_action :set_quickchecker, only: [:show,:destroy]
  protect_from_forgery :except => [:destroy]


  # GET /quickcheckers
  # GET /quickcheckers.json
  def index
    @quickcheckers = Quickchecker.all
  end
  
  # GET /quickcheckers/1
  # GET /quickcheckers/1.json
  def show
    @file_name = @quickchecker.file
  end

  # GET /quickcheckers/new
  def new
    @quickchecker = Quickchecker.new
  end

  # POST /quickcheckers
  # POST /quickcheckers.json
  def create

    @quickchecker = Quickchecker.new(quickchecker_params)
  
    url1 = params[:quickchecker][:url1]
    url2 = params[:quickchecker][:url2]
    url3 = params[:quickchecker][:url3]
    
    url_field = @quickchecker.countUrl(url2,url3)
    
    info = @quickchecker.validate_this(url1,url2,url3)
    
    #Check if one or more websites are valid
    if  url_field == info[0].count/4 
      
      @quickchecker.update(:info =>  info[0])
      @quickchecker.update(:file =>  info[1])
      
      #When the user insert the website3 and leave the website2 empty
      if (url2 == '') && (url3 != '')
          @quickchecker.update(:url2 =>  url3)
      end
     
        respond_to do |format|
          if @quickchecker.save
            format.html { redirect_to @quickchecker, notice: 'Quickchecker was successfully created.' }
            format.json { render :show, status: :created, location: @quickchecker }
          else
            format.html { render :new }
            format.json { render json: @quickchecker.errors, status: :unprocessable_entity }
          end
        end
    else
        redirect_to :back, notice: "Website(s) invalid. Try again, please"
    end  
  end

  # DELETE /quickcheckers/1
  # DELETE /quickcheckers/1.json
  def destroy
    @quickchecker.destroy
    respond_to do |format|
      format.html { redirect_to quickcheckers_url, notice: 'Quickchecker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quickchecker
      @quickchecker = Quickchecker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quickchecker_params
      params.require(:quickchecker).permit(:url1, :url2, :url3, :info, :file)
    end
end
