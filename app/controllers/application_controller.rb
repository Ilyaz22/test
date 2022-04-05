class ApplicationController < ActionController::Base

  
  include ErrorHandling


  # rescue_from ActiveRecord::RecordNotFound, with: :notfound #обрабат ошибку не найден методом notfound

  # private

  # def notfound(exception) #метод принимает ошибку
  #   logger.warn exception # записывает в журнал рельс эту ошибку
  #   render file: 'public/404.html' , status: :not_found, layout: false # не использует лейаут

  # end


end
