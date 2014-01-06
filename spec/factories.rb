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

Factory.define :gig do |gig|
  gig.gig_date     "2014-01-01 00:00:00"
  gig.gig_date_end "2014-01-02 00:00:00"
  gig.gig_title    "The New Year Live"
  gig.group        "Elastic Band"
  gig.location     "JJ Club Tokyo"
  gig.charge       "2500"
  gig.players      "Joshua(ts) McBride(b)"
  gig.comment      "This is the first live for our band."
  gig.recommend    "0"
  gig.start_time   "19:00:00"
end
