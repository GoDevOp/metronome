local s_match = string.match;
local log = require "util.logger".init("sasl");

module "sasl.anonymous"

--=========================
--SASL ANONYMOUS according to RFC 4505

--[[
Supported Authentication Backends

anonymous:
	function(session, realm)
		return username, error;
	end
	
]]

local function anonymous(self, message)
	local username, err;
	username, err = self.profile.anonymous(self, self.profile.session, realm);
	if err then return "failure", err; end
	self.username = username;
	return "success";
end

function init(registerMechanism)
	registerMechanism("ANONYMOUS", {"anonymous"}, anonymous);
end

return _M;
