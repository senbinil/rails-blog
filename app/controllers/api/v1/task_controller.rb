# frozen_string_literal: true

module Api
  module V1
    class TaskController < ApplicationController
      def index
        render json: Task.all
      end

      def show
        render json: @task
      end

      def create
        task = Task.new(task_params)
        if task.save
          render json: { task: }, status: :ok
        else
          render json: { error: task.errors.full_message }, status: :unprocessable_entity
        end
      end

      def update
        if task.update(task_params)
          render json: { status: :success, task: @task }, status: :ok
        else
          render json: { error: true }, status: :unprocessable_entity
        end
      end

      private

      def find_task
        @task = Task.find(params[:id])
      end

      def task_params
        params.require(:task).permit(:title, :status)
      end
    end
  end
end
