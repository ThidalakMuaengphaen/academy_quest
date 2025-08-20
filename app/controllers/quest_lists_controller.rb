class QuestListsController < ApplicationController
  before_action :set_quest_list, only: %i[ show edit update destroy ]

  # GET /quest_lists or /quest_lists.json
  def index
    @quest_lists = QuestList.all
  end

  # GET /quest_lists/1 or /quest_lists/1.json
  def show
  end

  # GET /quest_lists/new
  def new
    @quest_list = QuestList.new
  end

  # GET /quest_lists/1/edit
  def edit
  end

  # POST /quest_lists or /quest_lists.json
  def create
    @quest_list = QuestList.new(quest_list_params)

    respond_to do |format|
      if @quest_list.save
        format.html { redirect_to @quest_list, notice: "Quest list was successfully created." }
        format.json { render :show, status: :created, location: @quest_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quest_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quest_lists/1 or /quest_lists/1.json
  def update
    respond_to do |format|
      if @quest_list.update(quest_list_params)
        format.html { redirect_to @quest_list, notice: "Quest list was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @quest_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quest_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quest_lists/1 or /quest_lists/1.json
  def destroy
    @quest_list.destroy!

    respond_to do |format|
      format.html { redirect_to quest_lists_path, notice: "Quest list was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest_list
      @quest_list = QuestList.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def quest_list_params
      params.expect(quest_list: [ :title, :completed ])
    end
end
