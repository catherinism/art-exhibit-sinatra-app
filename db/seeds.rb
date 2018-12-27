  #create users

  fkahlo = User.create(name: "Frida", username: "fkahlo", password: "password")

  monet = User.create(name: "Monet", username: "monet", password: "password")

  #create themes

  Exhibit.create(title: "Starry Starry Night", user_id: fkahlo.id)

  #preassociate data

  fkahlo.exhibits.create(title: "Red & Blue")

  monet_theme = monet.exhibits.build(title: "Black & White")
  monet_theme.save
