class CreateSeenAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :seen_announcements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :announcement, null: false, foreign_key: true
      t.boolean :seen

      t.timestamps
    end
  end
end
