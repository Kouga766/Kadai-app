Rails.application.routes.draw do
  get 'top' => 'homes#top'
  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'books' => 'books#create'
end