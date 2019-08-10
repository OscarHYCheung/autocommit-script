# autocommit.sh

## Install
```ln -s <script_path>/autocommit.sh /usr/local/bin/autocommit```

## Usage
```autocommit [-d <target_directory>] [-i <interval>] [-m <commite_message>]```
### Default Values
- `<target_directory>`: current path
- `<interval>`: 5 seconds
- `<commite_message>`: Commited by autocommit

## Assumptions
- `<target_directory>` is folder with Git set up properly with SSH authentication
- Always fetch from, rebase on, and push to `origin/master`
- Will never have conflicts
