if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="example-2";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(8cm);
include graph;
xlimits(0, 20);
ylimits(0, 200);
xaxis('x-value');
yaxis('y-value');
viewportsize=(345.0pt,0);
