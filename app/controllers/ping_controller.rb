class PingController < ApplicationController
  def new
  end

  def create
    obj = S3_BUCKET.objects['photo-ping']
    @file = Rails.root + "app/assets/ping.txt"
    
    obj.write(
      file: @file,
      acl: :public_read
      )
    
    @ping = Ping.new(
      url: obj.public_url,
      name: obj.key
      )
      
    if @ping.save
      redirect_to new_ping_path
      flash[:success] = "You've sent calibration request through the interwebs.... standby"
    else
      flash.now[:danger] = "Something went wrong, let's see.."
      render :new
    end
      
  end
  
  def index
    
  end
  
  
end
