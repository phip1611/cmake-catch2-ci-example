#include <catch2/catch_test_macros.hpp>

#include <foo/foo.hpp>

TEST_CASE("adding numbers work", "[foo]")
{
    CHECK(foo::add(0, 0) == 0);
    CHECK(foo::add(0, 7) == 7);
    CHECK(foo::add(7, 0) == 7);
    CHECK(foo::add(7, 7) == 14);
}
