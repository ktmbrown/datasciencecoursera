library(stringr)
# reading in Features
feat_file <- './data/UCI/features.txt'
Features <- read.table(feat_file, header = FALSE,fill=T, stringsAsFactors = FALSE)
Features$VariableDescription <- rep(NA,nrow(Features))
names(Features) <- c('Column', 'VariableName','VariableDescription')

# generating variable descriptions
feat_info_file <- 'descriptions.txt'
FeaturesInfo <- read.table(feat_info_file, header = FALSE,fill=T,sep=':', stringsAsFactors = FALSE)

FeaturesInfo$V1<-str_replace_all(FeaturesInfo$V1,'\\(\\)','')
for(i in 1:nrow(FeaturesInfo)) {
      Features$VariableDescription[grep(FeaturesInfo[i,1],Features$`VariableName`)] <- paste(
            FeaturesInfo$V2[i], 'of the ', Features)
}
