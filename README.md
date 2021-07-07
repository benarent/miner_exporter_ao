# Helium Metrics Exporter -> AppOptics

This exporter is based on the work by https://github.com/tedder/miner_exporter.  The Pro of this project is it doesn't require setting up Grafana / Prom and let's you easily setup alerts. 


## Live Dashboard Preview ( on Testnet )

https://my.appoptics.com/s/dashboards/1350465?duration=86400

## Dashboard Screenshot

![HNT Dashboard](/img/my.appoptics.com_s_dashboards_1350465_duration=86400.png?raw=true)

# Running via Docker

Pre-requisites 
- An AppOptics Account 'Developer Edition'  https://my.appoptics.com/sign_up/developer
    - This plan included 100 free metrics which is more than enough to run this project. 

## Docker client

### Mainnet 

```bash
docker run -i -d  -e AO_API=[API-KEY]  --name miner_exporter_ao -v /var/run/docker.sock:/var/run/docker.sock quay.io/benarent/hnt-ao:latest
```

### Testnet 

```
docker run -i -d -e API_BASE_URL=https://testnet-api.helium.wtf/v1 -e AO_API=[API-Key] -e HNT_CHAIN=testnet --name miner_exporter_ao -v /var/run/docker.sock:/var/run/docker.sock quay.io/benarent/hnt-ao:latest
```

## Updating 

```
docker stop miner_exporter_ao && docker rm miner_exporter_ao
```

# AppOptics Dashboard Setup 

I've included a barebone `dashboard.yaml` which can be used to setup a prefrabricated Helium Dashboard. 


## Building / Dev 

This section is mostly for devs wanting to publish their own image. 

To Publish:
```bash
# Build Image
docker build --no-cache -t hnt-ao .

# Find Image 
docker image ls

# Tag image
docker tag f7e3e95c7483 quay.io/benarent/hnt-ao:0.0.4

# docker push quay.io/benarent/hnt-ao
docker push quay.io/benarent/hnt-ao:0.0.4
```