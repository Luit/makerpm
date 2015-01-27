# makerpm
Dockerfile to more easily build RPM packages

## Usage
Make your own Dockerfile with just a `FROM luit/makerpm` instruction. 
In the same folder, make a `.spec` file, and a SOURCES directory with any sources you might need.
If the build needs anything, add `CMD yum install -y ...` instructions to your Dockerfile.
To build the RPM file, `docker build .` and `docker run` the resulting image. 
When done, you can `docker cp` the resulting packages from `/home/makerpm/{SRPMS,RPMS}`. 
Another option is to have these folders mounted as volumes for the `docker run`.
