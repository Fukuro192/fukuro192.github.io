# fukuro192.github.io

A simple blog based on the [**Chirpy Starter**](https://github.com/cotes2020/chirpy-starter).

## Local

```powershell
docker compose up
```

Open [http://127.0.0.1:4000](http://127.0.0.1:4000). Live reload is on; HTTP requests are logged in the container.

After `Gemfile` changes:

```powershell
docker compose run --rm site bundle lock --add-platform x86_64-linux
```
