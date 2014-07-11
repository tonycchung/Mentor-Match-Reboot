json.array!(@codefellows_courses) do |codefellows_course|
  json.extract! codefellows_course, :id, :kind, :stack, :code, :section, :starts_at, :ends_at, :instructor
  json.url codefellows_course_url(codefellows_course, format: :json)
end
