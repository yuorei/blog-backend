# app/controllers/blogs_controller.rb
require "google/cloud/firestore"

class BlogsController < ApplicationController
    def handle_foo
      collection_path = "blog" # コレクション名を指定します
      users_ref = FIRESTORE.col collection_path
      users_ref.get do |blog|
        #puts "#{blog.document_id} data: #{blog.data}."
      end
  
      # Firestoreからデータを取得
      collection = FIRESTORE.col collection_path
      documents = collection.get
  
      # レスポンスのJSONを作成
      results = documents.map(&:data)
  
      # JSONをクライアントに返す
      render json: results
    rescue => e
      render json: { error: "Failed to retrieve documents: #{e.message}" }, status: :internal_server_error
    end
  end
  