class AddTeacherIdToBadges < ActiveRecord::Migration
  def change
    add_reference :badges, :teacher, index: true, foreign_key: true
  end
end
