class AnswersController < ApplicationController
  before_action :set_question!
  before_action :set_answer!, except: :create


  def update
    if @answer.update(answer_params) # если ошибок нет, обновить в базе
      flash[:success] = "Answer updated!"
      redirect_to question_path(@question)
    else
      render :edit # опять рендерить форму new если есть ошибка (валидация)
    end
  end



  def edit

  end

  def create
    #render plain: params
    @answer = @question.answers.build answer_params #создаваеый ответ привязываем к вопросу

    if @answer.save
      flash[:success] = "Answer created!"
      redirect_to question_path(@question)  # переход на страницу конктретного вопроса
    else
      @answers = @question.answers.order created_at: :desc #просто render нельзя т.к.
      render 'questions/show'                   # в экшене используется @answers 
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = "Answer deleted!"
    redirect_to question_path(@question)
  end


  private

  def answer_params
    params.require(:answer).permit(:body) # даем разр на заполн опр полей
  end

  def set_question!
    @question = Question.find params[:question_id] # если указан несущ id, то в главн контр обр ошибка
  end 

  def set_answer!
    @answer = @question.answers.find params[:id] #из вопроса дост все ответы и нужный отв
  end


end

