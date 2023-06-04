```{r}
# install.packages("biwavelet")

#######call the package before you start#######

library (biwavelet)
```


```{r}
######## GHANA ########
################### Remittance & Expenditure, Capital ###################
Ghana1=read.table("Gse.csv",header=T,sep=',')
Ghana2=read.table("Gexc.csv",header=T,sep=',')
Ghana3=read.table("Covid-19.csv",header=T,sep=',')

Gh1 <- cbind(1:2739,Ghana1$Gse)
Gh2 <- cbind(1:2739,Ghana2$Gexc)
Gh3 <- cbind(1:2739,Ghana3$Covid.19)

nrands= 5000
```


```{r}
## Partial wavelet coherence of y= gse and x=exc as moderated by x2=covid##
gse_exc_cov = pwtc(Gh1,Gh2,Gh3, mother = "morlet", dj = 1/12, s0=2, max.scale = 16, nrands=5000)
```


```{r}
## Plot partial wavelet coherence and phase difference (arrows)##
## Make room to the right for the color bar##
par(oma = c(0, 0, 0, 1), mar = c(5, 4, 5, 5) + 0.1)

plot(gse_exc_cov, plot.phase = TRUE, lty.coi = 1, col.coi = "black", lwd.coi = 2, 
    lwd.sig = 2, arrow.lwd = 0.03, arrow.len = 0.12, ylab = "Scale", xlab = "yearly", 
    plot.cb = TRUE, main = "Ghana Stock Market vs Exchange rate | Covid-19")
```


```{r}
plot(gse_exc_cov, xlab="Time (Yearly)", plot.cb=TRUE, main="Ghana Stock Market vs Exchange rate | Covid-19")

```

