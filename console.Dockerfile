ARG VERSION=7.3
ARG BASEOS=stretch

FROM my127/php:${VERSION}-fpm-${BASEOS}-console

# PHP: additional extensions
# --------------------------
RUN cd /root/installer; ./enable.sh \
  redis \
  sockets

# Tool: redis-cli
# ---------------
# we copy instead of using redis-cli or redis-tools due to inconsistent versions
COPY --from=redis:5.0 /usr/local/bin/redis-cli /usr/local/bin/redis-cli
