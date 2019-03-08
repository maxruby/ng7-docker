## Create running angular v7 (ng-cli) container

**Build container:**
```bash
$ cd /[folder with Dockerfile]
$ docker build -t ng7docker .
```

**Create alias:**
```bash
$ alias ng7docker='docker run -it --rm -v $PWD:/project:rw -p 4200:4200 -p 49154:49154 -p 53703:53703 --name ng7app ng7docker'
```

**Create app:**
```bash
$ cd ng7-docker
$ ng7docker ng new phabricator-client
```

**Serve app at localhost:**
```bash
$ ng7docker ng serve --host 0.0.0.0 --port 4200
```

**Build app:**
```bash
$ ng7docker ng build
```

**Other ng options:**
```bash
$ ng7docker ng
```

**Working with container:**
```bash
# stop container
$ docker stop ng7docker
# remove container
$ docker rm ng7docker
# enter container
$ docker exec -it ng7docker
```