class QuestionsController < ApplicationController

  def edit
    @question = Question.find_by id: params[:id]
    
  end

  def index
    @questions = Question.all
  end


  def new
    @question = Question.new #показывает форму,данные отпраляются в хеш парамс
  end


  def create
    #render plain: params
    @question = Question.new(question_params)
    if @question.save # если ошибок нет
      redirect_to questions_path
    else
      render :new # опять рендерить форму new если есть ошибка (валидация)
    end
  end



  private

  def question_params
    params.require(:question).permit(:title, :body) # даем разр на заполн опр полей
  end

end
