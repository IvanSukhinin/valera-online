class ValeraController < ApplicationController
  def set_valera
    @valera = Valera.where(user_id: current_user.id).first
    if @valera
      @valera.load_range_characteristics
      @valera.load_base_characteristics
    else
      @valera = Valera.new.with_id(current_user.id)
      @valera.save!
    end
  end

  def set_actions
    @actions = ValeraAction.all
  end

  def index
    redirect_to '/' and return unless defined? current_user.id

    set_valera
    set_actions
    image_name
    return unless defined? action_params['action_id']

    action = find_action
    @valera.action(action)
    # return unless @valera.dead?

    if @valera.dead?
      delete_valera
      redirect_to '/new_game' and return
    end

    write_action_to_history(action)
    update_characteristics
  end

  private

  def find_action
    ValeraAction.where(id: action_params['action_id'].to_i).first
  end

  def dead?; end

  def update_characteristics
    respond_to do |format|
      format.js if @valera.save
    end
  end

  def delete_valera
    ActionHistory.destroy_by(valera_id: @valera.id)
    Valera.destroy_by(id: @valera.id)
  end

  def write_action_to_history(action)
    @history = ActionHistory.new
    @history.valera_id = @valera.id
    @history.valera_action_id = action.id
    @history.save!
  end

  def clear_valera
    delete_all
  end

  # ????????????????????????????????????????????????
  def image_name
    @image = '1'
    # ????????????????????????????????????????????????
    @image = '2' if @valera.health < 50
    # ????????????????????????????????????????????????
    @image = '3' if @valera.health < 10
    # ??????
  end
  # ????????????????????????????????????????????????

  def action_params
    params.require(:valera).permit(:action_id)
  end
end
