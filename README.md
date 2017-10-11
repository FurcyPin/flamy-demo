# Flamy Demo

Welcome to Flamy's demonstration repository.

**Flamy** is a all-in-one command line tool that helps you :

- Manage your Hive database on Hadoop or AWS
- Keep your SQL tables and queries clean and well-defined
- Easily design, control and execute complex data workflows
- Automatically infer and visualize dependencies between SQL queries

This repository contains everything required to follow [flamy's quick demo](http://flamy.readthedocs.io/en/latest/Demo.html)


### Run docker with

```
docker run --rm -e USER=`id -u -n` -e USER_ID=`id -u` -it -v `pwd`/data:/data/hive -p 127.0.0.1:9083:9083 -p 127.0.0.1:4040:4040 -p 127.0.0.1:10000:10000 fpin/docker-hive-spark
```

### Start flamy with 

```
./demo.sh
```

Make sure the environment variable `FLAMY_HOME` is correctly set first.
