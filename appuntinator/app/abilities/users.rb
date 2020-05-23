Canard::Abilities.for(:User) do
  can [:cread, :read, :update, :delete], Appunto
  
  can [:cread, :read, :update, :delete], Comment
  
end
