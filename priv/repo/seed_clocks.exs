alias TimeManagement.Repo
alias TimeManagement.TimeManager.Clock

Repo.insert! %Clock{
    time: Time.from_iso8601!("08:24:10"),
    status: true,
    user_id: 1
}

Repo.insert! %Clock{
    time: Time.from_iso8601!("08:10:08"),
    status: true,
    user_id: 2
}

Repo.insert! %Clock{
    time: Time.from_iso8601!("09:43:58"),
    status: true,
    user_id: 3
}

Repo.insert! %Clock{
    time: Time.from_iso8601!("17:56:12"),
    status: false,
    user_id: 1
}

Repo.insert! %Clock{
    time: Time.from_iso8601!("18:50:40"),
    status: false,
    user_id: 2
}

Repo.insert! %Clock{
    time: Time.from_iso8601!("14:30:24"),
    status: false,
    user_id: 3
}
