Rails.application.routes.draw do
  get 'top' => 'homes#top'
  get 'books/index'

  get 'books/new'
  get 'books/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'books' => 'books#create'
  get 'books' => 'books#index'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  get 'books/:id/:createdflag' => 'books#show', as: 'show_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end