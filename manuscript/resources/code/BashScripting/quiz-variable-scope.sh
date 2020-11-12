#!/bin/bash

bar()
{
  echo "bar1: var = $var"
  var="bar_value"
  echo "bar2: var = $var"
}

foo()
{
  local var="foo_value"

  echo "foo1: var = $var"
  bar
  echo "foo2: var = $var"
}

echo "main1: var = $var"
foo
echo "main2: var = $var"
