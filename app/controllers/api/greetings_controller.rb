class Api::GreetingsController < ApplicationController
  before_action :log_request_headers
  before_action :log_user_id

  # GET /api/greetings
  def index
    render json: {message: "GET - Hello world!"}
  end

  # POST /api/greetings
  def create
    render json: {message: "POST - Hello world!"}
  end

  private

  def log_request_headers
    logger.debug "[DEBUG] Headers: #{request.headers.env.select{|k, _| k.in?(ActionDispatch::Http::Headers::CGI_VARIABLES) || k =~ /^HTTP_/}}"
  end

  def log_user_id
    #logger.debug "[DEBUG] user_id: #{cookies[:user_id]}"
    #logger.debug "[DEBUG] user_id: #{cookies.signed[:user_id]}"
    logger.debug "[DEBUG] user_id: #{cookies.encrypted[:user_id]}"
  end
end
