vim.g.vrc_set_default_mapping = 0
vim.g.vrc_response_default_content_type = 'application/json'
vim.g.vrc_output_buffer_name = 'vrc_response_buffer.json'
vim.g.vrc_auto_format_response_patterns = {
  json = "jq",
}

local function get_opened_buffer_names()
  local buffer_names = {} 

  for _, buf_handle in ipairs(vim.api.nvim_list_bufs()) do
    local buf_name = vim.api.nvim_buf_get_name(buf_handle)
    table.insert(buffer_names, buf_name)
  end

  return buffer_names
end

local function get_buffer_number_from_name(name) 
  for _, buf_handle in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(buf_handle) == name then
      return buf_handle
    end
  end

  return nil
end
 
function save_set_cookie_lines()
  local buffers = get_opened_buffer_names()

  local json_buffer = nil
  for _, buffer in ipairs(buffers) do
    if buffer:match("%.json$") then
      json_buffer = buffer
      break
    end
  end

  if json_buffer == nil then return end

  local found_buffer = get_buffer_number_from_name(json_buffer)
  if found_buffer == nil then return end

  -- Get lines in json buffer
  local json_lines = vim.api.nvim_buf_get_lines(found_buffer, 0, -1, false)
  if #json_lines > 0 then 
    lines = {}
    for i, line in ipairs(json_lines) do
      if line:find("Set-Cookie", 1, true) == 1 then
        value = string.gsub(line, "Set%-", "", 1)

        table.insert(lines, value)
      end
    end

    if #lines == 0 then return end

    local f = io.open("cookies.txt", "w")
    f:write(table.concat(lines, "\n"))
    f:close()
  else 
    -- wait for buffer to be loaded
    vim.defer_fn(save_set_cookie_lines, 200)
  end
end

vim.cmd([[
  autocmd BufAdd *.json lua save_set_cookie_lines()
]])

