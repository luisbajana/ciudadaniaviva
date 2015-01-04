class DirectoriesController < ApplicationController
  # GET /directories
  # GET /directories.json

  before_filter :auth_user, :except => [:index, :show]

  def index
    @directories = Directory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @directories }
    end
  end


  def locations_per_directory(directory)
    @location = Location.find_all_by_directory_id(directory)
    @location.count
  end
  helper_method :locations_per_directory


  
  # GET /directories/1
  # GET /directories/1.json
  def show
    @directory = Directory.find(params[:id])
    @locations = Location.find_all_by_directory_id(@directory.id)

    
    @json = Location.find_all_by_directory_id(@directory.id).to_gmaps4rails do |search, marker|         
         marker.infowindow render_to_string(:partial => "/causes/infoWindow", :locals => { :address => search.address })      
         marker.picture({
           :picture => "../assets/marker.png",
           :width   => 36,
           :height  => 54
         })
      end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @directory }
    end
  end

  # GET /directories/new
  # GET /directories/new.json
  def new
    @directory = Directory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @directory }
    end
  end

  # GET /directories/1/edit
  def edit
    @directory = Directory.find(params[:id])
  end


  def create_directory
    @directory = Directory.create([{ :name=>params[:name],:category=>params[:category], :user_id=>current_user.id }])
    render :json => @directory
  end
  helper_method :create_directory

  
  def create
    @directory = Directory.new(params[:directory])
    @directory.user_id = current_user.id;

    respond_to do |format|
      if @directory.save
        format.html { redirect_to :controller => 'locations', :action=>'new' , :directory_id => @directory, notice: 'Directory was successfully created.' }
        format.json { render json: @directory, status: :created, location: @directory }
      else
        format.html { render action: "new" }
        format.json { render json: @directory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /directories/1
  # PUT /directories/1.json
  def update
    @directory = Directory.find(params[:id])

    respond_to do |format|
      if @directory.update_attributes(params[:directory])
        format.html { redirect_to @directory, notice: 'Directory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @directory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directories/1
  # DELETE /directories/1.json
  def destroy
    @directory = Directory.find(params[:id])
    @directory.destroy

    respond_to do |format|
      format.html { redirect_to directories_url }
      format.json { head :no_content }
    end
  end
end
