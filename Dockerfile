FROM node:10.13

WORKDIR /app

# install Firebase CLI Tools

RUN apt-get -y update && apt-get install -y default-jdk-headless && npm install -g firebase-tools

# settings for runtime emulator
ENV HOST 0.0.0.0
EXPOSE 8080

# settings for Firebase login
EXPOSE 9005

EXPOSE 4000

CMD [ "/bin/bash" ]