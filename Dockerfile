FROM node:8 

RUN npm install

ADD hello.js /hello.js

EXPOSE 8888

ENTRYPOINT [ "node", "hello.js" ]
