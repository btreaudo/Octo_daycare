class AddAttachmentAvatarToOctopi < ActiveRecord::Migration
  def self.up
    change_table :octopi do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :octopi, :avatar
  end
end
