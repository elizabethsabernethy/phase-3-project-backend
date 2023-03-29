class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/task-lists" do
    task_lists = TaskList.all 
    task_lists.to_json(include: :tasks)
  end

  post "/task-lists" do
    task_list = TaskList.create(
      name: params[:name],
      important: params[:important],
      urgent: params[:urgent],
      complete: params[:complete]
    )
    task_list.to_json
  end

  post "/tasks" do
    task = Task.create(
      name: params[:name],
      important: params[:important],
      urgent: params[:urgent],
      complete: params[:complete],
      task_list_id: params[:task_list_id]
    )
    task.to_json
  end

  delete "/task-lists/:id" do 
    task_list = TaskList.find(params[:id])
    task_list.destroy
    task_list.to_json(include: :tasks)
  end

  patch "/task-lists/importance/:id" do 
    task_list = TaskList.find(params[:id])
    task_list.update(
      important: params[:important]
    )
    task_list.to_json
  end

  patch "/task-lists/urgency/:id" do 
    task_list = TaskList.find(params[:id])
    task_list.update(
      urgent: params[:urgent]
    )
    task_list.to_json
  end

  delete "/tasks/:id" do 
    task = Task.find(params[:id])
    task.destroy
    task.to_json
  end

  # patch '/bakeries/:id' do
  #   bakery = Bakery.find(params[:id])
  #   bakery.update(
  #     name: params[:name]
  #   )
  #   bakery.to_json
  # end

  # delete '/baked_goods/:id' do
  #   baked_good = BakedGood.find(params[:id])
  #   baked_good.destroy
  #   baked_good.to_json
  # end

end
