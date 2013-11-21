class JtestsController < ApplicationController
  include TopicsHelper

  def new
    @jtest = Jtest.new
    @surveys = Survey.where(topic_id: topic_ids)
  end

  def create
	@jtest = Jtest.new(jtest_params)
  	@jtest.user_id = current_user.id
  	if @jtest.save
  	  session[:jtest_id] = @jtest.id
  	  session[:survey_id] = @jtest.survey_id
	  redirect_to testing_url  
  	else
  	  flash[:danger] = 'Ups!!!'
  	  render 'new'		
  	end	
  end

  def testing
  	@survey = Survey.find(session[:survey_id])
  	@quests = @survey.questions.order('random()').limit(@survey.number_of_quesitons)
  end

private
  	
  def jtest_params
    params.require(:jtest).permit(:survey_id)
  end


end
