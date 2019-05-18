#FROM ubuntu:16.04
FROM python:2
RUN pip install numpy scipy pandas lxml pyteomics cython matplotlib pyteomics.cythonize pyteomics.pepxmltk
RUN apt-get install mercurial
WORKDIR /opt/IdPy
RUN hg clone https://bitbucket.org/levitsky/identipy
RUN hg clone https://bitbucket.org/markmipt/mp-score/src/default/
RUN cd ./identipy && pip install .
RUN mv  default/* /bin
