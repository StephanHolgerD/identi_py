#FROM ubuntu:16.04
FROM python:2
RUN pip install numpy scipy pandas lxml pyteomics cython pyteomics.cythonize matplotlib pyteomics.pepxmltkls
RUN apt-get install mercurial
RUN mkdir IdPy && cd IdPy
RUN hg clone https://bitbucket.org/levitsky/identipy
RUN hg clone https://bitbucket.org/markmipt/mp-score/src/default/
RUN cd ./identipy && pip install .
RUN mv default MPscore
