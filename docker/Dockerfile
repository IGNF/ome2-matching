FROM debian:10

RUN apt-get update -y
RUN apt-get install -y qt5-default
# RUN apt-get install -y git


# ENV DIR_TMP=/usr/local/src/ome2_matching_tmp/                                              
# WORKDIR $DIR_TMP/../
# COPY . $DIR_TMP
# WORKDIR $DIR_TMP
# RUN git checkout $GIT_BRANCH
# RUN git submodule init
# RUN git submodule update --remote --merge

WORKDIR /usr/local/src/

COPY libs libs/
COPY version version
# RUN mv $DIR_TMP/libs libs
# RUN mv $DIR_TMP/version version
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/src/libs

RUN mkdir --parents au_matching/config
COPY au_matching/package au_matching/package/
COPY au_matching/config/*.ini au_matching/config/
# RUN mv $DIR_TMP/au_matching/package au_matching/package
# RUN mv $DIR_TMP/au_matching/config/*.ini au_matching/config/
RUN dpkg -i au_matching/package/*.deb

RUN mkdir --parents au_merging/config
COPY au_merging/package au_merging/package/
COPY au_merging/config/*.ini au_merging/config/
# RUN mv $DIR_TMP/au_merging/package au_merging/package
# RUN mv $DIR_TMP/au_merging/config/*.ini au_merging/config/
RUN dpkg -i au_merging/package/*.deb

RUN mkdir --parents tn_matching/config
COPY tn_matching/package tn_matching/package/
COPY tn_matching/config/*.ini tn_matching/config/
# RUN mv $DIR_TMP/tn_matching/package tn_matching/package
# RUN mv $DIR_TMP/tn_matching/config/*.ini tn_matching/config/
RUN dpkg -i tn_matching/package/*.deb

RUN mkdir --parents hy_matching/config
COPY hy_matching/package hy_matching/package/
COPY hy_matching/config/*.ini hy_matching/config/
# RUN mv $DIR_TMP/hy_matching/package hy_matching/package
# RUN mv $DIR_TMP/hy_matching/config/*.ini hy_matching/config/
RUN dpkg -i hy_matching/package/*.deb

# RUN rm -r $DIR_TMP
# RUN apt-get remove -y git