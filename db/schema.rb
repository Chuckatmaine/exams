# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120612180109) do

  create_table "answers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "creator_id"
    t.text     "rationale"
    t.integer  "department_id"
  end

  create_table "content_areas", :force => true do |t|
    t.string   "name"
    t.integer  "department_id"
    t.integer  "creator_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "locked"
  end

  create_table "contentareas", :force => true do |t|
    t.string   "name"
    t.integer  "department_id"
    t.integer  "creator"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "creator_id"
    t.boolean  "locked"
    t.integer  "department_id"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "code"
  end

  create_table "exam_content_areas", :force => true do |t|
    t.integer  "exam_id"
    t.integer  "content_area_id"
    t.integer  "count"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "exam_courses", :force => true do |t|
    t.integer  "exam_id"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "exam_questions", :force => true do |t|
    t.integer  "exam_id"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "exams", :force => true do |t|
    t.string   "title"
    t.integer  "level"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "course_id"
    t.boolean  "available",      :default => false
    t.integer  "question_count"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "locked"
    t.integer  "department_id"
    t.integer  "creator_id"
  end

  create_table "levels", :force => true do |t|
    t.text     "learning_level"
    t.integer  "department_id"
    t.integer  "creator_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "question_answers", :force => true do |t|
    t.integer  "answer_id"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "is_correct"
  end

  add_index "question_answers", ["answer_id"], :name => "index_question_answers_on_answer_id"
  add_index "question_answers", ["question_id", "answer_id"], :name => "index_question_answers_on_question_id_and_answer_id", :unique => true
  add_index "question_answers", ["question_id"], :name => "index_question_answers_on_question_id"

  create_table "question_content_areas", :force => true do |t|
    t.integer  "question_id"
    t.integer  "content_area_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "question_courses", :force => true do |t|
    t.integer  "question_id"
    t.integer  "course_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.integer  "level"
    t.integer  "value"
    t.integer  "creator_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "available",          :default => true
    t.integer  "course_id"
    t.boolean  "locked",             :default => false
    t.integer  "category_id"
    t.integer  "answer_id"
    t.string   "learning_objective"
    t.integer  "department_id"
  end

  create_table "user_answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_answer_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "user_submits", :force => true do |t|
    t.integer  "user_id"
    t.integer  "exam_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                              :null => false
    t.string   "email",              :default => "",    :null => false
    t.string   "employee_number"
    t.boolean  "admin",              :default => false, :null => false
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "faculty",            :default => false
    t.integer  "department_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
