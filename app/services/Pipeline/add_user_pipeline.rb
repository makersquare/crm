class AddUserPipeline < TransactionScript
  def run(params)
    #Not bothering to check for data integrity here, we should control that
    # on the frontend
    user_id = params[:user_id]
    pipeline_id = params[:id].to_i
    if params[:pipeline_admin] == 'false'
      admin = 'false'
    else
      params[:pipeline_admin] == false ? admin = 'false' : admin = 'true'
    end
    return failure(:user_already_in_pipeline) unless PipelineUser.find_by(user_id: user_id, pipeline_id: pipeline_id).nil?

    begin
      pu = PipelineUser.create(user_id: user_id, pipeline_id: pipeline_id, admin: admin)
      pu_json = pu.as_json
      u_json = pu.user.as_json
      pu_json["user_data"] = sanitize_user_data(u_json)
      EmailSetting.create(pipeline_id: pipeline_id, user_id: user_id)
      return success(:data => pu_json)
    rescue
      return failure(:problem_adding_user)
    end
  end
end
