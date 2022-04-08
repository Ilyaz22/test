class QuestionsController < ApplicationController

  before_action :set_question!, only: %i[show destroy edit update] #запускается первым

  def show
    @answer = @question.answers.build #привязываем образец класса answer, который будет
    # привязан к нашему вопросу

    @answers = Answer.order created_at: :desc #сортировка по убыванию
  end

  def destroy

    @question.destroy
    flash[:success] = "Question deleted"
    redirect_to questions_path
  end

  def edit
  
  end


  def update
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

  def set_question!

  #@question = Question.find_by id: params[:id]#1-ый id: это поле по которому поиск
  @question = Question.find params[:id] # если указан несущ id, то в главн контр обр ошибка

  end

end
