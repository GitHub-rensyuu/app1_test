Rails.application.routes.draw do

  # topを初期画面にする。
  root to: "homes#top"

  resources :books, except:[:new]
  # resoucesで省略
    # get 'books'     => 'books#index'
    # get 'books/:id' => 'books#show'

    # post 'books' => 'books#create'
    # get 'books/:id/edit' => 'books#edit'
    # patch 'books/:id'  => 'books#update'
    # delete 'books/:id' => 'books#destroy'
  # get '/' => "homes#top", as :"root"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
