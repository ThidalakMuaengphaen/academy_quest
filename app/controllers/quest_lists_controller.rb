class QuestListsController < ApplicationController
  before_action :set_quest_list, only: %i[ show edit update destroy ]

  def index
    @quest_lists = QuestList.all.order(id: :asc)
    @quest_list = QuestList.new
  end

  def create
    @quest_list = QuestList.new(quest_list_params)

    respond_to do |format|
      if @quest_list.save
        format.turbo_stream
        format.html { redirect_to quest_list_path, notice: "Quest list was successfully created." }
      end
    end
  end

  def update
    respond_to do |format|
      if @quest_list.update(quest_list_params)
        format.turbo_stream
        format.html { redirect_to quest_list_path }
      end
    end
  end

  def destroy
    @quest_list.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to quest_lists_path, notice: "Quest list was successfully destroyed.", status: :see_other }
    end
  end

  private
    def set_quest_list
      @quest_list = QuestList.find(params.expect(:id))
    end


    def quest_list_params
      params.expect(quest_list: [ :title, :completed ])
    end
end
