{ lib, ... }:
with lib;
rec {
  # POSIX.1‐2013, 3.2 Absolute Pathname
  absolute-pathname = mkOptionType {
    name = "POSIX absolute pathname";
    check = x: isString x && substring 0 1 x == "/" && pathname.check x;
    merge = mergeOneOption;
  };

  file-mode = mkOptionType {
    name = "file mode";
    check = test "[0-7]{4}";
    merge = mergeOneOption;
  };

  # POSIX.1‐2013, 3.278 Portable Filename Character Set
  filename = mkOptionType {
    name = "POSIX filename";
    check = test "([0-9A-Za-z._])[0-9A-Za-z._-]*";
    merge = mergeOneOption;
  };
}
