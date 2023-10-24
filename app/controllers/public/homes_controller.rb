class Public::HomesController < ApplicationController
  def top
    @items = Item.order("RANDOM()").limit(4)
    @genres = Genre.all
  end
    # @user = current_user
#     @images = []
#     @image_slide_animation_array = []

# # # 画像のURL作成

#     10.times {|i| @images = @images << "cake.image/cake" + (i +1).to_s + ".jpg"}
    
# # # view用の配列作成

#     3.times {@image_slide_animation_array << { "image" => @images }}

#     p"---------------" 
#     p @image_slide_animation_array
#     p"---------------"
#   end

  def about
    @items = Item.order("RANDOM()")
  end
end
