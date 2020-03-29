class TopController < ApplicationController
  def index
    @message = "おはようございます！"
  end

  def about
  end
  
  def kanechanee
    @kanechanee = "Hello,World!"
  end
end
