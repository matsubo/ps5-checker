Bundler.require(:default)

require 'logger'

urls = {}
urls['PS5 (Normal)'] = 'https://www.amazon.co.jp/dp/B08GGGBKRQ/ref=emc_b_5_i'
urls['PS5 (Normal) Amazon ver'] = 'https://www.amazon.co.jp/dp/B08GGGCH3Y/ref=emc_b_5_i'
urls['PS5 (Digital)'] = 'https://www.amazon.co.jp/dp/B08GGF7M7B/ref=emc_b_5_i'
urls['PS5 (Digital) Amazon ver'] = 'https://www.amazon.co.jp/dp/B08GGCGS39/ref=emc_b_5_t'

logger = Logger.new('output.log')

if ARGV.long_options.include?('give-notification-permission')
  command = format("terminal-notifier -title '🎮' -message 'test notification'")
  system(command)
  exit
end

urls.each do |key, url|
  logger.info(url)

  agent = Mechanize.new

  agent.request_headers = {
    'authority' => 'www.amazon.co.jp',
    'pragma' => 'no-cache',
    'cache-control' => 'no-cache',
    'upgrade-insecure-requests' => '1',
    'user-agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36',
    'accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
    'sec-gpc' => '1',
    'sec-fetch-site' => 'same-origin',
    'sec-fetch-mode' => 'navigate',
    'sec-fetch-user' => '?1',
    'sec-fetch-dest' => 'document',
    'accept-language' => 'en-US,en;q=0.9'
  }

  page = agent.get(url)

  if page.body.encode("UTF-16BE", :invalid => :replace, :undef => :replace, :replace => '?').encode("UTF-8").match(/カートに入れる/)
    command = format("terminal-notifier -title '🎮' -message '%sをカートに入れられます' -open '%s'", key, url)
    system(command)
    logger.info('found the keyword')
  else
    logger.info('keyword not found')
  end
end
