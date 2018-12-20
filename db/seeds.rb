  #create users

  fkahlo = User.create(name: "Frida", username: "fkahlo", password: "password")
  
  monet = User.create(name: "Monet", username: "monet", password: "password")

  #create themes

  Exhibit.create(theme: "Starry Starry Night", user_id: fkahlo.id)

  #preassociate data

  fkahlo.exhibits.create(theme: "Red & Blue")

  monet_theme = monet.exhibits.build(theme: "Black & White")
  monet_theme.save
