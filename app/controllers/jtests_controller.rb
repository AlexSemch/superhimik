class JtestsController < ApplicationController
  include TopicsHelper
  before_action :signed_in_user

  def new
    @jtest = Jtest.new
    if current_user.admin?
      @surveys = Survey.all
    elsif !Survey.where(topic_id: topic_ids, test_type: 'активний').empty?
      @surveys = Survey.where(topic_id: topic_ids, test_type: 'активний')
    else
      flash[:warning] = 'На жаль, для Вас тестових завданнь ще немає'
      redirect_to root_path
    end

  end

  def create
	@jtest = Jtest.new(jtest_params)
  	@jtest.user_id = current_user.id
    @jtest.score = 0.0
  	if @jtest.save
  	  session[:jtest_id] = @jtest.id
  	  redirect_to testing_url
  	else
  	  flash[:danger] = 'Ups!!!'
  	  render 'new'		
  	end	
  end

  def testing
    if session[:jtest_id]
      @jtest = Jtest.find(session[:jtest_id])
      session[:jtest_id] = nil
      @survey = Survey.find(@jtest.survey_id)
      @quests = @survey.random_questions
    else
      flash[:warning] = "Оберіть спочатку тест!"
      redirect_to start_path
    end

  end

  def end_testing
    result = params.require(:testing).permit(:jtest_id, quesiton_attributes: [:question_id, answer_attributes: [:answer_id]])
    @jtest = Jtest.find(result[:jtest_id])
    @jtest.score =  calculate_scores(result)
    if @jtest.save
      session[:jtest_idf] = @jtest.id
      #flash[:success] = "<h1>Оцінка за тест становить #{@jtest.score}</h1>"
      redirect_to score_path
    end
  end

  def score
    @jtest = Jtest.find(session[:jtest_idf])
  end

  private
  	
  def jtest_params
    params.require(:jtest).permit(:survey_id)
  end

  def calculate_scores(result)

    score = 0.00
    count_quest = 0.00
    true_answer_ids = []
    result[:quesiton_attributes].each do |key, quest_attributes|
      real = []
      count_quest += 1
      ans = Answer.where(question_id: quest_attributes[:question_id], correct_answer: true)
      ans.each do |truanswer|
        real << truanswer.id
      end
      if (quest_attributes[:answer_attributes])
        quest_attributes[:answer_attributes].each do |key, answer_attributes|
          true_answer_ids << answer_attributes[:answer_id].to_i

        end
      end
      (true_answer_ids.sort == real.sort) ? (flag = true) : (flag = false)
      score += 1 if flag
      true_answer_ids = []
    end

    (score/count_quest) * 12

  end


end
