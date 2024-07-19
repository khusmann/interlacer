test_that("cfactor type will error if codes are not present", {
  expect_error(cfactor(c(1, 2), codes = c(a = 1)))
  expect_error(cfactor(c("z", "y"), codes = c(a = "z")))
})

test_that("latent cfactor ptype2 will act like factor", {
  expect_identical(
    vec_ptype2(
      latent_cfactor(codes=c(a = 1, b = 2)),
      cfactor(codes=c(c = 3, d = 4))
    ),
    factor(levels=c("a", "b", "c", "d"))
  )
  expect_identical(
    vec_ptype2(
      cfactor(codes=c(c = 3, d = 4)),
      latent_cfactor(codes=c(a = 1, b = 2))
    ),
    factor(levels=c("c", "d", "a", "b"))
  )
})

test_that("identical cfactor ptype2 will combine", {
  expect_identical(
    vec_ptype2(
      cfactor(codes=c(a = 1, b = 2)),
      cfactor(codes=c(a = 1, b = 2))
    ),
    cfactor(codes=c(a = 1, b = 2))
  )
  expect_identical(
    vec_ptype2(
      cfactor(codes=c(a = 1, b = 2), ordered = TRUE),
      cfactor(codes=c(a = 1, b = 2), ordered = TRUE)
    ),
    cfactor(codes=c(a = 1, b = 2), ordered = TRUE)
  )
})

test_that("cfactor ptype2 won't combine if ordering different", {
  expect_error(
    vec_ptype2(
      cfactor(codes=c(a = 1, b = 2), ordered = TRUE),
      cfactor(codes=c(a = 1, b = 2))
    )
  )
  expect_error(
    vec_ptype2(
      cfactor(codes=c(a = 1, b = 2), ordered = TRUE),
      cfactor(codes=c(a = 1, b = 2, c = 3), ordered = TRUE)
    )
  )
})

test_that("cfactor ptype2 will combine codes when they don't collide", {
  expect_identical(
    vec_ptype2(
      cfactor(codes=c(a = 1, b = 2)),
      cfactor(codes=c(c = 3, d = 4))
    ),
    cfactor(codes=c(a = 1, b = 2, c = 3, d = 4))
  )
  expect_identical(
    vec_ptype2(
      cfactor(codes=c(c = 3, d = 4)),
      cfactor(codes=c(a = 1, b = 2))
    ),
    cfactor(codes=c(c = 3, d = 4, a = 1, b = 2))
  )
  expect_identical(
    vec_ptype2(
      cfactor(codes=c(a = "z", b = "y")),
      cfactor(codes=c(c = "x", d = "w"))
    ),
    cfactor(codes=c(a = "z", b = "y", c = "x", d = "w"))
  )
  expect_identical(
    vec_ptype2(
      cfactor(codes=c(c = "x", d = "w")),
      cfactor(codes=c(a = "z", b = "y"))
    ),
    cfactor(codes=c(c = "x", d = "w", a = "z", b = "y"))
  )
})

test_that("cfactor ptype2 will error for code or label collisions", {
  expect_error(
    vec_ptype2(
      cfactor(codes=c(a = 1, b = 2)),
      cfactor(codes=c(c = 1, d = 4))
    )
  )
  expect_error(
    vec_ptype2(
      cfactor(codes=c(a = "z", b = "y")),
      cfactor(codes=c(c = "z", d = "w"))
    )
  )
  expect_error(
    vec_ptype2(
      cfactor(codes=c(a = 1, b = 2)),
      cfactor(codes=c(a = 3, d = 4))
    )
  )
  expect_error(
    vec_ptype2(
      cfactor(codes=c(a = "z", b = "y")),
      cfactor(codes=c(a = "x", d = "w"))
    )
  )
})

test_that("cfactor valid cast", {
  expect_identical(
    vec_cast(
      cfactor(c(1, 2, 1, 2), codes=c(a = 1, b = 2)),
      cfactor(codes=c(a = 1, b = 2, c = 3)),
    ),
    cfactor(c(1, 2, 1, 2), codes=c(a = 1, b = 2, c = 3)),
  )
})

test_that("cfactor cast identical", {
  expect_identical(
    vec_cast(
      cfactor(codes=c(a = 1, b = 2)),
      cfactor(codes=c(a = 1, b = 2)),
    ),
    cfactor(codes=c(a = 1, b = 2)),
  )
  expect_identical(
    vec_cast(
      cfactor(codes=c(a = 1, b = 2), ordered = TRUE),
      cfactor(codes=c(a = 1, b = 2), ordered = TRUE),
    ),
    cfactor(codes=c(a = 1, b = 2), ordered = TRUE),
  )
})

test_that("cfactor cast will error for code collisions", {
  expect_error(
    vec_cast(
      cfactor(codes=c(a = 1, b = 2)),
      cfactor(codes=c(a = 1, b = 3))
    )
  )
  expect_error(
    vec_cast(
      cfactor(codes=c(a = 1, b = 2)),
      cfactor(codes=c(a = 1, c = 2))
    )
  )
})

test_that("cfactor cast will error if ordered doesn't match", {
  expect_error(
    vec_cast(
      cfactor(codes=c(a = 1, b = 2), ordered = TRUE),
      cfactor(codes=c(a = 1, b = 2))
    )
  )
  expect_error(
    vec_cast(
      cfactor(codes=c(a = 1, b = 2)),
      cfactor(codes=c(a = 1, b = 2), ordered = TRUE)
    )
  )
  expect_error(
    vec_cast(
      cfactor(codes=c(b = 1, a = 2), ordered = TRUE),
      cfactor(codes=c(a = 1, b = 2), ordered = TRUE)
    )
  )
  expect_error(
    vec_cast(
      cfactor(codes=c(a = 1, b = 2), ordered = TRUE),
      cfactor(codes=c(a = 2, b = 1), ordered = TRUE)
    )
  )
})

test_that("latent cfactor cast will act like factor", {
  expect_identical(
    vec_cast(
      cfactor(codes=c(a = 1, b = 2)),
      latent_cfactor(codes=c(a = 1, b = 2)),
    ),
    factor(levels=c("a", "b"))
  )
  expect_identical(
    vec_cast(
      cfactor(codes=c(a = 1, b = 2, c = 3)),
      latent_cfactor(codes=c(a = 1, b = 2)),
    ),
    factor(levels=c("a", "b"))
  )
  expect_error(
    vec_cast(
      latent_cfactor(codes=c(a = 1, b = 2)),
      cfactor(codes=c(a = 1, b = 2)),
    )
  )
})
