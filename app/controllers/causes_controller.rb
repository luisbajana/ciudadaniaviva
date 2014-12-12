class CausesController < ApplicationController
  # GET /causes
  # GET /causes.json

  before_filter :auth_user, :except => [:index, :show]

  def index
    @causes = Cause.order("id DESC").all
    #$twitter.update("@luisbajana Hola creador!")

    
    @json = Location.all.to_gmaps4rails do |search, marker|         
         marker.picture({
           :picture => "assets/marker.png",
           :width   => 36,
           :height  => 54
         })
      end

    @cause = Cause.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @causes }
    end
  end



  def num_supporters(cause)
    @supporters = Support.find_all_by_cause_id(cause)
    @supporters.count
  end
  helper_method :num_supporters


  def already_supporter(cause,user)
    @is_supporter = Support.find_by_cause_id(cause)

    if @is_supporter

      if @is_supporter.user_id == user
        return true
      else
        return false
      end  
    else
      return false
    end
     
  end
  helper_method :already_supporter


  def cause_id(name)
    @campaign = Cause.find_by_custom_url(name)
    @campaign.id
  end
  helper_method :cause_id



  def supporter(id)
    @user = User.find(id)
    @user
  end
  helper_method :supporter



  def show

    @cause = Cause.find_by_custom_url(params[:cause])
    @support = Support.new
    @supporters = Support.find_all_by_cause_id(@cause.id)

    @locations = Location.find_all_by_directory_id(@cause.dataset)
    

    @json = Location.find_all_by_directory_id(@cause.dataset).to_gmaps4rails do |search, marker|
         marker.infowindow render_to_string(:partial => "/causes/infoWindow", :locals => { :address => search.address })
         marker.picture({
           :picture => "assets/marker.png",
           :width   => 36,
           :height  => 54
         })
      end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cause }
    end
  end


  def detail
    @cause = Cause.find_by_title(params[:title])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cause }
    end
  end

  # GET /causes/new
  # GET /causes/new.json
  def new
    @cause = Cause.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cause }
    end
  end

  # GET /causes/1/edit
  def edit
    @cause = Cause.find(params[:id])
  end

  # POST /causes
  # POST /causes.json
  def create
    @cause = Cause.new(params[:cause])
    @cause.user_id = current_user.id;

    respond_to do |format|
      if @cause.save
        format.html { redirect_to '/'+@cause.custom_url, notice: '¡Genial! tu causa fué creada, ahora a ¡difundirla!' }
        format.json { render json: @cause, status: :created, location: @cause }
      else
        format.html { render action: "new" }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /causes/1
  # PUT /causes/1.json
  def update
    @cause = Cause.find(params[:id])

    respond_to do |format|
      if @cause.update_attributes(params[:cause])
        format.html { redirect_to '/'+@cause.custom_url, notice: '¡Genial! fué actualizado con éxito' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /causes/1
  # DELETE /causes/1.json
  def destroy
    @cause = Cause.find(params[:id])
    @cause.destroy

    respond_to do |format|
      format.html { redirect_to causes_url }
      format.json { head :no_content }
    end
  end
end
