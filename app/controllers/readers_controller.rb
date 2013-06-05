class ReadersController < ApplicationController
 def new
   @reader = Reader.new
 end

 def create
   @reader = Reader.new(reader_params)
   if @reader.save
     redirect_to root_url, notice: "Reader register"
   else
     flash.now[:error] = "something went wrong"
     render :new
   end
 end

 private

 def reader_params
   params[:reader]
 #  params.require(:reader).permit(:email, :password, :password_confirmation)
 end

end
