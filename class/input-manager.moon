export class InputManager
  new: =>
    @controls = {}
    @controls[1] =
      left: 'left'
      right: 'right'
      jump: 'up'
    @controls[2] =
      left: 'a'
      right: 'd'
      jump: 'w'

  update: (dt) =>
    --walking
    for i, v in ipairs @controls
      with love.keyboard
        if .isDown v.left
          game.signal.emit 'player-walk', i, dt, -1
        elseif .isDown v.right
          game.signal.emit 'player-walk', i, dt, 1

  keypressed: (key) =>
    --jumping
    for i, v in ipairs @controls
      if key == v.jump
        game.signal.emit 'player-jump', i

  keyreleased: (key) =>
    --end jump
    for i, v in ipairs @controls
      if key == v.jump
        game.signal.emit 'player-end-jump', i
