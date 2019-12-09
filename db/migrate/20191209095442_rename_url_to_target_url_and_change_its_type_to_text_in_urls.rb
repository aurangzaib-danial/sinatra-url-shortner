class RenameUrlToTargetUrlAndChangeItsTypeToTextInUrls < ActiveRecord::Migration[5.2]
  def change
    rename_column :urls, :url, :target_url
    change_column :urls, :target_url, :text
  end
end
