class ValeraActionController < ApplicationController
  def new
    @valera_action_form = ValeraActionForm.new
  end

  def create
    @valera_action_form = ValeraActionForm.new(valera_action_form_params)
    if @valera_action_form.save
      redirect_to action_url, notice: "#{@valera_action_form.name} has been created"
    else
      render :new
    end
  end

  private

  def valera_action_form_params
    params.require(:valera_action_form).permit(:name, :description, :health, :mana, :cheerfulness, :fatigue, :money)
  end
end
