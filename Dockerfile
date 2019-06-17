ARG osversion=2.7.16-stretch

FROM python:${osversion}

ARG VERSION=master
ARG VCS_REF
ARG BUILD_DATE

RUN echo "VCS_REF: "${VCS_REF}", BUILD_DATE: "${BUILD_DATE}", VERSION: "${VERSION}

LABEL maintainer="stephan.drukewitz@ime.fraunhofer.de" \
      description="Dockerfile providing the Identypy software package" \
      version=${VERSION} \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.vcs-url="https://github.com/StephanHolgerD/identi_py.git"

RUN pip install numpy \
                scipy \
		pandas \
		lxml \
		pyteomics \
		cython \
		matplotlib \
		pyteomics.cythonize \
		pyteomics.pepxmltk

RUN apt-get install mercurial
WORKDIR /opt/IdPy
RUN hg clone https://bitbucket.org/levitsky/identipy && \
    hg clone https://bitbucket.org/markmipt/mp-score/src/default/ && \
    cd ./identipy && pip install . ;\
    cd /opt/IdPy/default ; chmod +x MPlib.py MPscore.py customxml.py SSRCalc.py

ENV PATH=${PATH}:/opt/IdPy/default
WORKDIR /data
