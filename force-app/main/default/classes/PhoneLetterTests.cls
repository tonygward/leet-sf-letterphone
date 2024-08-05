@isTest
public with sharing class PhoneLetterTests {

    @IsTest
    static void invalidDigits(){
        PhoneLetter phone = new PhoneLetter();
        System.Assert.areEqual(new List<String>(), phone.dial('0'));
        System.Assert.areEqual(new List<String>(), phone.dial('1'));
        System.Assert.areEqual(new List<String>(), phone.dial('*'));
        System.Assert.areEqual(new List<String>(), phone.dial('#'));
    }

    @IsTest
    static void returnsLetters(){
        PhoneLetter phone = new PhoneLetter();
        System.Assert.areEqual(new List<String> { 'a', 'b', 'c' }, phone.dial('2'));
        System.Assert.areEqual(new List<String> { 'd', 'e', 'f' }, phone.dial('3'));
        System.Assert.areEqual(new List<String> { 'g', 'h', 'i' }, phone.dial('4'));
        System.Assert.areEqual(new List<String> { 'j', 'k', 'l' }, phone.dial('5'));
        System.Assert.areEqual(new List<String> { 'm', 'n', 'o' }, phone.dial('6'));
        System.Assert.areEqual(new List<String> { 'p', 'q', 'r', 's' }, phone.dial('7'));
        System.Assert.areEqual(new List<String> { 't', 'u', 'v' }, phone.dial('8'));
        System.Assert.areEqual(new List<String> { 'w', 'x', 'y', 'z' }, phone.dial('9'));
    }

    @IsTest
    static void multiDigits(){
        PhoneLetter phone = new PhoneLetter();
        System.Assert.areEqual(new List<String>
            { 'ad', 'ae', 'af', 'bd', 'be', 'bf', 'cd', 'ce', 'cf' },
            phone.dial('23'));
    }

    // #region IterableString

    @IsTest
    static void iterableEmptyValue(){
        PhoneLetter.IterableString actual = new PhoneLetter.IterableString(null);
        System.Assert.areEqual(false, actual.hasNext());
    }

    @IsTest
    static void iterableSingleDigit(){
        PhoneLetter.IterableString actual = new PhoneLetter.IterableString('a');
        System.Assert.areEqual(true, actual.hasNext());
        System.Assert.areEqual('a', actual.next());
    }

    @IsTest
    static void iterableTwoDigit(){
        PhoneLetter.IterableString actual = new PhoneLetter.IterableString('ab');
        System.Assert.areEqual('a', actual.next());
        System.Assert.areEqual('b', actual.next());
        System.Assert.areEqual(false, actual.hasNext());
    }

    // #endregion
}