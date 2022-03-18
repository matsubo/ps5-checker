# PS5 sales status checker

## Abstract

- Check the Amazon's web page and show notification if PS5 stock is available and eligible to buy.
- Runs on only MacOS in accordance of notification logic.

Sample notification:
<img width="416" alt="image" src="https://user-images.githubusercontent.com/98103/158922724-d2e40378-8088-465f-8bf4-1c614d05ac9d.png">

## Setup

```
% bundle
```


Run following command and give the permission to this script to use notification cneter.
```
% bundle exec ruby main.rb --give-notification-permission
```

## Run manually

```
% bundle exec ruby main.rb
```

## Run periodically

crontab example
```
* 9-10 * * 5 /bin/bash -lc 'cd /path/to/ps5-checker && bundle exec ruby main.rb' >> /tmp/ps5-checker.log 2>&1
```


