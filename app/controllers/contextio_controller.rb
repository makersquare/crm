class ContextioController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:callback]
#This controller is for the Contextio notification post
  def callback
    puts params
    ContextioApiScript.run(params)
    render nothing: true
  end
end
