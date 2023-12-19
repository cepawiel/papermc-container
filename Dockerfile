FROM ubuntu:latest

RUN apt update && apt install -y \
    openjdk-21-jre \
    vim

RUN mkdir /paper && mkdir /plugins

ADD https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/333/downloads/paper-1.20.4-333.jar /paper/paper.jar
ADD https://github.com/BlueMap-Minecraft/BlueMap/releases/download/v3.20/BlueMap-3.20-paper.jar /plugins/BlueMap.jar
ADD https://github.com/jpenilla/TabTPS/releases/download/v1.3.21/tabtps-spigot-1.3.21.jar /plugins/TabTPS.jar
ADD https://ci.lucko.me/job/spark/399/artifact/spark-bukkit/build/libs/spark-1.10.58-bukkit.jar /plugins/spark.jar
ADD https://github.com/mrgeneralq/sleep-most/releases/download/v5.2.0/sleep-most-5.2.0.jar /plugins/sleep-most.jar

WORKDIR /data

ENTRYPOINT ["/usr/bin/java", "-Xms2G", "-Xmx2G", "-jar", "/paper/paper.jar", "--nogui", "--add-extra-plugin-jar", "/plugins/BlueMap.jar", "--add-extra-plugin-jar", "/plugins/TabTPS.jar", "--add-extra-plugin-jar", "/plugins/spark.jar", "--add-extra-plugin-jar", "/plugins/sleep-most.jar"]
