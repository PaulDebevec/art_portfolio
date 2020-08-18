Portfolio.destroy_all

Portfolio.create(name: "Traditional")
Portfolio.create(name: "Digital", description: "This portfolio consists of digital artwork")
User.create(username: "admin", password: "password", role: 1)
