# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileUploadersController, type: :controller do
  let(:user) { create(:user) }
  let(:file_uploader) { create(:file_uploader, short_url: ShortUrlService.generate_short_url) }

  describe 'GET /index' do
    context 'will be redirected' do
      it 'To login if unauthenticated' do
        get :index
        expect_to_be_a_redirect
        expect(response).to redirect_to '/users/sign_in'
      end

      it 'To home path if authenticated' do
        sign_in user
        get :index
        expect_to_be_success
      end
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      sign_in user
      get :show, params: { id: file_uploader.id }
      expect_to_be_success
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      sign_in user
      get :new
      expect_to_be_success
    end
  end

  describe 'POST /create' do
    it 'renders a successful response' do
      sign_in user
      file_uploader
      current_count = FileUploader.count
      post :create, params: { file_uploader: { title: 'test', description: 'test expansion', user_id: user.id } }
      expect_to_be_a_redirect
      expect(FileUploader.count).to be > current_count
    end
  end

  describe 'POST /destroy' do
    it 'renders a successful response' do
      sign_in user
      file_uploader
      current_count = FileUploader.count
      delete :destroy, params: { id: file_uploader.id }
      expect_to_be_a_redirect
      expect(FileUploader.count).to be < current_count
    end
  end

  describe 'GET /download' do
    it 'able to download once short_url provided' do
      sign_in user
      file_uploader.file_data.attach(io: File.open(Rails.root.join('spec/helpers/assets/image.jpg')),
                                     filename: 'image.jpg')
      get :download, params: { short_url: file_uploader.short_url }
      expect_to_be_a_redirect
    end
  end
end
