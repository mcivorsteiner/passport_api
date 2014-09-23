module TestHelpers
  def new_boat_params
    { boat: { name: "Amazon Express", capacity: 12 }}
  end

  def new_timeslot_params
    { "timeslot" => { "start_time" => "1411484400", "duration"=>"120" }}
  end
end