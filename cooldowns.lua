function PlayerName(player)
	local type = type(player)

	if type == "string" then
		return player
	elseif type == "userdata" and player:is_player() then
		return player:get_player_name()
	end
end

function rifle.init_cooldowns()
	return {
		players = {},
		set = function(self, player, time)
			local pname = PlayerName(player)

			if self.players[pname] then
				self.players[pname]:cancel()

				if not time then
					self.players[pname] = nil
					return
				end
			end

			self.players[pname] = minetest.after(time, function()
				self.players[pname] = nil
			end)
		end,
		get = function(self, player)
			return self.players[PlayerName(player)]
		end,
	}
end
