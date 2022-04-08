class AnswersController < ApplicationController
  before_action :set_question!

  def create
    #render plain: params
    @answer = @question.answers.build answer_params #создаваеый ответ привязываем к вопросу

    if @answer.save
      flash[:success] = "Answer created!"
      redirect_to questions_path(@question)  # переход на страницу конктретного вопроса
    else
      @answers = Answer.order created_at: :desc #сортировка по убыванию
      render 'questions/show'
    end
  end

  def destroy
    answer = @question.answers.find params[:id]
    answer.destroy
    flash[:success] = "Answer deleted!"
    redirect_to questions_path(@question)

  end


  private

  def answer_params
    params.require(:answer).permit(:body) # даем разр на заполн опр полей
  end

  def set_question!

  @question = Question.find params[:question_id] # если указан несущ id, то в главн контр обр ошибка

  end  


end

