# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

Preneur.Repo.insert!(%Preneur.Users.User{email: "w@wz.com", password_hash: "123123123"})
Preneur.Repo.insert!(%Preneur.Users.User{email: "w@w.com", password_hash: "123123123"})

Preneur.Repo.insert!(%Preneur.Items.Product{user_id: 1, name: "Adidas", photo: "https://picsum.photos/200/300"})
Preneur.Repo.insert!(%Preneur.Items.Product{user_id: 1, name: "BBQ", photo: "https://picsum.photos/200/300"})
Preneur.Repo.insert!(%Preneur.Items.Product{user_id: 2, name: "Cue", photo: "https://picsum.photos/200/300"})