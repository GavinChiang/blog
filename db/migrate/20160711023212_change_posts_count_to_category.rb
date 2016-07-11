class ChangePostsCountToCategory < ActiveRecord::Migration
  def change
  	change_column :categories, :posts_count, :integer, default: 0
  end
end
