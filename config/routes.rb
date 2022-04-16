# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :file_uploaders

  root to: 'file_uploaders#index'
  get '/:short_url' => 'file_uploaders#download'
end
