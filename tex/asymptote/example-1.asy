if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="example-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(8cm);
include graph;
Label f;
f.p = fontsize(6);
xaxis(-10,10, Ticks(f, 2.0, 0.5));
yaxis(-10,10, Ticks(f, 2.0));

real f(real x)
{
return (x^3);
}
draw(graph(f, -2, 2));
viewportsize=(345.0pt,0);
