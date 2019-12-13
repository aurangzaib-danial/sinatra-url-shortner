class AddTimestampsToUrls < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :urls, default: Time.now
    change_column_default :urls, :created_at, nil
    change_column_default :urls, :updated_at, nil
  end
end
