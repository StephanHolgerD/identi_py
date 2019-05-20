ARG osversion=2.7.16-stretch

FROM python:${osversion}

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
    cd ./identipy && pip install .

ENV PATH=${PATH}:/opt/IdPy/identipy:/opt/IdPy/default
ENTRYPOINT /bin/bash
WORKDIR /data
