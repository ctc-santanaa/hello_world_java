The Dockerfile builds an image for this particular java jar. The version must be passed in the "docker build" command,
e.g. "--build-arg app_ver=1.0-SNAPSHOT". This would have to be automated in the build/release system so the
automatically tagged version number is used instead of manually specifying.
