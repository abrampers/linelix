defmodule Linelix.Model do
  @moduledoc """
  Types used in LINE Bot API.

  ## Reference
  https://developers.line.me/en/docs/messaging-api/reference/#webhook-event-objects
  """

  # defmodule Source do
  #   defstruct type: nil, userId: nil, groupId: nil, roomId: nil
  #   @type t :: %User{type: binary, userId: binary, groupId: binary, roomId: binary}
  # end
  #
  # # defmodule Group do
  # #   defstruct type: nil, groupId: nil, userId: nil
  # #   @type t :: %Group{type: binary, groupId: binary, userId: binary}
  # # end
  # #
  # # defmodule Room do
  # #   defstruct type: nil, roomId: nil, userId: nil
  # #   @type t :: %Room{type: binary, roomId: binary, userId: binary}
  # # end
  #
  # defmodule User do
  #   defstruct type: nil, userId: nil
  #   @type t :: %User{type: binary, userId: binary}
  # end
  #
  # defmodule MessageEvent do
  #   defstruct replyToken: nil, type: nil, timestamp: nil, source: nil, message: nil
  #   @type t :: %Message{replyToken: binary, type: binary, timestamp: integer, source: Source.t, message: TODO}
  # end
  #
  # defmodule Text do
  #   defstruct id: nil, type: nil, text: nil
  #   @type t :: %Text{id: binary, type: binary, text: binary}
  # end
  #
  # defmodule Image do
  #   defstruct id: nil, type: nil
  #   @type t :: %Image{id: binary, type: binary}
  # end
  #
  # defmodule Video do
  #   defstruct id: nil, type: nil
  #   @type t :: %Video{id: binary, type: binary}
  # end
  #
  # defmodule Audio do
  #   defstruct id: nil, type: nil
  #   @type t :: %Audio{id: binary, type: binary}
  # end
  #
  # defmodule File do
  #   defstruct id: nil, type: nil, fileName: nil, fileSize: nil
  #   @type t :: %File{id: binary, type: binary, fileName: binary, fileSize: binary}
  # end
  #
  # defmodule Location do
  #   defstruct id: nil, type: nil, title: nil, address: nil, latitude: nil, longitude: nil
  #   @type t :: %Location{id: binary, type: binary, title: binary, address: binary, latitude: float, longitude: float}
  # end
  #
  # defmodule Sticker do
  #   defstruct id: nil, type: nil, packageId: nil, stickerId: nil
  #   @type t :: %Sticker{id: binary, type: binary, packageId: binary, stickerId: binary}
  # end
  #
  # defmodule Follow do
  #   defstruct replyToken: nil, type: nil, timestamp: nil, source: nil
  #   @type t :: %Follow{replyToken: binary, type: binary, timestamp: integer, source: TODO}
  # end
  #
  # defmodule Unfollow do
  #   defstruct type: nil, timestamp: nil, source: nil
  #   @type t :: %Follow{type: binary, timestamp: integer, source: TODO}
  # end
  #
  # defmodule Join do
  #   defstruct replyToken: nil, type: nil, timestamp: nil, source: nil
  #   @type t :: %Join{replyToken: binary, type: binary, timestamp: integer, source: TODO}
  # end
  #
  # defmodule Leave do
  #   defstruct type: nil, timestamp: nil, source: nil
  #   @type t :: %Leave{type: binary, timestamp: integer, source: TODO}
  # end
end
