class SessionsController < ApplicationController
  def create
    puts "[create]"

    puts params[:sessions][:name]
    puts params[:session][:password]

    outhuser = OuthUser.find_by(name:params[:sessions][:name])
    if outhuser && outhuser.authenticate(params[:sessions][:password])
      puts "[OK]"
      log_in outhuser
      puts current_user.name
      
      respond_to do |format|
        format.json{
          render :status => 200, :json => { :state => "Success", :user =>  current_user.name}.to_json
        }
      end
      #render json: '{state:"OK"}'
    else
      puts "[NG]"

      respond_to do |format|
        format.json{
          render :status => 401, :json => { :state => "Err", :user =>  ""}.to_json
        }
      end
      #render json: '{state:"NG"}'
    end
  end

  def islogin
    puts "[islogin]#{current_user}"
    if current_user !=nil
      puts "[OK]"

      respond_to do |format|
        format.json{
          render :status => 200, :json => { :state => "Success", :user =>  current_user.name}.to_json
        }
      end
    else
      puts "[NG]"
      
      respond_to do |format|
        format.json{
          render :status => 401, :json => { :state => "Err", :user =>  ""}.to_json
        }
      end
    end
  end

  def destroy
    puts "[destroy]"
    log_out
    respond_to do |format|
      format.json{
        render :status => 200, :json => { :state => "Logout", :user =>  ""}.to_json
      }
    end
  end
end
