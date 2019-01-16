# build stage script for Auto-DevOps

echo "{\"auths\":{\"$CI_REGISTRY\":{\"username\":\"$CI_REGISTRY_USER\",\"password\":\"$CI_REGISTRY_PASSWORD\"}}}" > /kaniko/.docker/config.json

if [[ -f Dockerfile ]]; then
  echo "Building Dockerfile-based application..."
else
  echo "Building Heroku-based application using gliderlabs/herokuish docker image..."
  cp /build/Dockerfile Dockerfile
fi

/kaniko/executor \
  --build-arg BUILDPACK_URL="$BUILDPACK_URL" \
  --build-arg HTTP_PROXY="$HTTP_PROXY" \
  --build-arg http_proxy="$http_proxy" \
  --build-arg HTTPS_PROXY="$HTTPS_PROXY" \
  --build-arg https_proxy="$https_proxy" \
  --build-arg FTP_PROXY="$FTP_PROXY" \
  --build-arg ftp_proxy="$ftp_proxy" \
  --build-arg NO_PROXY="$NO_PROXY" \
  --build-arg no_proxy="$no_proxy" \
  --cache true \
  --context "$CI_PROJECT_DIR" \
  --dockerfile "$CI_PROJECT_DIR/Dockerfile" \
  --destination "$CI_APPLICATION_REPOSITORY:$CI_APPLICATION_TAG" \
  "$@"
