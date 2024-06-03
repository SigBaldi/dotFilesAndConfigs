#!/bin/bash

manage_dotfile_or_config() {
    edit_dotfile_or_config "$1"
    update_dotfile_or_config "$1"
}

manage_dotfile_or_config "$1"
