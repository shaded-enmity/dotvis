# dotvis
Quick visualization for Dot graphs

# Description
Every time I needed to quickly visualize some largeish graphs the `dot` tooling available in almost every distrubition completely 
blew in my face so I decided to quickly combine stuff I already know to work well and package the whole as a Docker container

Under the hood this uses the amazing graph tooling by [Anvaka](http://github.com/anvaka):
* http://github.com/anvaka/pm for the web interface
* http://github.com/anvaka/ngraph for Dot to binary conversion

# Requirements

Some dot graph

Docker

Browser

Open ports 8000 and 8081

# How to run

Simple way (assuming `~/.bin` is already in your path):
```
$ ln -s $PWD/dotvis ~/.bin/dotvis
$ git clone github.com/shaded-enmity/dotvis
$ cd dotvis
$ dotvis examples/test.dot test
Serving ... now access your graph at http://localhost:8081/#/galaxy/test
```

Advanced way:
```
$ git clone github.com/shaded-enmity/dotvis
$ cd dotvis
$ docker build -t dotvis .
$ cat examples/test.dot | docker run -p 8081:8081 -p 8000:8000 -d dotvis test
Serving ... now access your graph at http://localhost:8081/#/galaxy/test
```

# License

GNU/GPLv3

