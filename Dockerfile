FROM openjdk:13.0.2-slim

ENV app_dir /java_app
ENV app_name hello_devexp
ARG app_ver
ENV app_name_and_ver ${app_name}-${app_ver}

WORKDIR ${app_dir}

RUN mkdir ${app_dir}/conf
RUN mkdir ${app_dir}/logs

# libs -> lib is intentional, the gradle application plugin generates a start script that

COPY build/distributions/${app_name_and_ver}.tar /tmp/

RUN echo "Extracting application tar" \
    && cd ${app_dir} \
    && tar -xvf /tmp/${app_name_and_ver}.tar \
    && rm /tmp/${app_name_and_ver}.tar

CMD ["sh", "-c", "${app_name_and_ver}/bin/hello_devexp"]
