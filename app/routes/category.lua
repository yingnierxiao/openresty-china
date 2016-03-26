local pairs = pairs
local ipairs = ipairs
local lor = require("lor.index")
local user_model = require("app.model.user")
local topic_model = require("app.model.topic")
local comment_model = require("app.model.comment")
local category_router = lor:Router()


category_router:get("/:category_id", function(req, res, next)
	local current_category = req.params.category_id

	if current_category == "1" then
		return res:redirect("/share")
	elseif current_category == "2" then
		return res:redirect("/ask")
	elseif current_category == "3" then
		return res:redirect("/lua")
	elseif current_category == "4" then
		return res:redirect("/skynet")
	elseif current_category == "5" then
		return res:redirect("/openresty")
	elseif current_category == "6" then
		return res:redirect("/cocos2dx")
	end

    local comment_count = comment_model:get_total_count()
    local topic_count = topic_model:get_all_count()
    local user_count = user_model:get_total_count()
    res:render("index", {
		user_count = user_count,
		topic_count = topic_count,
		comment_count = comment_count,
		current_category = current_category
    })
end)



return category_router
