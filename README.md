# sitespeedsetup
Box setup to run sitespeed.io, graphite and graphana.

## Components
### sitespeed
* Using sitespeed to run tests against [WebPageTest](http://www.webpagetest.org/) for 2 wraps. 
* See [SiteSpeed docs] (https://www.sitespeed.io/) for more information on running sitespeed etc.

### graphite
* Stores metrics. Runs in a docker container.

### graphana
* Connect to graphite and shows metrics in a customizable Dashboard.

## Vagrant

See [Vagrantfile](https://github.com/gayatrimoray/sitespeedsetup/blob/master/Vagrantfile) for information on virtual box
instance setup.

### Provision steps

Install of Sitespeed, graphite and graphana are setup using [bootstrap.sh](https://github.com/gayatrimoray/sitespeedsetup/blob/master/Vagrantfile#L24).

## Manual steps 

### Graphana setup
* Setup graphite as the datasource for graphana. See (this)[https://www.sitespeed.io/documentation/performance-dashboard/#grafana] for more information.
* The graphana dashboard json is (here)[https://github.com/gayatrimoray/sitespeedsetup/blob/master/WebPageTest_sitespeed_wrap.json].

### cronjob
Setup sitespeed to run as cronjobs.

#### For Zulily
```
0 0,4,8,12,16,20 * * * sitespeed.io -u https://wrap.co/wraps/e2be006a-b32d-4603-b25a-fa69fe0386f0  --wptHost www.webpagetest.org --wptKey <WebPageTestToken> --graphiteHost localhost --graphiteNamespace sitespeed.io.wrap.zulily –wptConfig /tmp/wpt_config.json >> /tmp/sitespeed-run.txt 2>&1
```

#### For Hawaiian
```
2 0,4,8,12,16,20 * * * sitespeed.io -u https://wrap.co/wraps/368a863e-8b72-4a84-88d6-bc073478318e  --wptHost www.webpagetest.org --wptKey <WebPageTestToken> --graphiteHost localhost --graphiteNamespace sitespeed.io.wrap.hawaiian –wptConfig /tmp/wpt_config.json >> /tmp/sitespeed-run-wpt.txt 2>&1
```

### WPT File config 
Save in `/tmp/wpt_config.json` to work with above cronjobs

```
{
"mobileDevice": "Nexus5",
"video": false
}
```
