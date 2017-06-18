# klbdeps

Builds docker image with dependencies for the
[klb project](https://github.com/NeowayLabs/klb).

Why ? Two main reasons:

* Tagging this project guarantees same dependencies versions with different klb versions
* Avoiding a big setup time on CI since building all the dependencies takes a lot of time

klb code evolves faster than we want to update dependencies, it seems
like a good idea to decouple dependencies update from klb updates.
