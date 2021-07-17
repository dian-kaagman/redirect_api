class CreateRedirects < ActiveRecord::Migration[6.1]
  def change
    create_table :redirects do |t|
      t.string :url, :null => false

      t.timestamps
    end
  end
end
