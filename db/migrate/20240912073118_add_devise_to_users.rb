# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.2]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      # Remove the line for email if it already exists
      # t.string :email,              null: false, default: ""

      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # Uncomment if needed
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # Uncomment if needed
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # Uncomment if needed
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    # Indexes
    # Add indexes only if they do not already exist
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    # Removing columns and indexes
    change_table :users do |t|
      # t.remove :email # Only if you want to remove it as well
      t.remove :encrypted_password
      t.remove :reset_password_token
      t.remove :reset_password_sent_at
      t.remove :remember_created_at
      # Uncomment if needed
      # t.remove :sign_in_count
      # t.remove :current_sign_in_at
      # t.remove :last_sign_in_at
      # t.remove :current_sign_in_ip
      # t.remove :last_sign_in_ip
      # t.remove :confirmation_token
      # t.remove :confirmed_at
      # t.remove :confirmation_sent_at
      # t.remove :unconfirmed_email
      # t.remove :failed_attempts
      # t.remove :unlock_token
      # t.remove :locked_at
    end

    remove_index :users, :email if index_exists?(:users, :email)
    remove_index :users, :reset_password_token if index_exists?(:users, :reset_password_token)
    # remove_index :users, :confirmation_token if index_exists?(:users, :confirmation_token)
    # remove_index :users, :unlock_token if index_exists?(:users, :unlock_token)
  end
end
