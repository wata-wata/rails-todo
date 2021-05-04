class TasksController < ApplicationController
  def index   # get 'tasks'
    # 期限が近い順に並べる
    @tasks = Task.order('limit_date').all
    @status = ['todo', 'doing', 'done']
  end

  def store  # post 'tasks'
    # フォームからデータを受け取って保存する
    task = Task.new
    task.task       = params[:task]
    task.state      = params[:state]
    task.limit_date = params[:limit_date]
    task.save
    redirect_to '/tasks', notice: 'タスクを作成しました。'
  end

  def show  # get 'tasks/:id'
    # 選択されたタスクの詳細を表示する
    id = params[:id]
    @task = Task.find(id)
    @status = ['todo', 'doing', 'done']
  end  

  def update  # put 'tasks/:id' (更新)
    id = params[:id]
    task = Task.find(id)

    task.task = params[:task]
    task.state = params[:state]
    task.limit_date = params[:limit_date]
    task.save

    redirect_to '/tasks', notice: 'タスクを更新しました。'
  end

  def destroy  # delete 'tasks/:id'
    task = Task.find(params[:id])
    task.destroy
    redirect_to '/tasks', notice: 'タスクを削除しました。'
  end
end
