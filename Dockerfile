FROM node:latest

WORKDIR ./home/source
COPY . .

RUN apt update && apt -y install nginx
RUN npm install && npm run build
RUN mv -f ./default /etc/nginx/sites-available


EXPOSE 82

CMD ["nginx", "-g", "daemon off;"]