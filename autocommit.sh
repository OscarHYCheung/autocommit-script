#!/bin/sh

print_usage() {
  echo "Usage: autocommit [-d <target_directory>] [-i <interval>] [-m <commite_message>]"
  exit 1;
}

while getopts ":d:i:m:" options; do
  case "$options" in
    d)
      target_directory=$(realpath ${OPTARG});
      ;;
    i)
      interval=${OPTARG};
      ;;
    m)
      commit_message=${OPTARG};
      ;;
    *)
      print_usage;
      ;;
  esac
done

if [[ -z "$target_directory" ]]; then
  target_directory=$(pwd);
fi

if [[ -z "$interval" ]]; then
  interval=5;
fi

if [[ -z "$commit_message" ]]; then
  commit_message="Commited by autocommit";
fi

echo "Watching $target_directory, check every ${interval}s"
cd $target_directory;

while [[ true ]]; do
  if ! git diff-index --quiet HEAD --; then
    echo "";
    git add -A;
    git commit -m "$commit_message";
    git fetch origin master;
    git rebase origin/master;
    git push origin master
    echo "";
    echo "Commited at $(date)";
  fi
  sleep $interval;
done
