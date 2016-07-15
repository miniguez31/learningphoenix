alias Rumbl.Repo
alias Rumbl.Category
alias Rumbl.User
alias Rumbl.Video

for category <- ~w(Action Drama Romance Comedy Sci-fi) do
  Repo.get_by(Category, name: category) ||
  Repo.insert!(%Category{name: category})
end

Repo.get_by(User, name: "test") ||
Repo.insert!(%User{id: 1, name: "test", username: "test", password: "123456"})


videos = [
      %Rumbl.Video{ id: 1, title: "dogs", user_id: 1, category_id: 1},
      %Rumbl.Video{ id: 2, title: "cats", user_id: 1, category_id: 1}
]

for video <- videos do
  Repo.get_by(Video, title: video.title) ||
  Repo.insert!(video)
end