local M = {}

M.name = 'presets'

M.operators = {
  preset = true,
  mode = { 'n', 'x' },
  { '!', desc = 'Run Program', icon = { icon = '󰜎', color = 'blue' } },
  { '<', desc = 'Indent Left', icon = { icon = '󰶢', color = 'cyan' } },
  { '>', desc = 'Indent Right', icon = { icon = '󰔰', color = 'cyan' } },
  { 'V', desc = 'Visual Line', icon = { icon = '󱊃', color = 'grey' } },
  { 'c', desc = 'Change', icon = { icon = '󱓠', color = 'blue' } },
  { 'd', desc = 'Delete', icon = { icon = '󱊙', color = 'blue' } },
  { 'gU', desc = 'Uppercase', icon = { icon = '󰬶', color = 'cyan' } },
  { 'gu', desc = 'Lowercase', icon = { icon = '󰬵', color = 'cyan' } },
  { 'g~', desc = 'Toggle Case' },
  { 'gw', desc = 'Format', icon = { icon = '󰉢', color = 'cyan' } },
  { 'r', desc = 'Replace', icon = { icon = '󰛔', color = 'blue' } },
  { 'v', desc = 'Visual', icon = { icon = '󰒉', color = 'grey' } },
  { 'y', desc = 'Yank', icon = { icon = '󰆏', color = 'blue' } },
  { 'zf', desc = 'Create Fold', icon = { icon = '󱃭', color = 'blue' } },
  { '~', desc = 'Toggle Case' },
}

M.motions = {
  mode = { 'o', 'x', 'n' },
  preset = true,
  { '$', desc = 'End of Line', icon = { icon = '󰾸', color = 'blue' } },
  { '%', desc = 'Matching (){}[]', icon = { icon = '󰨿', color = 'blue' } },
  { '0', desc = 'Start of Line', icon = { icon = '󰾺', color = 'blue' } },
  { 'F', desc = 'Move to Prev Char', icon = { icon = '󱦵', color = 'blue' } },
  { 'G', desc = 'Last Line', icon = { icon = '󰝓', color = 'blue' } },
  { 'T', desc = 'Move Before Prev Char', icon = { icon = '󱦵', color = 'blue' } },
  { '^', desc = 'Start of Line (non ws)', icon = { icon = '󰾺', color = 'blue' } },
  { 'b', desc = 'Prev Word', icon = { icon = '󱦵', color = 'blue' } },
  { 'e', desc = 'Next End of Word', icon = { icon = '󱦷', color = 'blue' } },
  { 'f', desc = 'Move to Next Char', icon = { icon = '󱦷', color = 'blue' } },
  { 'ge', desc = 'Prev End of Word', icon = { icon = '󱦵', color = 'blue' } },
  { 'gg', desc = 'First Line', icon = { icon = '󰝕', color = 'blue' } },
  { 'h', desc = 'Left', icon = { icon = '󰅁', color = 'blue' } },
  { 'j', desc = 'Down', icon = { icon = '󰅀', color = 'blue' } },
  { 'k', desc = 'Up', icon = { icon = '󰅃', color = 'blue' } },
  { 'l', desc = 'Right', icon = { icon = '󰅂', color = 'blue' } },
  { 't', desc = 'Move Before Next Char', icon = { icon = '󱦷', color = 'blue' } },
  { 'w', desc = 'Next Word', icon = { icon = '󱦷', color = 'blue' } },
  { '{', desc = 'Prev Empty Line', icon = { icon = '󱦵', color = 'blue' } },
  { '}', desc = 'Next Empty Line', icon = { icon = '󱦷', color = 'blue' } },
  { ';', desc = 'Next ftFT', icon = { icon = '󱦷', color = 'blue' } },
  { ',', desc = 'Prev ftFT', icon = { icon = '󱦵', color = 'blue' } },
  { '/', desc = 'Search Forward', icon = { icon = '󱩾', color = 'green' } },
  { '?', desc = 'Search Backward', icon = { icon = '󱩾', color = 'green' } },
  { 'B', desc = 'Prev WORD', icon = { icon = '󱦵', color = 'blue' } },
  { 'E', desc = 'Next End of WORD', icon = { icon = '󱦷', color = 'blue' } },
  { 'W', desc = 'Next WORD', icon = { icon = '󱦷', color = 'blue' } },
}

M.text_objects = {
  mode = { 'o', 'x' },
  preset = true,
  { 'a', group = 'around' },
  { 'a"', desc = '" String' },
  { "a'", desc = "' String" },
  { 'a(', desc = '[(]) Block' },
  { 'a)', desc = '[(]) Block' },
  { 'a<', desc = '<> Block' },
  { 'a>', desc = '<> Block' },
  { 'aB', desc = '[{]} Block' },
  { 'aW', desc = 'WORD with ws' },
  { 'a[', desc = '[] Block' },
  { 'a]', desc = '[] Block' },
  { 'a`', desc = '` String' },
  { 'ab', desc = '[(]) Block' },
  { 'ap', desc = 'Paragraph' },
  { 'as', desc = 'Sentence' },
  { 'at', desc = 'Tag Block' },
  { 'aw', desc = 'Word with ws' },
  { 'a{', desc = '[{]} Block' },
  { 'a}', desc = '[{]} Block' },
  { 'i', group = 'inside' },
  { 'i"', desc = 'Inner " String' },
  { "i'", desc = "Inner ' String" },
  { 'i(', desc = 'Inner [(])' },
  { 'i)', desc = 'Inner [(])' },
  { 'i<', desc = 'Inner <>' },
  { 'i>', desc = 'Inner <>' },
  { 'iB', desc = 'Inner [{]}' },
  { 'iW', desc = 'Inner WORD' },
  { 'i[', desc = 'Inner []' },
  { 'i]', desc = 'Inner []' },
  { 'i`', desc = 'Inner ` String' },
  { 'ib', desc = 'Inner [(])' },
  { 'ip', desc = 'Inner Paragraph' },
  { 'is', desc = 'Inner Sentence' },
  { 'it', desc = 'Inner Tag Block' },
  { 'iw', desc = 'Inner Word' },
  { 'i{', desc = 'Inner [{]}' },
  { 'i}', desc = 'Inner [{]}' },
}

M.windows = {
  preset = true,
  mode = { 'n', 'x' },
  { '<c-w>', group = 'window' },
  { '<c-w>+', desc = 'Increase Height', icon = { icon = '󰐕', color = 'blue' } },
  { '<c-w>-', desc = 'Decrease Height', icon = { icon = '󰍴', color = 'blue' } },
  { '<c-w><', desc = 'Decrease Width', icon = { icon = '󰍴', color = 'blue' } },
  { '<c-w>=', desc = 'Equally High and Wide', icon = { icon = '󰇼', color = 'blue' } },
  { '<c-w>>', desc = 'Increase Width', icon = { icon = '󰐕', color = 'blue' } },
  { '<c-w>T', desc = 'Break Out into a New Tab', icon = { icon = '󰓩', color = 'blue' } },
  { '<c-w>_', desc = 'Max Out The Height', icon = { icon = '󰊓', color = 'blue' } },
  { '<c-w>h', desc = 'Go to the Left Window', icon = { icon = '󰮹', color = 'blue' } },
  { '<c-w>j', desc = 'Go to the Down Window', icon = { icon = '󰮷', color = 'blue' } },
  { '<c-w>k', desc = 'Go to the Up Window', icon = { icon = '󰮽', color = 'blue' } },
  { '<c-w>l', desc = 'Go to the Right Window', icon = { icon = '󰮺', color = 'blue' } },
  { '<c-w>o', desc = 'Close All Other Windows', icon = { icon = '󰅖', color = 'blue' } },
  { '<c-w>q', desc = 'Quit a Window', icon = { icon = '󰅖', color = 'blue' } },
  { '<c-w>s', desc = 'Split Window', icon = { icon = '󰤻', color = 'blue' } },
  { '<c-w>v', desc = 'Split Window Vertically', icon = { icon = '󰤼', color = 'blue' } },
  { '<c-w>w', desc = 'Switch Windows', icon = { icon = '󰙕', color = 'blue' } },
  { '<c-w>x', desc = 'Swap Current with Next', icon = { icon = '󰓡', color = 'blue' } },
  { '<c-w>|', desc = 'Max Out the Width', icon = { icon = '󰊓', color = 'blue' } },
  { '<c-w>H', desc = 'Move Window to Far left', icon = { icon = '󰮹', color = 'blue' } },
  { '<c-w>J', desc = 'Move Window to Far bottom', icon = { icon = '󰮷', color = 'blue' } },
  { '<c-w>K', desc = 'Move Window to Far top', icon = { icon = '󰮽', color = 'blue' } },
  { '<c-w>L', desc = 'Move Window to Far right', icon = { icon = '󰮺', color = 'blue' } },
}

M.z = {
  preset = true,
  { 'z<CR>', desc = 'Top This Line', icon = { icon = '󰅃', color = 'blue' } },
  { 'z=', desc = 'Spelling Suggestions', icon = { icon = '󰓆', color = 'blue' } },
  { 'zA', desc = 'Toggle All Folds Under Cursor' },
  { 'zC', desc = 'Close All Folds Under Cursor', icon = { icon = '󰉓', color = 'blue' } },
  { 'zD', desc = 'Delete All Folds Under Cursor', icon = { icon = '󰗩', color = 'blue' } },
  { 'zE', desc = 'Delete All Folds In File', icon = { icon = '󰗩', color = 'blue' } },
  { 'zH', desc = 'Half Screen to the Left', icon = { icon = '󱂪', color = 'blue' } },
  { 'zL', desc = 'Half Screen to the Right', icon = { icon = '󱂫', color = 'blue' } },
  { 'zM', desc = 'Close All Folds', icon = { icon = '󰉓', color = 'blue' } },
  { 'zO', desc = 'Open All Folds Under Cursor', icon = { icon = '󰝰', color = 'blue' } },
  { 'zR', desc = 'Open All Folds', icon = { icon = '󰝰', color = 'blue' } },
  { 'za', desc = 'Toggle Fold Under Cursor' },
  { 'zb', desc = 'Bottom This Line', icon = { icon = '󰅀', color = 'blue' } },
  { 'zc', desc = 'Close Fold Under Cursor', icon = { icon = '󰉓', color = 'blue' } },
  { 'zd', desc = 'Delete Fold Under Cursor', icon = { icon = '󰗩', color = 'blue' } },
  { 'ze', desc = 'Right This Line', icon = { icon = '󰅂', color = 'blue' } },
  { 'zg', desc = 'Add Word to Spell List', icon = { icon = '󰓆', color = 'blue' } },
  { 'zi', desc = 'Toggle Folding' },
  { 'zm', desc = 'Fold More', icon = { icon = '󰉓', color = 'blue' } },
  { 'zo', desc = 'Open Fold Under Cursor', icon = { icon = '󰝰', color = 'blue' } },
  { 'zr', desc = 'Fold Less', icon = { icon = '󰉋', color = 'blue' } },
  { 'zs', desc = 'Left This Line', icon = { icon = '󰅁', color = 'blue' } },
  { 'zt', desc = 'Top This Line', icon = { icon = '󰅃', color = 'blue' } },
  { 'zv', desc = 'Show Cursor Line', icon = { icon = '󰗧', color = 'blue' } },
  { 'zw', desc = 'Mark Word as Bad/Misspelling', icon = { icon = '󱇁', color = 'blue' } },
  { 'zx', desc = 'Update Folds', icon = { icon = '󱧰', color = 'blue' } },
  { 'zz', desc = 'Center This Line', icon = { icon = '󰘢', color = 'blue' } },
}

M.nav = {
  preset = true,
  { 'H', desc = 'Home Line of Window (Top)', icon = { icon = '󰝕', color = 'blue' } },
  { 'L', desc = 'Last Line of Window', icon = { icon = '󰝓', color = 'blue' } },
  { 'M', desc = 'Middle line of window', icon = { icon = '󰝔', color = 'blue' } },
  { '[%', desc = 'Previous Unmatched Group', icon = { icon = '󱦵', color = 'blue' } },
  { '[(', desc = 'Previous (', icon = { icon = '󱦵', color = 'blue' } },
  { '[<', desc = 'Previous <', icon = { icon = '󱦵', color = 'blue' } },
  { '[M', desc = 'Previous Method End', icon = { icon = '󱦵', color = 'blue' } },
  { '[m', desc = 'Previous Method Start', icon = { icon = '󱦵', color = 'blue' } },
  { '[s', desc = 'Previous Misspelled Word', icon = { icon = '󱦵', color = 'blue' } },
  { '[{', desc = 'Previous {', icon = { icon = '󱦵', color = 'blue' } },
  { ']%', desc = 'Next unmatched group', icon = { icon = '󱦷', color = 'blue' } },
  { '](', desc = 'Next (', icon = { icon = '󱦷', color = 'blue' } },
  { ']<', desc = 'Next <', icon = { icon = '󱦷', color = 'blue' } },
  { ']M', desc = 'Next Method End', icon = { icon = '󱦷', color = 'blue' } },
  { ']m', desc = 'Next Method Start', icon = { icon = '󱦷', color = 'blue' } },
  { ']s', desc = 'Next Misspelled Word', icon = { icon = '󱦷', color = 'blue' } },
  { ']{', desc = 'Next {', icon = { icon = '󱦷', color = 'blue' } },
}

M.g = {
  preset = true,
  { 'g%', desc = 'Cycle Backwards Through Results', icon = { icon = '󰑥', color = 'blue' } },
  { 'g,', desc = 'Go to [count] Newer Position in Change List', icon = { icon = '󰉹', color = 'blue' } },
  { 'g;', desc = 'Go to [count] Older Position in Change List', icon = { icon = '󰉹', color = 'blue' } },
  { 'gN', desc = 'Search Backwards and Select', icon = { icon = '󱈅', color = 'blue' } },
  { 'gT', desc = 'Go to Previous Tab Page', icon = { icon = '󰌥', color = 'blue' } },
  { 'gf', desc = 'Go to File Under Cursor', icon = { icon = '󰈔', color = 'blue' } },
  { 'gi', desc = 'Go to Last Insert', icon = { icon = '󰗧', color = 'blue' } },
  { 'gn', desc = 'Search Forwards and Select' },
  { 'gt', desc = 'Go to Next Tab Page', icon = { icon = '󰌒', color = 'blue' } },
  { 'gv', desc = 'Last Visual Selection', icon = { icon = '󱊃', color = 'grey' } },
  { 'gx', desc = 'Open File with System App', icon = { icon = '󰏋', color = 'grey' } },
}

function M.setup(opts)
  local wk = require('which-key')

  if opts.operators then
    wk.add(M.operators)
  end

  if opts.motions then
    wk.add(M.motions)
  end

  if opts.text_objects then
    wk.add(M.text_objects)
  end

  for _, preset in pairs({ 'windows', 'nav', 'z', 'g' }) do
    if opts[preset] ~= false then
      wk.add(M[preset])
    end
  end
end

return M
