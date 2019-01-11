class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :tweet
      t.references :user, foreign_key: true
      t.references :retweet, index: true, foreign_key: { to_table: :tweets }

      t.timestamps
    end
  end
end
