# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TimeManagement.Repo.insert!(%TimeManagement.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias TimeManagement.Repo

alias TimeManagement.Accounts.Role
alias TimeManagement.Accounts.User

alias TimeManagement.Teams.Team
alias TimeManagement.Teams.TeamUser

Repo.insert! %Role{
    name: "employee"
}

Repo.insert! %Role{
    name: "manager"
}

Repo.insert! %Role{
    name: "general manager"
}

Repo.insert! %User{
    fname: "Hugo",
    lname: "DEL PIA",
    email: "hugo.del-pia@epitech.eu",
    password: "TEST",
    avatar: "hugo_delpia_profile.png",
    role_id: 1
}

Repo.insert! %User{
    fname: "Christine",
    lname: "FOUQUET",
    email: "christine.fouquet@epitech.eu",
    password: "TEST",
    avatar: "_.png",
    role_id: 2
}

Repo.insert! %User{
    fname: "Jean-Pierre",
    lname: "BENOIT",
    email: "jp.benoit@epitech.eu",
    password: "TEST",
    avatar: "_1.png",
    role_id: 3
}

Repo.insert! %Team{
    name: "équipe de travail"
}

Repo.insert! %Team{
    name: "équipe administrative"
}


Repo.insert! %TeamUser{
    user_id: 1,
    team_id: 1
}
Repo.insert! %TeamUser{
    user_id: 2,
    team_id: 1
}
Repo.insert! %TeamUser{
    user_id: 3,
    team_id: 1
}

Repo.insert! %TeamUser{
    user_id: 2,
    team_id: 2
}
Repo.insert! %TeamUser{
    user_id: 3,
    team_id: 2
}



