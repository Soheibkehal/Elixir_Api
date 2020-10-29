alias TimeManagement.Repo
alias TimeManagement.TimeManager.WorkingTime

Repo.insert! %WorkingTime{
    start: ~N[2020-10-21 08:23:08],
    end: ~N[2020-10-21 18:00:07],
    user_id: 1
}

Repo.insert! %WorkingTime{
    start: ~N[2020-10-20 08:24:10],
    end: ~N[2020-10-20 17:56:12],
    user_id: 1
}

Repo.insert! %WorkingTime{
    start: ~N[2020-10-20 08:10:08],
    end: ~N[2020-10-20 18:50:40],
    user_id: 2
}

Repo.insert! %WorkingTime{
    start: ~N[2020-10-20 09:43:58],
    end: ~N[2020-10-20 14:30:24],
    user_id: 3
}
