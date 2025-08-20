class QuestListsController < ApplicationController
  before_action :set_quest_list, only: %i[ update destroy ]

  def index
    @quest_lists = QuestList.all.order(id: :asc)
    @quest_list = QuestList.new
  end

  def create
    @quest_list = QuestList.new(quest_list_params)

    respond_to do |format|
      if @quest_list.save
        format.turbo_stream
        format.html { redirect_to quest_lists_path, notice: "Quest list was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("form", partial: "form", locals: { quest_list: @quest_list }) }
      end
    end
  end


  def update
    respond_to do |format|
      if @quest_list.update(quest_list_params)
        format.turbo_stream
        format.html { redirect_to quest_lists_path, notice: "Quest list was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
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
      @quest_list = QuestList.find(params[:id])
    end

    def quest_list_params
      params.require(:quest_list).permit(:title, :completed)
    end
end
