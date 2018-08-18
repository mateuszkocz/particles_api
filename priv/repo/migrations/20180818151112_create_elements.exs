defmodule ParticlesApi.Repo.Migrations.CreateElements do
  use Ecto.Migration

  def change do
    create table(:elements) do
      add :name, :string, size: 40
      add :symbol, :string, size: 2
      add :atomic_number, :integer
      add :group, :integer
      add :period, :integer

      timestamps()
    end

  end
end
