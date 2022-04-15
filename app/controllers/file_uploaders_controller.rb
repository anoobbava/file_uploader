# frozen_string_literal: true

#
# Class FileUploadersController provides the option to handle the files uploaded and its functionalities
#
# @author Anoob Bava <anoob.bava@gmail.com>
#
class FileUploadersController < ApplicationController
  before_action :set_file_uploader, only: %i[show edit update destroy]

  def index
    @file_uploaders = FileUploader.all
  end

  def show; end

  def new
    @file_uploader = FileUploader.new
  end

  def edit; end

  def create
    @file_uploader = FileUploader.new(file_uploader_params)
    respond_to do |format|
      if @file_uploader.save
        format.html { redirect_to file_uploader_url(@file_uploader), notice: 'File uploader was successfully created.' }
        format.json { render :show, status: :created, location: @file_uploader }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @file_uploader.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @file_uploader.update(file_uploader_params)
        format.html { redirect_to file_uploader_url(@file_uploader), notice: 'File uploader was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_uploader }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @file_uploader.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @file_uploader.destroy

    respond_to do |format|
      format.html { redirect_to file_uploaders_url, notice: 'File uploader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_file_uploader
    @file_uploader = FileUploader.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def file_uploader_params
    params.require(:file_uploader).permit(:title, :description, :user_id)
  end
end
