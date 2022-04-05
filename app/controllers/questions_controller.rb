class QuestionsController < ApplicationController

  def show
    @question = Question.find_by id: params[:id]
  end

  def destroy
    @question = Question.find_by id: params[:id]
    @question.destroy
    flash[:success] = "Question deleted"
    redirect_to questions_path
  end

  def edit
    @question = Question.find_by id: params[:id] #1-ый id: это поле по которому поиск
  end


  def update
    @question = Question.find_by id: params[:id] #1-ый id: это поле по которому поиск
    if @question.update(question_params) # если ошибок нет, обновить в базе
      flash[:success] = "Question updated!"
      redirect_to questions_path
    else
      render :edit # опять рендерить форму new если есть ошибка (валидация)
    end
  end

  def index
    @questions = Question.all
  end


  def new #отображает форму
    @question = Question.new #показывает форму,данные отпраляются в хеш парамс
  end


  def create #обрабатывает форму
    #render plain: params
    @question = Question.new(question_params)
    if @question.save # если ошибок нет, сохранить в базу
      flash[:success] = "Question created!"
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
