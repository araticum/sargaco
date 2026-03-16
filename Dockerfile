FROM chrislusf/seaweedfs:3.94

COPY s3.json /etc/seaweedfs/s3.json
COPY entrypoint.sh /usr/local/bin/sargaco-entrypoint.sh

RUN chmod +x /usr/local/bin/sargaco-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/sargaco-entrypoint.sh"]
