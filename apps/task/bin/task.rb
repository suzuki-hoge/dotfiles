require 'open3'
require_relative 'conf.rb'

def call(command)
    return Open3.capture3(command)

    puts command
    ["1\n", nil, nil]
end

lines = File.read($input).split("\n")

if lines == []
    exit 0
end if

indices = lines.map { |line| line.start_with?('# ') }.zip([*0..100]).select { |b, n| b }.map { |b, n| n }

i = 1
for s, e in indices.zip(indices.slice(1..-1).map { |index| index - 1 })
    e = lines.size if e == nil
    issue = lines[s..e]
    title = issue[0].split('/')[0].strip[2..-1]
    body = issue[1..issue.size].map { |line| line.strip }.select { |line| !line.empty? }
    label = issue[0].split('/')[1].strip[0..-2]
    pipeline = issue[0].split('/')[1].strip[-1]

    puts "#{title} ( #{i}/#{indices.size} )"

    create = %!curl -sS -X POST -H "Content-Type: application/json" -H "Authorization: token #{$github_token}" https://api.github.com/repos/suzuki-hoge/#{$repository}/issues --data '{"title": "#{title}", "body": "#{body.join('\n')}", "labels": ["#{label}"]}' | jq .number!
    o, e, s = call(create)

    number = o.strip

    move = %!curl -X POST -H "X-Authentication-Token: #{$zenhub_token}" -H "Accept: application/json" https://api.zenhub.io/p1/repositories/#{$repository_id}/issues/#{number}/moves -d 'pipeline_id=#{$pipeline_ids[pipeline]}' -d 'position=bottom'!
    call(move)

    i += 1
end
