# docker-gh-backup

Docker container for Github repository backup

To backup all repository:

```
docker run --rm -it -v $(pwd):/root -v ~/.ssh:/root/.ssh -e GH_TOKEN=$(gh auth token) -e GITHUB_USERNAME=$[YOUR_GITHUB_USERNAME] ghcr.io/decatoncheir/docker-gh-backup:lastest
```
