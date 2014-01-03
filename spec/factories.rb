Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.define :discography do |discography|
  discography.release_date "2014-01-01"
  discography.title        "New Album"
  discography.artist       "Yoshimasa"
  discography.players      ""
  discography.record_co    "ABC Record"
  discography.url          "http://example.com"
  discography.comment      "This CD is great."
end
