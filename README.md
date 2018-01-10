# Linelix

**Elixir LINE Bot wrapper using Elixir**

## Installation

Add `linelix` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:linelix, "~> 0.1.0", git: "https://github.com/abrampers/linelix.git"}
  ]
end
```

Then get dependencies

```sh-session
$ mix deps.get
```

Add `:linelix` to your `:applications` list to start `:httpoison` and `:poison` automatically.

## Configuration

Add your Telegram Bot API token to `config/config.exs`

```elixir
config :linelix,
  token: "<PUT_TOKEN_HERE>"
```

## Progress

### LINE API

#### Event Objects
- [X] Message event
- [X] Follow event
- [X] Unfollow event
- [X] Join event
- [X] Leave event
- [X] Postback event
- [X] Beacon event

#### Messaging
- [X] Send reply message
- [X] Send push message
- [X] Send multicast messages
- [ ] Get content

###### Message objects
- [X] Text
- [X] Sticker
- [X] Image
- [X] Video
- [X] Audio
- [X] Location
- [ ] Imagemap message
- [ ] Template messages

#### Profile
- [ ] Get profile

#### Group
- [ ] Get group member profile
- [ ] Get group member user IDs
- [ ] Leave group

#### Room
- [ ] Get room member profile
- [ ] Get room member user IDs
- [ ] Leave room

#### Rich menu
- [ ] Get rich menu
- [ ] Create rich menu
- [ ] Delete rich menu
- [ ] Get rich menu ID of user
- [ ] Link rich menu to user
- [ ] Unlink rich menu from user
- [ ] Download rich menu image
- [ ] Upload rich menu image
- [ ] Get rich menu list

### Format response

- [ ] Map response to model

### Fix config

- [ ] Remove config, set to mix-able
