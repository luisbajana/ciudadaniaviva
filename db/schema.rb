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

ActiveRecord::Schema.define(:version => 20141206170848) do

  create_table "causes", :force => true do |t|
    t.string   "title"
    t.string   "dataset"
    t.text     "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "impact"
    t.string   "custom_url"
    t.integer  "goal"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
  end

  create_table "directories", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.string   "category"
    t.string   "url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  create_table "ecuador_agua_consumos", :force => true do |t|
    t.float    "minimoConsumo"
    t.float    "mediaConsumo"
    t.float    "maximoConsumo"
    t.float    "totalConsumo"
    t.float    "valorMinimo"
    t.float    "valorMedia"
    t.float    "valorMaximo"
    t.float    "minimoSierra"
    t.float    "minimoCosta"
    t.float    "minimoAmazonia"
    t.float    "mediaSierra"
    t.float    "mediaCosta"
    t.float    "mediaAmazonia"
    t.float    "maximoSierra"
    t.float    "maximoCosta"
    t.float    "maximoAmazonia"
    t.float    "metrosCubicosTotalesSierra"
    t.float    "metrosCubicosTotalesCosta"
    t.float    "metrosCubicosTotalesAmazonia"
    t.float    "valorMinimoSierra"
    t.float    "valorMinimoCosta"
    t.float    "valorMinimoAmazonia"
    t.float    "valorMediaSierra"
    t.float    "valorMediaCosta"
    t.float    "valorMediaAmazonia"
    t.float    "valorMaximoSierra"
    t.float    "valorMaximoCosta"
    t.float    "valorMaximoAmazonia"
    t.float    "valorTotalSierra"
    t.float    "valorTotalCosta"
    t.float    "valorTotalAmazonia"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "gs", :force => true do |t|
    t.string   "EcuadorConsumo"
    t.float    "minimoConsumo"
    t.float    "mediaConsumo"
    t.float    "maximoConsumo"
    t.float    "totalConsumo"
    t.float    "valorMinimo"
    t.float    "valorMedia"
    t.float    "valorMaximo"
    t.float    "minimoSierra"
    t.float    "minimoCosta"
    t.float    "minimoAmazonia"
    t.float    "mediaSierra"
    t.float    "mediaCosta"
    t.float    "mediaAmazonia"
    t.float    "maximoSierra"
    t.float    "maximoCosta"
    t.float    "maximoAmazonia"
    t.float    "metrosCubicosTotalesSierra"
    t.float    "metrosCubicosTotalesCosta"
    t.float    "metrosCubicosTotalesAmazonia"
    t.float    "valorMinimoSierra"
    t.float    "valorMinimoCosta"
    t.float    "valorMinimoAmazonia"
    t.float    "valorMediaSierra"
    t.float    "valorMediaCosta"
    t.float    "valorMediaAmazonia"
    t.float    "valorMaximoSierra"
    t.float    "valorMaximoCosta"
    t.float    "valorMaximoAmazonia"
    t.float    "valorTotalSierra"
    t.float    "valorTotalCosta"
    t.float    "valorTotalAmazonia"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "locations", :force => true do |t|
    t.float    "latitude"
    t.string   "longitude"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "directory_id"
    t.string   "gmaps"
    t.text     "description"
    t.text     "address"
    t.integer  "user_id"
  end

  create_table "partes", :force => true do |t|
    t.string   "tipo"
    t.string   "estado"
    t.string   "macpc"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "gmaps"
    t.integer  "user_id"
    t.integer  "factor_contaminante"
    t.float    "precio"
  end

  create_table "presupuestos", :force => true do |t|
    t.string   "tipo"
    t.string   "funcion"
    t.integer  "codigoSectorial"
    t.string   "sectorial"
    t.integer  "codigoGrupo"
    t.string   "grupo"
    t.decimal  "valor"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "supports", :force => true do |t|
    t.integer  "cause_id"
    t.integer  "user_id"
    t.string   "hour"
    t.string   "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "address"
  end

  create_table "sustancia", :force => true do |t|
    t.string   "nombre"
    t.float    "contenidoporcentual"
    t.float    "peso"
    t.integer  "eficienciareciclaje"
    t.text     "uso"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
