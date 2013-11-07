class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def home
    @slider = Dimage.where(flag: 'для домашньої сторінки')    
  end

end
