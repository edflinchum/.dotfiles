#!/usr/bin/env python

import yaml
import os
import re


CONFIG_FILE_NAME = "alacritty-colors.yml"
CONFIG_FILE_DIR = os.path.expanduser("~/.config/alacritty/")
CONFIG_FILE_PATH = os.path.join(CONFIG_FILE_DIR, CONFIG_FILE_NAME)

OPACITY_LINE_SEARCH = "  opacity: (\S+)"
OPACITY_LINE_TEMPLATE = "  opacity: {}\n"

with open(CONFIG_FILE_PATH, "r") as config_file:
    config = yaml.safe_load(config_file)
    config_file.seek(0)
    lines = config_file.readlines()

OPACITY_line_index = -1
for i, line in enumerate(lines):
    match = re.search(OPACITY_LINE_SEARCH, line)
    if match is not None:
        current_OPACITY = match.group(1)
        OPACITY_line_index = i

available_OPACITYs = [str(round(float(x*0.025), 3)) for x in range(41)]

OPACITY_index = available_OPACITYs.index(current_OPACITY)
OPACITY_index = \
    (OPACITY_index + 1) % len(available_OPACITYs)

lines[OPACITY_line_index] = OPACITY_LINE_TEMPLATE.format(
    available_OPACITYs[OPACITY_index])

with open(CONFIG_FILE_PATH, "w") as config_file:
    for line in lines:
        config_file.write(line)
