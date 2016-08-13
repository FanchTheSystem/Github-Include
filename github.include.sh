
gituser="FanchTheSystem"

github_go () 
{ 
    mkdir -p ~/GITHUB
    cd ~/GITHUB
    echo "Go To:" "$1"
    echo "Current:" $(pwd)
    res="ok"
    if [ -n "$1" ]; then
        res="ko"
        if [ -d "$1" ]; then
            cd "$1"
            echo "Current:" $(pwd)
            res="ok"
        fi;
    fi;
    echo "Res:" $res
    echo "Current:" $(pwd)
    if [ res == "ko" ]; then
        kill -INT $$
    fi
}


github_clean () 
{ 
    rm -rf ~/GITHUB
}

github_clone () 
{ 
    github_go
    echo "Clone:" "$1"
    git clone git@github.com:${gituser}/$1.git
}

github_init () 
{ 
    github_go
    echo "Init:" "$1"
    mkdir -p $1
    github_go $1
    git init
    touch README.md
    git add README.md
    git commit -m "First commit"
    git remote add origin git@github.com:${gituser}/$1.git
    git remote -v
    git push -u origin master
}

github_commit () {
    github_go "$1"
    
    msg="Update Version"
    if [ -n "$2" ]
    then
	msg="$2"
    fi
    echo "Commit:" "$1" "$msg"
    git commit -a -m "$msg"
    git push -u origin master
}

github_pull () {
    github_go "$1"
    echo "Get Last Version"
    git pull
}



github_add () {
    github_go "$1"
    if [ -e "$2" ] 
    then
	echo "Add:" "$2"
	git add "$2"
    fi
    
}

git_hub_rm () {
    github_go "$1"
    
    if [ -e "$2" ] 
    then
	echo "Remove:" "$2"
	git rm "$2"
    fi
}


