context("as.ft_data")

# clean out cache first
ftxt_cache$delete_all()

test_that("as.ft_data works", {
  skip_on_cran()

  # with empty cache
  aa <- as.ft_data()

  expect_is(aa, "ft_data")
  expect_named(aa, "cached")
  expect_equal(length(aa$cached$data), 0)
  expect_equal(NROW(aa$cached$error), 0)


  # with non-empty cache
  ## download a paper first
  bb <- sm(ft_get('10.7717/peerj.228'))
  aa <- as.ft_data()

  expect_is(aa, "ft_data")
  expect_named(aa, "cached")
  expect_equal(length(aa$cached$data), 1)
  expect_named(aa$cached$data, "path")
  expect_equal(NROW(aa$cached$error), 0)
})

test_that("as.ft_data fails well", {
  skip_on_cran()

  expect_error(as.ft_data(5), "invalid filename argument")
})
