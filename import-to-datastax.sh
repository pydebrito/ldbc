#!/bin/bash

#dsbulk should be in the path
export DATA_DIR=../ldbc_snb_datagen/social_network
export POSTFIX=_0_0.csv

#dsbulk load -url "${DATA_DIR}/dynamic/comment${POSTFIX}" -k ldbc -t comment -h localhost -header true --connector.csv.delimiter '|'
#dsbulk load -url "${DATA_DIR}/dynamic/forum${POSTFIX}" -k ldbc -t forum -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/person${POSTFIX}" -k ldbc -t person -h localhost -header true --connector.csv.delimiter '|'
#dsbulk load -url "${DATA_DIR}/dynamic/post${POSTFIX}" -k ldbc -t post -h localhost -header true --connector.csv.delimiter '|'
#dsbulk load -url "${DATA_DIR}/static/tagclass${POSTFIX}" -k ldbc -t tag_class -h localhost -header true --connector.csv.delimiter '|'
#dsbulk load -url "${DATA_DIR}/static/tag${POSTFIX}" -k ldbc -t tag -h localhost -header true --connector.csv.delimiter '|'
#dsbulk load -url "${DATA_DIR}/static/organisation${POSTFIX}" -k ldbc -t organization -h localhost -header true --connector.csv.delimiter '|'
#dsbulk load -url "${DATA_DIR}/static/place${POSTFIX}" -k ldbc -t place -h localhost -header true --connector.csv.delimiter '|'
exit
dsbulk load -url "${DATA_DIR}/dynamic/person_knows_person${POSTFIX}" -k ldbc -t person__knows__person -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/comment_hasCreator_person${POSTFIX}" -k ldbc -t comment__has_creator__person -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/comment_isLocatedIn_place${POSTFIX}" -k ldbc -t comment__is_located_in__place -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/comment_replyOf_comment${POSTFIX}" -k ldbc -t comment__is_reply_of__comment -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/comment_replyOf_post${POSTFIX}" -k ldbc -t comment__is_reply_of__post -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/forum_containerOf_post${POSTFIX}" -k ldbc -t forum__is_container_of__post -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/forum_hasMember_person${POSTFIX}" -k ldbc -t forum__has_member__person -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/forum_hasModerator_person${POSTFIX}" -k ldbc -t forum__has_moderator__person -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/forum_hasTag_tag${POSTFIX}" -k ldbc -t forum__has_tag__tag -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/person_hasInterest_tag${POSTFIX}" -k ldbc -t person__has_interest__tag -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/person_isLocatedIn_place${POSTFIX}" -k ldbc -t person__is_located_in__place -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/person_likes_comment${POSTFIX}" -k ldbc -t person__likes__comment -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/person_likes_post${POSTFIX}" -k ldbc -t person__likes__post -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/static/place_isPartOf_place${POSTFIX}" -k ldbc -t place__is_part_of__place -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/post_hasCreator_person${POSTFIX}" -k ldbc -t post__has_creator__person -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/comment_hasTag_tag${POSTFIX}" -k ldbc -t comment__has_tag__tag -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/post_hasTag_tag${POSTFIX}" -k ldbc -t post__has_tag__tag -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/post_isLocatedIn_place${POSTFIX}" -k ldbc -t post__is_located_in__place -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/static/tagclass_isSubclassOf_tagclass${POSTFIX}" -k ldbc -t tag_class__is_subclass_of__tag_class -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/static/tag_hasType_tagclass${POSTFIX}" -k ldbc -t tag__has_type__tag_class -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/person_studyAt_organisation${POSTFIX}" -k ldbc -t person__studies_at__organization -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/dynamic/person_workAt_organisation${POSTFIX}" -k ldbc -t person__works_at__organization -h localhost -header true --connector.csv.delimiter '|'
dsbulk load -url "${DATA_DIR}/static/organisation_isLocatedIn_place${POSTFIX}" -k ldbc -t organization__is_located_in__place -h localhost -header true --connector.csv.delimiter '|'
