using Test

@testset "Chapter 1" begin
  @testset "Exercise 1" begin
    using julia.Chapter1.Ex1
    @test has_unique_chars("abcdefghijk")
    @test has_unique_chars("abcpkljse")
    @test !has_unique_chars("abcabc")
    @test !has_unique_chars("aaopffdvfdf")
    @test !has_unique_chars("ploidskl")
    @test has_unique_chars("qwertyuiopasdfghjklzxcvbnm,./[];'\\\"")
    @test !has_unique_chars("?qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\"")

    @test has_unique_chars_fast("abcdefghijk")
    @test has_unique_chars_fast("abcpkljse")
    @test !has_unique_chars_fast("abcabc")
    @test !has_unique_chars_fast("aaopffdvfdf")
    @test !has_unique_chars_fast("ploidskl")
    @test has_unique_chars_fast("qwertyuiopasdfghjklzxcvbnm,./[];'\\\"")
    @test !has_unique_chars_fast("?qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\"")
  end
end
