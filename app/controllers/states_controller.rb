class StatesController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :fetch_state, only: %i[show edit update destroy]

  def index
    @states = State.all
    render json: @states
  end

  def show
    render json: @state
  end

  def new
    @state = State.new
  end

  def create
    @state = State.new(state_params)
    return render json: @state if @state.save
    
    render json: @state.errors
  end

  def edit; end

  def update
    return render json: @state if @state.update(state_params)

    render json: @state.errors
  end

  def destroy
    render json: {message: "Deleted successfully"} if @state.destroy
  end

  private
  
  def state_params
    params.require(:state).permit(:name, :acronym)
  end

  def fetch_state
    @state = State.find(params[:id]) if params.fetch(:id, nil)
    @chef = Chef.find(params[:chef_id]) if params.fetch(:chef_id, nil)
    @state ||= @chef.state
  end
end