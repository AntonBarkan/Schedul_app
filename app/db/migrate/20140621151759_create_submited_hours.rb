class CreateSubmitedHours < ActiveRecord::Migration
  def change
    create_table :submited_hours do |t|
      t.time :week_start_date
      t.integer :user_id
      t.boolean :Sunday_morning
      t.boolean :Sunday_evening
      t.boolean :Sunday_night
      t.boolean :Monday_morning
      t.boolean :Monday_evening
      t.boolean :Monday_night
      t.boolean :Tuesday_morning
      t.boolean :Tuesday_evening
      t.boolean :Tuesday_night
      t.boolean :Wednesday_morning
      t.boolean :Wednesday_evening
      t.boolean :Wednesday_night
      t.boolean :Thursday_morning
      t.boolean :Thursday_evening
      t.boolean :Thursday_night
      t.boolean :Friday_morning
      t.boolean :Friday_evening
      t.boolean :Friday_night
      t.boolean :Saturday_morning
      t.boolean :Saturday_evening
      t.boolean :Saturday_night

      t.timestamps
    end
  end
end
