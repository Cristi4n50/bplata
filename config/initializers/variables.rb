BASE_CURRENCIES = ["GBP", "HKD", "USD", "BTC", "LTC"]
CRYPTO_CURRENCIES = ["BTC", "LTC"]
CURRENCIES = ["USD", "BTC", "LTC"]
PUBLISHED_CURRENCIES = ["USD", "BTC"]
EXTERNAL_PAIRS = ["BTCUSD"]
PAIRS = ["BTCUSD", "LTCBTC", "LTCUSD"]
case Rails.env
  when "development"
    EGOPAY_URL = 'www.egopay.com'
    EGOPAY_STOREID = 'AAAAAA'
    EGOPAY_VERSION = '1.3'
    EGOPAY_ACCNAME = 'Bitfinex'
    EGOPAY_API_ID = ''
    BSTP_ID = ''
    BSTP_URL = 'www.bitstamp.net'
    BSTP_KEY = ''
    MASTERBFX_ID = ''
    MASTERBFX_URL = ''
    MASTERBFX_KEY = ''
    SYSUSER_ID = 3319
    BSTP_USER = 1
    RESERVE_USER = 1907
    SETTLE_USER = 1675
  when "production"
    EGOPAY_URL = 'www.egopay.com'
    EGOPAY_STOREID = 'A55G4GVB6BH4'
    EGOPAY_VERSION = '1.3'
    EGOPAY_ACCNAME = 'Bitfinex'
    EGOPAY_API_ID = 'AJI5AYSTA497'
    BSTP_ID = '32755'
    BSTP_URL = 'www.bitstamp.net'
    #BSTP_URL = '91.185.198.184'
    BSTP_KEY = 'C57VOstg3Qel6uHKKO2DRa0NB0jemMwt'
    MASTERBFX_ID = ''
    MASTERBFX_URL = ''
    MASTERBFX_KEY = ''
    SYSUSER_ID = 3319
    BSTP_USER = 15280
    RESERVE_USER = 1907
    SETTLE_USER = 1675
end