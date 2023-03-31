class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/task-lists" do
    task_lists = TaskList.all.order(important: :desc, urgent: :desc)
    task_lists.to_json(include: :tasks)
  end

  post "/task-lists" do
    task_list = TaskList.create(
      name: params[:name],
      important: params[:important],
      urgent: params[:urgent],
      complete: params[:complete]
    )
    task_list.to_json(include: :tasks)
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

  patch "/task-lists/name/:id" do 
    task_list = TaskList.find(params[:id])
    task_list.update(
      name: params[:name]
    )
    task_list.to_json
  end

  delete "/tasks/:id" do 
    task = Task.find(params[:id])
    task.destroy
    task.to_json
  end

  patch "/tasks/importance/:id" do 
    task = Task.find(params[:id])
    task.update(
      important: params[:important]
    )
    task.to_json
  end

  patch "/tasks/urgency/:id" do 
    task = Task.find(params[:id])
    task.update(
      urgent: params[:urgent]
    )
    task.to_json
  end

  patch "/tasks/complete/:id" do 
    task = Task.find(params[:id])
    task.update(
      complete: params[:complete]
    )
    task.to_json
  end

  patch "/tasks/name/:id" do 
    task = Task.find(params[:id])
    task.update(
      name: params[:name]
    )
    task.to_json
  end

end
