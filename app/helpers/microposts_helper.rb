module MicropostsHelper
  def choose_new_or_edit
    if action_name == 'new' or action_name == 'confirm'
      confirm_microposts_path
    elsif action_name == 'edit'
      micropost_path
    end
  end
end
