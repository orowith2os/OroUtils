#!/usr/bin/env bash

# Sets a specific AMD driver to use for a command. 
#
# `$ amd-vk-picker.sh vulkan_radv/vulkan_amdvlk/vulkan_radv`

ICDDIR='/usr/share/vulkan/icd.d'

export DISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1=1


if [[ $(basename $0) == vk_radv ]]; then

    export VK_ICD_FILENAMES="${ICDDIR}/radeon_icd.i686.json:${ICDDIR}/radeon_icd.x86_64.json"

elif [[ $(basename $0) == vk_amdvlk ]]; then

    export VK_ICD_FILENAMES="${ICDDIR}/amd_icd32.json:${ICDDIR}/amd_icd64.json"

elif [[ $(basename $0) == vk_pro ]]; then

    export VK_ICD_FILENAMES="${ICDDIR}/amd_pro_icd32.json:${ICDDIR}/amd_pro_icd64.json"

else
    echo "Unknown driver choice"
    exit 1
fi


'$@'
