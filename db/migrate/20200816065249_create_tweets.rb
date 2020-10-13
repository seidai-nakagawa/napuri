class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :text
      t.string :image
      t.string :video
      t.references :comment, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
