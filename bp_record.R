addbp <- function(
  thigh1 = 0,
  tlow1 = 0,
  thigh2 = 0,
  tlow2 = 0,
  trate1 = 0,
  trate2 = 0
){
  cat("Enter function\n")
  ttime = Sys.Date()
  cat("Sys.Date = ", ttime, "\n", sep = "")
  tbpdf <- read.csv("D:\\git_file\\bp_record\\bp_record.csv", header = T)
  cat("Read file success\n")
  pos <- dim(tbpdf)[1] + 1
  notice <- ("Today's Data Added")
  if (tbpdf$time[pos - 1] == as.numeric(ttime)){
    cat("Enter sameday update process")
    notice <- ("Today's Data Updated")
    pos <- dim(tbpdf)[1]
  }
  if(thigh1 * thigh2 * tlow1 * tlow2 * trate1 * trate2 ==0){
    cat("数据貌似有问题，请重新尝试\n")
    return()
  }
  cat("Start write\nelements:",
      ttime, "\n",
      thigh1, "\n",
      thigh2, "\n",
      tlow1, "\n",
      tlow2, "\n",
      trate1, "\n",
      trate2,  "\n",
      pos, "\n", 
      sep = "")
  cat("start write\n")
  tbpdf[pos, "time"] <- ttime
  tbpdf$high1[pos] <- thigh1
  tbpdf$high2[pos] <- thigh2
  tbpdf$low1[pos] <- tlow1
  tbpdf$low2[pos] <- tlow2
  tbpdf$rate1[pos] <- trate1
  tbpdf$rate2[pos] <- trate2
  tbpdf$mhigh[pos] <- (thigh1 + thigh2)/2
  tbpdf$mlow[pos] <- (tlow1 + tlow2)/2
  tbpdf$mrate[pos] <- (trate1 + trate2)/2
  cat("Write Finish\n")
  write.csv(tbpdf,"D:\\git_file\\bp_record\\bp_record.csv",row.names = F)
  
  cat(notice, "\n")
}

# time <- c(Sys.Date())
# high1 <- c(0)
# low1 <- c(0)
# high2 <- c(0)
# low2 <- c(0)
# rate1 <- c(0)
# rate2 <- c(0)
# mhigh <- c(0)
# mlow <- c(0)
# mrate <- c(0)
# 
# bpdf <- data.frame(
#   time,
#   high1,
#   low1,
#   high2,
#   low2,
#   rate1,
#   rate2,
#   mhigh,
#   mlow,
#   mrate
#   )
# 
# dim(bpdf)
# list.files()
# 
# write.csv(bpdf,"D:\\git_file\\bp_record\\bp_record.csv",row.names = F)

