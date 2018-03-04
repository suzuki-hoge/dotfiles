#!/bin/bash

token_path=`dirname "${0}"`/token
token=`cat $token_path`

repo_owner=`git config --get remote.origin.url | tr -s '/' '\n' | tail -r | sed -n 2,2p`
repo_name=` git config --get remote.origin.url | tr -s '/' '\n' | tail -r | sed -n 1,1p | tr -s '.' '\n' | head -n 1`

fetched=`curl -sS -H "Authorization: bearer $token" -d @- https://api.github.com/graphql <<EOF
{
    "query": "query {
      repository(owner:\"$repo_owner\", name:\"$repo_name\") {
        pullRequests(last:20, states:OPEN) {
          edges {
            node {
              title
              number
              headRefName
              author {
                login
              }
            }
          }
        }
      }
    }"
}
EOF`

echo $fetched | jq --raw-output '.data.repository.pullRequests.edges[].node | [.number, .title, .author.login, .headRefName] | @tsv' | tr '\t' '®' | column -t -s '®' | sort -r
