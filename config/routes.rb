Sibcpea::Application.routes.draw do

  resources :documentos

  resources :asesorias do
    get 'reporte', :on => :collection
    post 'genera_reporte', :on => :collection
  end

  resources :carreras

  match 'home/index' => 'home#index', :as => :home

  resources :calendario_recursos

  resources :recursos_laboratorio

  resources :laboratorios
  match 'laboratorios/:id/semana/:numero_semana' => 'laboratorios#semana'

  resources :fechas_entrega

  resources :calendarios_entrega

  resources :avances_programaticos do
    get 'reporte', :on => :collection
    post 'genera_reporte', :on => :collection
  end

  resources :registro_tutorias

  resources :aulas

  resources :asistencias

  resources :asistencia_grupos do
    post 'lista', :on => :collection
    get 'reporte', :on => :collection
    post 'genera_reporte', :on => :collection
  end

  resources :avisos do
    resources :comentarios, :except => :show
    post :consultar, :on => :collection
  end

  get "login" => "sesiones#new", :as => "login"
  get "logout" => "sesiones#destroy", :as => "logout"
  get "registro" => "usuarios#new", :as => "registro"

  root :to => "sesiones#new"
#  match 'asistencia_grupos/:grupo/:materia/:day/:month/:year' => 'asistencia_grupos#lista'

  resources :sesiones

  resources :permisos

  resources :usuarios

  resources :calificaciones do
    get 'reporte', :on => :collection
    post 'genera_reporte', :on => :collection
  end

  resources :tutorias do
    get 'reporte', :on => :collection
    post 'genera_reporte', :on => :collection
  end

  resources :alumnos_ciclos

  resources :profesores_materias

  resources :profesores_ciclos

  resources :grupos

  resources :egresados do
    get :definir, :on => :collection
    post :egresar, :on => :collection
    get :lista, :on => :collection
  end

  resources :materias

  resources :semestres

  resources :generaciones

  resources :profesores do
    get :lista_imprimir, :on => :collection
  end

  resources :ciclos

  resources :institutos

  resources :alumnos do
    get :lista_imprimir, :on => :collection
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
