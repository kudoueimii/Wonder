class DropPosts < ActiveRecord::Migration[6.1]
  def change
    drop_table :posts do |t|
      t.text 'content', null: false
      t.text 'image'
      t.bigint 'user_id'
      t.bigint 'dog_id'

      t.timestamps
    end
  end
end
