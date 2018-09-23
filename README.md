# json-server

[JSON Server](https://github.com/typicode/json-server) provides REST API mocking based on plain JSON.

## Usage

Build the image
```bash
docker build -t chaosbunker/json-server .
```

This docker image is also available as a [trusted build on the docker index](https://index.docker.io/u/chaosbunker/json-server),
so there's no setup required.

Place your db.json (and optional: auth.js, routes.json) in a directory and mount it as a volume to /app/data in the container. All three files will automatically be loaded by json-server.

```bash
$ docker run -d -p 3000:3000 -v /abs/path/to/dir:/app/data chaosbunker/json-server
```

The above example exposes the JSON Server REST API on port 3000, so that you can now browse to:

```
http://localhost:3000/
```

You can supply any number of JSON Server arguments that will be passed through unmodified.

```bash
$ docker run -it --rm chaosbunker/json-server --help
```

### auth.js example

The following example requires an HTTP Header for GET requests and a second one for any other request method

```javascript
module.exports = (req, res, next) => {
	if (req.header('X-Authorize') != "I Like Turtles" || req.method != "GET" && req.header('X-Modify') != "I Really Like Turtles" ) {
		res.header('X-Unauthorized', 'Allyship Is A Verb, Not A Noun');
		return res.status(401).send({ error: 'Allyship Is A Verb, Not A Noun' });
	} else
		next();
	}
```

### dockerbunker

Consider [dockerbunker](https://github.com/chaosbunker/dockerbunker) to painlessly deploy this docker image (behind an nginx reverse proxy with SSL cert by Let's Encrypt)
