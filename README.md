## Create running angular v6 (ng-cli) container

**Build container:**
```bash
$ cd /[folder with Dockerfile]
$ docker build -t ng6docker .
```

**Create alias:**
```bash
$ alias ng6docker='docker run -it --rm -v $PWD:/project:rw -p 4200:4200 -p 49154:49154 -p 53703:53703 --name ng6app ng6docker'
```

**Create app:**
```bash
$ cd ng6-docker
$ ng6docker ng new phabricator-client
```

**Serve app at localhost:**
```bash
$ ng6docker ng serve --host 0.0.0.0 --port 4200
```

**Build app:**
```bash
$ ng6docker ng build
```

**Other Ionic options:**
```bash
$ ng6docker ng
```

**Working with container:**
```bash
# stop container
$ docker stop ng6docker
# remove container
$ docker rm ng6docker
# enter container
$ docker exec -it ng6docker
```