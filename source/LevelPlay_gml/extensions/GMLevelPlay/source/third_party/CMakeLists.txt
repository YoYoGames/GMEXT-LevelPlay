cmake_minimum_required(VERSION 3.18)

# =============================================================================
# third_party template (production-ready) - Single INTERFACE target:
# ext_third_party - Per-platform imported libs with sensible defaults - Easy
# toggles for Apple Framework/XCFramework vs .dylib - Android AAR (Prefab) or
# raw per-ABI .so; auto-extract with stamp - Publishes: * EXT_TP_RUNTIME_DLLS
# (list of runtime binaries the parent may copy) * EXT_TP_ANDROID_AAR   (aar
# path if consumed; parent can add Gradle dep) - Comment/uncomment “OPTIONAL
# SECTIONS” to fit your SDK
# =============================================================================

# -----------------------------------------------------------------------------
# Core "bag of usage requirements" your main target links to
# -----------------------------------------------------------------------------
add_library(ext_third_party INTERFACE)

# -----------------------------------------------------------------------------
# SDK root + generic knobs
# -----------------------------------------------------------------------------
set(SDK_ROOT
    ""
    CACHE PATH "Path to the SDK root (override as needed)")
# You can also support env vars by defaulting from environment if unset:
if(NOT SDK_ROOT)
  # Example default: third_party/../../../../../discord_social_sdk
  get_filename_component(
    SDK_ROOT "${CMAKE_CURRENT_LIST_DIR}/../../../../../discord_social_sdk"
    ABSOLUTE)
endif()

# Basename without prefixes (lib) or suffixes (.so/.dylib/.dll); adapt as
# needed.
set(SDK_BASENAME
    "discord_partner_sdk"
    CACHE STRING "Base name of the third-party library")

# Include subdir under SDK_ROOT (set to empty if headers are flat at root)
set(SDK_INCLUDE_SUBDIR
    "include"
    CACHE STRING "Include subfolder relative to SDK_ROOT")

# Common include directory wiring (platform-gated where it matters)
target_include_directories(
  ext_third_party
  INTERFACE $<$<BOOL:${SDK_INCLUDE_SUBDIR}>:${SDK_ROOT}/${SDK_INCLUDE_SUBDIR}>
            $<$<NOT:$<BOOL:${SDK_INCLUDE_SUBDIR}>>:${SDK_ROOT}>)

# Common compile defs (adjust or remove)
target_compile_definitions(ext_third_party INTERFACE HAVE_THIRDPARTY_FEATURE=1)

# List of runtime files to bubble up to parent
set(_EXT_TP_RUNTIME_DLLS "")

# Helper: map single-configs to Release
set(_MAP_REL_CONFIGS "Release")
# Helper macro to append runtime(s)
function(_ext_tp_append_runtime)
  foreach(_f IN LISTS ARGN)
    if(_f)
      list(APPEND _EXT_TP_RUNTIME_DLLS "${_f}")
    endif()
  endforeach()
  set(_EXT_TP_RUNTIME_DLLS
      "${_EXT_TP_RUNTIME_DLLS}"
      PARENT_SCOPE)
endfunction()

message(STATUS "[third_party] SDK_ROOT = ${SDK_ROOT}")
message(STATUS "[third_party] SDK_BASENAME = ${SDK_BASENAME}")


# =============================================================================
# APPLE: split macOS vs iOS/tvOS
# =============================================================================
if(APPLE)
  # ----------------------
  # iOS / tvOS (mobile)
  # ----------------------
  if((CMAKE_OSX_SYSROOT MATCHES "iphone"))

    get_filename_component(EXT_GM_PARENT_DIR "${EXT_GM_XCODEPROJ_OVERRIDE}" DIRECTORY)

    set(IRONSOURCE_XCFRAMEWORK "${EXT_GM_PARENT_DIR}/Pods/IronSourceSDK/IronSource/IronSource.xcframework")

         #message(FATAL_ERROR "HERE: ${IRONSOURCE_XCFRAMEWORK} ???")


    if(NOT EXISTS "${IRONSOURCE_XCFRAMEWORK}")
      message(FATAL_ERROR "[third_party] Missing IronSource XCFramework at: ${IRONSOURCE_XCFRAMEWORK}")
    endif()

    # ---- Choose the correct slice based on the SDK (device vs simulator) ----
    # CMAKE_OSX_SYSROOT typically contains iPhoneOS / iPhoneSimulator / AppleTVOS / AppleTVSimulator
    if(CMAKE_OSX_SYSROOT MATCHES "simulator")
      set(_SLICE_DIR "${IRONSOURCE_XCFRAMEWORK}/ios-arm64_x86_64-simulator")
      if(NOT EXISTS "${_SLICE_DIR}")
        # Some vendors use arm64-only simulator slices on newer toolchains
        set(_SLICE_DIR "${IRONSOURCE_XCFRAMEWORK}/ios-arm64-simulator")
      endif()
    else()
      set(_SLICE_DIR "${IRONSOURCE_XCFRAMEWORK}/ios-arm64")
    endif()

    if(NOT EXISTS "${_SLICE_DIR}")
      message(FATAL_ERROR
        "[third_party] Could not find a suitable IronSource slice.\n"
        "XCFramework: ${IRONSOURCE_XCFRAMEWORK}\n"
        "Tried slice: ${_SLICE_DIR}\n"
        "Sysroot: ${CMAKE_OSX_SYSROOT}"
      )
    endif()

    set(_FW_DIR "${_SLICE_DIR}/IronSource.framework")
    if(NOT EXISTS "${_FW_DIR}")
      message(FATAL_ERROR "[third_party] Missing framework directory: ${_FW_DIR}")
    endif()

    # Add framework search path for BOTH compile and link
    target_compile_options(ext_third_party INTERFACE
      "-F${_SLICE_DIR}"
    )

    target_link_options(ext_third_party INTERFACE
      "-F${_SLICE_DIR}"
    )

    # Link framework by name
    target_link_libraries(ext_third_party INTERFACE
      "-framework" "IronSource"
    )

    # If IronSource requires other Apple frameworks, add them here too:
    # target_link_libraries(ext_third_party INTERFACE "-framework" "AdSupport")

  # ----------------------
  # macOS (desktop)
  # ----------------------
  else()
  endif() # macOS
endif()

# =============================================================================
# (OPTIONAL) Console SDK hooks (uncomment and point to vendor toolchains)
# =============================================================================
# if(CMAKE_SYSTEM_NAME STREQUAL "ORBIS") # PS4: add imported lib and link;
# publish runtime if needed elseif(CMAKE_SYSTEM_NAME STREQUAL "Prospero") # PS5:
# similar elseif(CMAKE_SYSTEM_NAME STREQUAL "NintendoSwitch" OR DEFINED
# ENV{NINTENDO_SDK_ROOT}) # Switch: similar endif()

# =============================================================================
# Bubble up runtime list to parent
# =============================================================================
set(EXT_TP_RUNTIME_DLLS "${_EXT_TP_RUNTIME_DLLS}" PARENT_SCOPE)
