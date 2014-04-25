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

ActiveRecord::Schema.define(:version => 20140306135028) do

  create_table "admin_users", :force => true do |t|
    t.string   "first_name",       :default => "",    :null => false
    t.string   "last_name",        :default => "",    :null => false
    t.string   "role",                                :null => false
    t.string   "email",                               :null => false
    t.boolean  "status",           :default => false
    t.string   "token",                               :null => false
    t.string   "salt",                                :null => false
    t.string   "crypted_password",                    :null => false
    t.string   "preferences"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true

  create_table "api_keys", :force => true do |t|
    t.string  "digest"
    t.string  "secret"
    t.integer "user_id"
    t.string  "nonce"
  end

  create_table "associates", :force => true do |t|
    t.integer "user_id"
    t.decimal "part",         :precision => 8, :scale => 4
    t.string  "prefcurrency"
    t.string  "prefwallet"
    t.integer "monitor"
    t.integer "associate"
    t.integer "accountant"
    t.integer "support"
  end

  create_table "autolends", :force => true do |t|
    t.integer "user_id"
    t.integer "active"
    t.decimal "rate",     :precision => 16, :scale => 10
    t.integer "period"
    t.string  "currency"
    t.integer "insure"
  end

  create_table "bank_accounts", :force => true do |t|
    t.string  "template_name"
    t.string  "account_name"
    t.string  "account_number"
    t.string  "account_address"
    t.string  "bank_name"
    t.string  "bank_address"
    t.string  "swift"
    t.integer "default"
  end

  create_table "bitcoin_addresses", :force => true do |t|
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bitcoin_transactions", :force => true do |t|
    t.decimal  "amount",        :precision => 40, :scale => 8
    t.string   "status"
    t.integer  "time"
    t.string   "address"
    t.string   "txid"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "confirmations"
  end

  create_table "candlesticks", :force => true do |t|
    t.string   "pair"
    t.integer  "period"
    t.datetime "start_time"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.decimal  "open",       :precision => 16, :scale => 8
    t.decimal  "close",      :precision => 16, :scale => 8
    t.decimal  "highest",    :precision => 16, :scale => 8
    t.decimal  "lowest",     :precision => 16, :scale => 8
    t.decimal  "volume",     :precision => 40, :scale => 8
  end

  create_table "capitals", :force => true do |t|
    t.string   "key"
    t.decimal  "value",      :precision => 40, :scale => 8
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "client_applications", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "support_url"
    t.string   "callback_url"
    t.string   "key",          :limit => 40
    t.string   "secret",       :limit => 40
    t.integer  "user_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "client_applications", ["key"], :name => "index_client_applications_on_key", :unique => true

  create_table "compliances", :force => true do |t|
    t.integer  "user_id"
    t.string   "fullname"
    t.string   "address"
    t.string   "phone"
    t.string   "city"
    t.string   "country"
    t.string   "zipcode"
    t.string   "remark"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.datetime "id_expiration_date"
  end

  create_table "counterorders", :force => true do |t|
    t.string   "platform"
    t.decimal  "amount",          :precision => 40, :scale => 8
    t.decimal  "remainingamount", :precision => 40, :scale => 8
    t.decimal  "price",           :precision => 16, :scale => 8
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "countries", :force => true do |t|
    t.string  "country_name"
    t.integer "bank_account_id"
  end

  create_table "credits", :force => true do |t|
    t.string   "currency"
    t.decimal  "amount",      :precision => 40, :scale => 8
    t.string   "status"
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
    t.decimal  "rate",        :precision => 30, :scale => 20
    t.integer  "period"
    t.integer  "user_id"
    t.integer  "position_id"
    t.boolean  "renew"
    t.integer  "notify",                                      :default => 0
    t.integer  "insured"
  end

  create_table "dailyprofits", :force => true do |t|
    t.string   "currency"
    t.string   "key"
    t.decimal  "amount",            :precision => 40, :scale => 8
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.decimal  "profit_system",     :precision => 40, :scale => 8
    t.decimal  "profit_calculated", :precision => 40, :scale => 8
    t.decimal  "spread_pl",         :precision => 40, :scale => 8
    t.decimal  "total_curr_assets", :precision => 40, :scale => 8
    t.decimal  "surplus",           :precision => 40, :scale => 8
    t.decimal  "total_assets",      :precision => 40, :scale => 8
  end

  create_table "deposits", :force => true do |t|
    t.string   "currency"
    t.string   "method"
    t.text     "remark"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "user_id"
    t.string   "status"
    t.decimal  "amount",     :precision => 40, :scale => 8
  end

  create_table "egopay_transactions", :force => true do |t|
    t.decimal  "amount",     :precision => 30, :scale => 8
    t.string   "currency"
    t.decimal  "fee",        :precision => 20, :scale => 8
    t.string   "status"
    t.integer  "time"
    t.string   "type"
    t.string   "details"
    t.string   "tid"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "fees", :force => true do |t|
    t.integer "user_id"
    t.string  "description"
    t.decimal "value",       :precision => 20, :scale => 14
    t.string  "remarks"
  end

  create_table "ledger_entries", :force => true do |t|
    t.string   "currency",    :limit => 3
    t.decimal  "amount",                   :precision => 40, :scale => 8
    t.string   "description"
    t.decimal  "balance",                  :precision => 40, :scale => 8
    t.integer  "user_id"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

  create_table "litecoin_addresses", :force => true do |t|
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "litecoin_transactions", :force => true do |t|
    t.decimal  "amount",        :precision => 40, :scale => 8
    t.string   "status"
    t.integer  "time"
    t.string   "address"
    t.string   "txid"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "confirmations"
  end

  create_table "loans", :force => true do |t|
    t.string   "currency"
    t.decimal  "amount",     :precision => 30, :scale => 20
    t.string   "status"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.decimal  "rate",       :precision => 30, :scale => 20
    t.integer  "period"
    t.integer  "lender_id"
    t.integer  "loaner_id"
    t.boolean  "renew"
    t.integer  "notify",                                     :default => 0
    t.integer  "insured"
  end

  create_table "market_makers", :force => true do |t|
    t.integer "user_id"
    t.decimal "pricedistance",  :precision => 10, :scale => 8
    t.decimal "amount_insured", :precision => 40, :scale => 8
    t.string  "ref_currency"
  end

  create_table "oauth_nonces", :force => true do |t|
    t.string   "nonce"
    t.integer  "timestamp"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "oauth_nonces", ["nonce", "timestamp"], :name => "index_oauth_nonces_on_nonce_and_timestamp", :unique => true

  create_table "oauth_tokens", :force => true do |t|
    t.integer  "user_id"
    t.string   "type",                  :limit => 20
    t.integer  "client_application_id"
    t.string   "token",                 :limit => 40
    t.string   "secret",                :limit => 40
    t.string   "callback_url"
    t.string   "verifier",              :limit => 20
    t.string   "scope"
    t.datetime "authorized_at"
    t.datetime "invalidated_at"
    t.datetime "expires_at"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "oauth_tokens", ["token"], :name => "index_oauth_tokens_on_token", :unique => true

  create_table "offers", :force => true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.decimal  "amount",         :precision => 40, :scale => 8
    t.decimal  "originalamount", :precision => 40, :scale => 8
    t.string   "offertype"
    t.string   "currency"
    t.integer  "period"
    t.decimal  "rate",           :precision => 30, :scale => 20
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.boolean  "notify",                                         :default => false
    t.boolean  "renew",                                          :default => false
    t.integer  "insure"
    t.integer  "active"
  end

  create_table "offers_histories", :force => true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.decimal  "amount",         :precision => 40, :scale => 8
    t.decimal  "originalamount", :precision => 40, :scale => 8
    t.string   "offertype"
    t.string   "currency"
    t.integer  "period"
    t.decimal  "rate",           :precision => 30, :scale => 20
    t.boolean  "notify",                                         :default => false
    t.boolean  "renew",                                          :default => false
    t.integer  "insure"
    t.integer  "active"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  add_index "offers_histories", ["user_id"], :name => "index_offers_histories_on_user_id"

  create_table "offers_migrates", :force => true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.decimal  "amount",         :precision => 40, :scale => 8
    t.decimal  "originalamount", :precision => 40, :scale => 8
    t.string   "offertype"
    t.string   "currency"
    t.integer  "period"
    t.decimal  "rate",           :precision => 30, :scale => 20
    t.boolean  "notify",                                         :default => false
    t.boolean  "renew",                                          :default => false
    t.integer  "insure"
    t.integer  "active"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "type"
    t.string   "pair"
    t.string   "status"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.integer  "user_id"
    t.integer  "notify",                                         :default => 0
    t.decimal  "amount",         :precision => 40, :scale => 8
    t.decimal  "price",          :precision => 16, :scale => 8
    t.decimal  "originalamount", :precision => 40, :scale => 8
    t.string   "routing",                                        :default => ""
    t.integer  "lockedperiod"
    t.decimal  "trailingprice",  :precision => 8,  :scale => 4,  :default => 0.0
    t.boolean  "hidden",                                         :default => false
    t.integer  "vir",                                            :default => 1
    t.decimal  "maxrate",        :precision => 30, :scale => 20, :default => 0.0
    t.string   "placed_id"
    t.string   "placed_trades"
    t.integer  "nopayback"
    t.decimal  "avg_price",      :precision => 40, :scale => 20, :default => 0.0
    t.integer  "active"
  end

  add_index "orders", ["status"], :name => "status"

  create_table "orders_histories", :force => true do |t|
    t.string   "type"
    t.string   "pair"
    t.string   "status"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.integer  "user_id"
    t.integer  "notify",                                         :default => 0
    t.decimal  "amount",         :precision => 40, :scale => 8
    t.decimal  "price",          :precision => 16, :scale => 8
    t.decimal  "originalamount", :precision => 40, :scale => 8
    t.string   "routing",                                        :default => ""
    t.decimal  "trailingprice",  :precision => 8,  :scale => 4,  :default => 0.0
    t.boolean  "hidden",                                         :default => false
    t.integer  "vir",                                            :default => 1
    t.decimal  "maxrate",        :precision => 30, :scale => 20, :default => 0.0
    t.decimal  "avg_price",      :precision => 40, :scale => 20, :default => 0.0
    t.integer  "active"
  end

  add_index "orders_histories", ["user_id"], :name => "index_orders_histories_on_user_id"

  create_table "orders_migrates", :force => true do |t|
    t.string   "type"
    t.string   "pair"
    t.string   "status"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.integer  "user_id"
    t.integer  "notify",                                         :default => 0
    t.decimal  "amount",         :precision => 40, :scale => 8
    t.decimal  "price",          :precision => 16, :scale => 8
    t.decimal  "originalamount", :precision => 40, :scale => 8
    t.string   "routing",                                        :default => ""
    t.decimal  "trailingprice",  :precision => 8,  :scale => 4,  :default => 0.0
    t.boolean  "hidden",                                         :default => false
    t.integer  "vir",                                            :default => 1
    t.decimal  "maxrate",        :precision => 30, :scale => 20, :default => 0.0
    t.decimal  "avg_price",      :precision => 40, :scale => 20, :default => 0.0
    t.integer  "active"
  end

  create_table "positions", :force => true do |t|
    t.string   "pair"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
    t.decimal  "amount",        :precision => 40, :scale => 8
    t.decimal  "base",          :precision => 40, :scale => 8
    t.decimal  "swap",          :precision => 40, :scale => 8,  :default => 0.0
    t.integer  "noliquidation"
    t.integer  "period"
    t.integer  "vir"
    t.decimal  "maxrate",       :precision => 30, :scale => 20, :default => 0.0
  end

  add_index "positions", ["status", "user_id"], :name => "status"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "permalink"
    t.integer  "is_published"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "referrals", :force => true do |t|
    t.integer  "representative_id"
    t.integer  "referee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "earned_seven_days",  :precision => 40, :scale => 8
    t.decimal  "earned_thirty_days", :precision => 40, :scale => 8
    t.decimal  "earned_total",       :precision => 40, :scale => 8
  end

  create_table "representatives", :force => true do |t|
    t.integer  "user_id"
    t.string   "referrer_code"
    t.integer  "type"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "currency"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "settings", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stats", :force => true do |t|
    t.string   "key"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.decimal  "value",      :precision => 40, :scale => 8
  end

  create_table "tickers", :force => true do |t|
    t.string   "pair"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.decimal  "buying",     :precision => 16, :scale => 8
    t.decimal  "selling",    :precision => 16, :scale => 8
  end

  create_table "trades", :force => true do |t|
    t.string   "response"
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.decimal  "amount",     :precision => 40, :scale => 8
    t.decimal  "price",      :precision => 16, :scale => 8
    t.string   "platform"
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.string   "pair",                                      :default => "BTCUSD"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
    t.string   "timezone"
    t.string   "auth_secret"
    t.integer  "otp_enabled"
    t.integer  "notify_withdrawal",                                 :default => 1
    t.integer  "notify_deposit",                                    :default => 1
    t.integer  "agreed_tos"
    t.string   "prefcurrency"
    t.decimal  "margin_requirement", :precision => 16, :scale => 8
    t.decimal  "leverage",           :precision => 16, :scale => 8
    t.decimal  "overdraft_limit",    :precision => 16, :scale => 8
    t.string   "level",                                             :default => "deposit"
    t.string   "lastip"
    t.string   "currentip"
    t.integer  "locktocken"
    t.integer  "verified"
    t.integer  "no_withdraw"
    t.integer  "dest_tag"
  end

  create_table "variableinterests", :force => true do |t|
    t.string   "currency"
    t.decimal  "rate",              :precision => 30, :scale => 20
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.decimal  "amount",            :precision => 40, :scale => 8
    t.decimal  "avgperiod",         :precision => 40, :scale => 8
    t.decimal  "annual_volatility", :precision => 30, :scale => 20
  end

  create_table "walletbalances", :force => true do |t|
    t.integer "wallet_id"
    t.string  "currency"
    t.decimal "balance",            :precision => 40, :scale => 8, :default => 0.0
    t.decimal "unsettled_interest", :precision => 40, :scale => 8, :default => 0.0
  end

  add_index "walletbalances", ["wallet_id", "currency"], :name => "wallet_id"

  create_table "wallets", :force => true do |t|
    t.string  "wallettype"
    t.integer "user_id"
    t.string  "name"
  end

  create_table "withdrawal_methods", :force => true do |t|
    t.integer "user_id"
    t.string  "currency"
    t.string  "address"
    t.string  "template_name"
    t.string  "benef_name"
    t.string  "benef_address"
    t.string  "benef_city"
    t.string  "benef_country"
    t.string  "benef_acc_num"
    t.string  "benef_bank_name"
    t.string  "benef_bank_add"
    t.string  "benef_bank_city"
    t.string  "benef_bank_country"
    t.string  "benef_bank_swift"
    t.string  "inter_bank_name"
    t.string  "inter_bank_add"
    t.string  "inter_bank_city"
    t.string  "inter_bank_country"
    t.string  "inter_bank_account"
    t.string  "inter_bank_swift"
  end

end
