# auto-build-image

The [Auto-DevOps](https://docs.gitlab.com/ee/topics/autodevops/) [build stage](https://gitlab.com/gitlab-org/gitlab/blob/master/lib/gitlab/ci/templates/Jobs/Build.gitlab-ci.yml) image.

## Contributing and Code of Conduct

Please see [CONTRIBUTING.md](CONTRIBUTING.md)

## Upgrading

Starting with GitLab 12.10, `auto-build-image` is released under

```
registry.gitlab.com/gitlab-org/cluster-integration/auto-build-image:$VERSION
```

with the first `$VERSION` being `v0.1.0` (see [all
releases](https://gitlab.com/gitlab-org/cluster-integration/auto-build-image/-/tags)).
Prior to that, the image was released under the tag

```
registry.gitlab.com/gitlab-org/cluster-integration/auto-build-image/master:stable
```

but this tag is will no longer be updated.

# Generating a new auto-build-image

To generate a new image you must follow the git commit guidelines below, this
will trigger a semantic version bump which will then cause a new pipeline
that will build and tag the new image

## Git Commit Guidelines

This project uses [Semantic Versioning](https://semver.org). We use commit
messages to automatically determine the version bumps, so they should adhere to
the conventions of [Conventional Commits (v1.0.0-beta.2)](https://www.conventionalcommits.org/en/v1.0.0-beta.2/).

### TL;DR

- Commit messages starting with `fix: ` trigger a patch version bump
- Commit messages starting with `feat: ` trigger a minor version bump
- Commit messages starting with `BREAKING CHANGE: ` trigger a major version bump.

## Automatic versioning

Each push to `master` triggers a [`semantic-release`](https://semantic-release.gitbook.io/semantic-release/)
CI job that determines and pushes a new version tag (if any) based on the
last version tagged and the new commits pushed. Notice that this means that if a
Merge Request contains, for example, several `feat: ` commits, only one minor
version bump will occur on merge. If your Merge Request includes several commits
you may prefer to ignore the prefix on each individual commit and instead add
an empty commit summarizing your changes like so:

```
git commit --allow-empty -m '[BREAKING CHANGE|feat|fix]: <changelog summary message>'
```
