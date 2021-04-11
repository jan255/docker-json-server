FROM node:10-alpine
EXPOSE 3000
RUN npm install -g --production json-server && \    
    rm -rf /root/.npm                  \
           /usr/lib/node_modules/npm


VOLUME [ "/data" ]
WORKDIR /data

ENTRYPOINT ["json-server", "--host", "0.0.0.0"]
CMD []