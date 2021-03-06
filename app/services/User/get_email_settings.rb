class GetEmailSettings < TransactionScript
  def run(params)
    user = User.find(params[:user_id])
    email_settings = user.email_settings

    data = email_settings.map do |email_setting|
      pipeline = email_setting.pipeline
      email_setting.serializable_hash.merge(pipeline_name: pipeline.name)
    end

    data.sort_by!{ |setting| setting["id"] }
  end
end
