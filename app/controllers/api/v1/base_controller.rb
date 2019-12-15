module Api
  module V1
    class BaseController < ApplicationController
      include Response
      include ExceptionRescueHelper
    end
  end
end