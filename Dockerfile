FROM gradle:jdk13 as builder
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build

FROM openjdk:13.0.2-slim

ENV app_dir /java_app
ENV app_name hello_devexp
ARG app_ver
ENV app_name_and_ver ${app_name}-${app_ver}

COPY --from=builder /home/gradle/src/build/distributions/${app_name_and_ver}.tar /tmp/

WORKDIR ${app_dir}

RUN mkdir ${app_dir}/conf
RUN mkdir ${app_dir}/logs

RUN echo "Extracting application tar" \
    && cd ${app_dir} \
    && tar -xvf /tmp/${app_name_and_ver}.tar \
    && rm /tmp/${app_name_and_ver}.tar

CMD ["sh", "-c", "${app_name_and_ver}/bin/hello_devexp"]
