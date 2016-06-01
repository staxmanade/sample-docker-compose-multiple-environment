
# Start up the proxy
docker run -d -p 80:80 --name nginx-proxy -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy

# Setup the nginx-proxy to work with a specificly named network
docker network connect service-tier nginx-proxy

# qa
export NODE_ENV=qa
export PORT=8001
export VIRTUAL_HOST=$NODE_ENV.my-docker-test-site.com
docker-compose -p ${VIRTUAL_HOST} up -d


# beta
export NODE_ENV=beta
export PORT=8002
export VIRTUAL_HOST=$NODE_ENV.my-docker-test-site.com
docker-compose -p ${VIRTUAL_HOST} up -d


# prod
export NODE_ENV=production
export PORT=8003
export VIRTUAL_HOST=my-docker-test-site.com
docker-compose -p ${VIRTUAL_HOST} up -d


# Stop all containers except nginx-proxy
# docker stop $(docker ps -q | grep -v f836b7788457)
