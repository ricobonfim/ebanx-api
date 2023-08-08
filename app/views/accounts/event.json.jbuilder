json.ignore_nil!

if @accounts[0]
  json.origin do
    json.id @accounts[0].id.to_s
    json.balance @accounts[0].balance
  end
end

if @accounts[1]
  json.destination do
    json.id @accounts[1].id.to_s
    json.balance @accounts[1].balance
  end
end