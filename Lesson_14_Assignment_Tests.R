library(testthat)

# each call to test_that() produces one test
# each test represents one point value
# you can have multiple tests for each question

library(readr)
library(dplyr)

test_that("Q2 (visible)", {
  
  expect_true(dim(ttncpercs)[1] == 1)
  expect_true(dim(ttncpercs)[2] == 6)
  expect_equal(ttncpercs$percsurv, .384, tolerance = 1e-2)
  expect_equal(ttncpercs$percmale, .648, tolerance = 1e-2)
  expect_equal(ttncpercs$percS, .725, tolerance = 1e-2)
  
})

test_that("Q3 (visible)", {
  
  expect_equal(as.numeric(meanage), 29.69912, tolerance = 1e-2)

})

test_that("Q4 (visible)", {
  
  expect_true(class(ttnc$Sex) == "factor")
  expect_true(class(ttnc$Pclass) == "factor")
  expect_true(class(ttnc$Embarked) == "factor")

})

test_that("Q5 (visible)", {
  
  expect_equal(as.numeric(mod1$coefficients[1]), 36.81619, tolerance = 1e-3)
  expect_equal(as.numeric(mod1$coefficients[2]), -9.542411, tolerance = 1e-3)
  expect_equal(as.numeric(mod1$coefficients[5]), -4.033209, tolerance = 1e-3)
  
})

test_that("Q6 (visible)", {
  
  expect_equal(as.numeric(agepred[1]), 31.48493, tolerance = 1e-2)
  expect_equal(as.numeric(agepred[29]), 20.83603, tolerance = 1e-3)
  expect_equal(as.numeric(agepred[55]), 33.55954, tolerance = 1e-3)
  
})

test_that("Q7 (visible)", {
  
  expect_true(dim(ttnc2)[1] == 891)
  expect_true(dim(ttnc2)[2] == 9)
  expect_equal(ttnc2$Age[6], 31.48493, tolerance = 1e-2)
  expect_equal(ttnc2$Age[18], 33.55954, tolerance = 1e-2)
  expect_equal(ttnc2$Age[20], 22.74448, tolerance = 1e-2)
  
})

test_that("Q9 (visible)", {
  
  expect_equal(as.numeric(mod2$coefficients[1]), 1.056589, tolerance = 1e-3)
  expect_equal(as.numeric(mod2$coefficients[2]), -2.51371, tolerance = 1e-3)

})

test_that("Q12 & Q13 (visible)", {
  
  expect_equal(as.numeric(fempred), 1.056589, tolerance = 1e-2)
  expect_equal(as.numeric(malepred), -1.45712, tolerance = 1e-2)
  
})

test_that("Q14 & Q15 (visible)", {
  
  expect_equal(as.numeric(fempredprob), .7420382, tolerance = 1e-2)
  expect_equal(as.numeric(malepredprob), .1889082, tolerance = 1e-2)
  
})

test_that("Q16 (visible)", {
  
  expect_equal(as.numeric(mod3$coefficients[1]), .5306283, tolerance = 1e-3)
  expect_equal(as.numeric(mod3$coefficients[2]), -.6394311, tolerance = 1e-3)
  
})

test_that("Q17 & Q18 (visible)", {
  
  expect_equal(as.numeric(fcpredprob), .6296296, tolerance = 1e-2)
  expect_equal(as.numeric(tcpredprob), .2423625, tolerance = 1e-2)
  
})

test_that("Q19 (visible)", {
  
  expect_equal(as.numeric(mod4$coefficients[1]), 2.297123, tolerance = 1e-3)
  expect_equal(as.numeric(mod4$coefficients[4]), -1.905495, tolerance = 1e-3)
  
})

test_that("Q20 & Q21 (visible)", {
  
  expect_equal(as.numeric(mtcpredprob), .09532814, tolerance = 1e-2)
  expect_equal(as.numeric(ftcpredprob), .5966746, tolerance = 1e-2)
  
})

test_that("Q22 (visible)", {
  
  expect_equal(as.numeric(mod5$coefficients[1]), 3.412247, tolerance = 1e-3)
  expect_equal(as.numeric(mod5$coefficients[4]), -3.412247, tolerance = 1e-3)
  
})

test_that("Q23 & Q24 (visible)", {
  
  expect_equal(as.numeric(mtcpredprob2), .1354467, tolerance = 1e-2)
  expect_equal(as.numeric(ftcpredprob2), .50, tolerance = 1e-2)
  
})

test_that("Q25 (visible)", {
  
  expect_equal(sum(ttncsurvprop[,3]), 3.050844, tolerance = 1e-2)

})

test_that("Q28 (visible)", {
  
  expect_equal(as.numeric(mod6$coefficients[1]), 3.610371, tolerance = 1e-3)
  expect_equal(as.numeric(mod6$coefficients[5]), -.00563957, tolerance = 1e-3)
  
})

test_that("Q34 (visible)", {
  
  expect_equal(as.numeric(sum(survpredbin)), 259, tolerance = 1)
  expect_equal(as.numeric(survpredbin[10]), 1, tolerance = 1e-3)
  expect_equal(as.numeric(survpredbin[51]), 0, tolerance = 1e-3)
  
})

test_that("Q35 (visible)", {
  
  expect_equal(as.numeric(sum(confmat)), 891, tolerance = 1)
  expect_equal(as.numeric(confmat[1, 1]), 492, tolerance = 1e-3)
  expect_equal(as.numeric(confmat[2, 2]), 202, tolerance = 1e-3)
  
})


