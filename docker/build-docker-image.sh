PROJECT_NAME=ome2_matching

if [ $# -eq 0 ]
    #Si il n'y a pas d'argument
    then
        echo "No arguments supplied"
        GIT_BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    elif [ $1 = "null" ]
        then
                echo "BRANCH_NAME = NULL Merge resquest case, Jenkins don't build docker image"
                exit 0
    #Avec le nom de la branche en parametre
    else
        GIT_BRANCH=$1
fi

GIT_BRANCH_LOWER=$(echo $GIT_BRANCH | tr '[:upper:]' '[:lower:]')

DOCKER_TAG=$GIT_BRANCH_LOWER

if [ $GIT_BRANCH = "main" ]
then
    DOCKER_TAG="latest"
fi

echo $GIT_BRANCH
echo $DOCKER_TAG

docker build --no-cache --build-arg GIT_BRANCH=$GIT_BRANCH -t $PROJECT_NAME:$DOCKER_TAG -f Dockerfile ./..
