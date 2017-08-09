xquery version "1.0" encoding "utf-8";

declare variable $string as xs:string external;
declare variable $substring as xs:string external;

declare function local:func($string as xs:string, 
                            $substring as xs:string) 
                            as xs:integer* {
    if (contains($string, $substring))
  then (string-length(substring-before($string, $substring))+1,
        for $other in
           local:func(substring-after($string, $substring),
                               $substring)
        return
          $other +
          string-length(substring-before($string, $substring)) +
          string-length($substring))
  else ()
};

local:func($string, $substring)
