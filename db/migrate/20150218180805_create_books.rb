class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :one_liner
      t.string :cover_url
      t.string :summary

      t.timestamps null: false
    end
  end
end
