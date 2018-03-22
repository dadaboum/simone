class AddCommentsToSurgeries < ActiveRecord::Migration[5.1]
  def change
    add_column :surgeries, :pre_comments, :text
    add_column :surgeries, :post_comments, :text
  end
end
