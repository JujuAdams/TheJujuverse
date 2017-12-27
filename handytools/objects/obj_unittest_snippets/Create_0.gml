/// @description  Test suite init
unittest_suite_init();

///Test string_explode and array_implode
test = string_explode(";", "this;ís; a ; 1234 test;;;");
unittest_assert_same("this", test[0]);
unittest_assert_same("ís", test[1]); //Mind the í and not i.
unittest_assert_same(" 1234 test", test[3]);

test2 = string_explode("--", "this-is--a--1234--test---withDashes--");
unittest_assert_same("this-is", test2[0]); //#4
unittest_assert_same("a", test2[1]);
unittest_assert_same("-withDashes", test2[4]);

//Check count
test3 = string_explode(" ", "a b c d e");
unittest_assert_same(5, array_length_1d(test3));
unittest_assert_same("a", test3[0]);
unittest_assert_same("b", test3[1]);
unittest_assert_same("c", test3[2]);
unittest_assert_same("d", test3[3]);
unittest_assert_same("e", test3[4]);

ar3[0] = "Hi";
ar3[1] = 123;
ar3[2] = "just testing";
testarr = array_implode(";", ar3);
unittest_assert_same("Hi;123;just testing", testarr);
testarr = array_implode("--++--", ar3);
unittest_assert_same("Hi--++--123--++--just testing", testarr);

ar3[0] = "Hi";
ar3[1] = 123;
ar3[5] = "test";
ar3[20] = "just testing";

//GM Does not support missing index in an array. Fills them with "0".
unittest_assert_same("Hi;123;just testing;0;0;test;0;0;0;0;0;0;0;0;0;0;0;0;0;0;just testing", array_implode(";", ar3))

test = string_explode(";", "No seperator");
unittest_assert_same("No seperator", test[0]); //#10

///Test string_reverse
unittest_assert_same(".gnitseT", string_reverse("Testing."));

///Test string_mask
unittest_assert_same("••••••", string_mask("•", "secret"));
unittest_assert_same("************", string_mask("**", "secret"));

///Test url_encode and url_decode
unittest_assert_same(3847, hextodec(dectohex(3847)));
unittest_assert_same(255, hextodec("FF"));
unittest_assert_same(0, hextodec("00"));
unittest_assert_same("0", dectohex(0)); //#17
unittest_assert_same("FF", dectohex(255));
unittest_assert_same("BADA55", dectohex(12245589));
unittest_assert_same("%20%20", url_encode("  ")); //#20
unittest_assert_same("a%20%20", url_encode("a  "));
unittest_assert_same("a%20%20a", url_encode("a  a"));
unittest_assert_same("a%20b%20a", url_encode("a b a"));

unittest_assert_same("  ", url_decode("%20%20")); //#24
unittest_assert_same(" a ", url_decode("%20a%20"));
unittest_assert_same("a  ", url_decode("a%20%20")); //#26
unittest_assert_same("  a", url_decode("%20%20a"));
unittest_assert_same("a b a", url_decode("a%20b%20a"));

unittest_assert_same("%20%7B%7D%5B%5D%7C%5C%5E%60%22%23%25%3C%3E%3B%2F%40%24%3D%3A%3F%26", url_encode(" {}[]|\\^`\"#%<>;/@$=:?&"));
unittest_assert_same(" {}[]|\\^`\"#%<>;/@$=:?&", url_decode("%20%7B%7D%5B%5D%7C%5C%5E%60%22%23%25%3C%3E%3B%2F%40%24%3D%3A%3F%26"));

unittest_assert_same("!%40%23%24%25%5E%26*()~%60129087%3F%3Fasdfjkh", url_encode("!@#$%^&*()~`129087??asdfjkh"));
unittest_assert_same("!@#$%^&*()~`129087??asdfjkh", url_decode("!%40%23%24%25%5E%26*()~%60129087%3F%3Fasdfjkh"));

urltestultimate = "(**(&hil&*O\" \"\"äë\"4ïlk@)?♣C{◙] ";
unittest_assert_same(urltestultimate, url_decode(url_encode(urltestultimate)));

///Test string_ends_with and string_starts_with
unittest_assert_same(true, string_ends_with("Hiya test", "test")); //34
unittest_assert_same(true, string_ends_with("Hiya t", "t"));
unittest_assert_same(true, string_ends_with("Hiya test", "Hiya test"));
unittest_assert_same(true, string_ends_with("Hiya test", " test"));
unittest_assert_same(true, string_ends_with("Hiya test", ""));

unittest_assert_same(false, string_ends_with("Hiya test", "a"));
unittest_assert_same(false, string_ends_with("Hiya test", "hiya test")); //40

unittest_assert_same(false, string_starts_with("Hiya test", "hiya")); //41
unittest_assert_same(false, string_starts_with("Hiya test", "h")); //42
unittest_assert_same(true, string_starts_with("Hiya test", "")); //43
unittest_assert_same(true, string_starts_with("Hiya test", "H")); //44
unittest_assert_same(true, string_starts_with("Hiya test", "Hiya")); //45
unittest_assert_same(true, string_starts_with("Hiya test", "Hiya test")); //#46

unittest_assert_same(true, string_ends_with("", ""));
unittest_assert_same(false, string_ends_with("", "a"));
unittest_assert_same(true, string_ends_with("A", ""));
unittest_assert_same(false, string_ends_with("testing", "longtesting")); //50

unittest_assert_same(true, string_starts_with("", ""));
unittest_assert_same(false, string_starts_with("", "a"));
unittest_assert_same(true, string_starts_with("A", ""));
unittest_assert_same(false, string_starts_with("testing", "longtesting"));

unittest_assert_same(true, string_ends_with("A", "A"));
unittest_assert_same(true, string_ends_with("a", "a"));
unittest_assert_same(false, string_ends_with("A", "a"));

unittest_assert_same(true, string_starts_with("a", "a"));
unittest_assert_same(true, string_starts_with("A", "A"));
unittest_assert_same(false, string_starts_with("A", "a"));

///test round_whole
unittest_assert_same(10, round_whole(10, 10));
unittest_assert_same(20, round_whole(20, 10));
unittest_assert_same(1230, round_whole(1234, 10));
unittest_assert_same(1240, round_whole(1235, 10));
unittest_assert_same(1230, round_whole(1234.99, 10));
unittest_assert_same(0, round_whole(.9, 10));
unittest_assert_same(92891, round_whole(92891.1, 1));

///test string_append and string_prepend
unittest_assert_same("0000001234", string_prepend(1234, 0, 10));
unittest_assert_same("01234", string_prepend(1234, 0, 5));
unittest_assert_same("1234567", string_prepend(1234567, 0, 5));
unittest_assert_same( "***te", string_prepend("te", "*", 5));
unittest_assert_same( "testing", string_prepend("testing", "*", 3));
unittest_assert_same( "testing", string_prepend("testing", "*", 0));
unittest_assert_same( "**********", string_prepend("test", "*****", 10)); //Too long
unittest_assert_same("******test", string_prepend("test", "*", 10));

unittest_assert_same("1234000000", string_append(1234, 0, 10));
unittest_assert_same("12340", string_append(1234, 0, 5));
unittest_assert_same( "1234567", string_append(1234567, 0, 5));
unittest_assert_same("te***", string_append("te", "*", 5));
unittest_assert_same("testing", string_append("testing", "*", 3));
unittest_assert_same("testing", string_append("testing", "*", 0));
unittest_assert_same("123*-*-*-*", string_append(123, "*-", 10));

show_debug_message(string(global.testnumber) + " - STR 14000");
unittest_assert_same("00014", string_zero_padded("14", 5));
unittest_assert_same("00140", string_zero_padded("140", 5));
unittest_assert_same("01400", string_zero_padded("1400", 5));
unittest_assert_same("0TEST", string_zero_padded("TEST", 5));
unittest_assert_same("0TEST", string_zero_padded("0TEST", 5));
unittest_assert_same("00TEST", string_zero_padded("0TEST", 6));

show_debug_message(string(global.testnumber) + " - STR 14000  222");
unittest_assert_same("14   ", string_space_padded_right("14", 5));
unittest_assert_same("14   ", string_space_padded_right("14 ", 5));
unittest_assert_same("14   ", string_space_padded_right("14  ", 5));
unittest_assert_same("14   ", string_space_padded_right("14   ", 5));

show_debug_message(string(global.testnumber) + " - STR 14000  4444");
unittest_assert_same("   14", string_space_padded("14", 5));
unittest_assert_same("   14", string_space_padded(" 14", 5));
unittest_assert_same("   14", string_space_padded("  14", 5));
unittest_assert_same("   14", string_space_padded("   14", 5));



///End testsuite
unittest_suite_end();


