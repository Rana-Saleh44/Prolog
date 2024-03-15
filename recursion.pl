cube:-readint(X),process(X).
process(X):-Y=X*X*X,write(Y),cube.

