cachematrix<-function(x,...){
	m<-x$getinverse()
	if(!is.null(m)){
		message("cached answer being displayed")
		return(m)
	}
	data<-x$get()
	m<-solve(data,...)
	x$setinverse(m)
	m
}


makematrix<-function(x = matrix()){
	m<-NULL
	set<-function(y){
		x<<-y
		m<<-NULL
	}
	get<-function()x
	setinverse<-function(inverse)m<<-inverse
	getinverse<-function()m
	list(get=get,set=set,getinverse=getinverse,setinverse=setinverse)
}