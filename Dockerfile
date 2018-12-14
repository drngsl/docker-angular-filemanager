FROM dengshaolin/ubuntu

MAINTAINER dengshaolin drngsl@qq.com

RUN apt-get update -y && apt-get install git python-tornado -y && \
    git clone https://github.com/drngsl/angular-filemanager.git && \
    mkdir -p ng-filemanager/bridges/python/ && \
    mv angular-filemanager/index.html ng-filemanager/ && \
    mv angular-filemanager/dist ng-filemanager/ && \
    mv angular-filemanager/node_modules ng-filemanager/ && \
    mv angular-filemanager/bridges/python/tornado ng-filemanager/bridges/python/ && \
    apt-get remove -y git && apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /data/share

WORKDIR /data/share

EXPOSE 8000

CMD ["python", "../ng-filemanager/bridges/python/tornado/filemanager.py"]
