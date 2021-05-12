// Gmsh project created on Mon May 10 22:06:19 2021
SetFactory("OpenCASCADE");
//+

NL = 50;
NH = 5;
NR1 = NL/50*3.141*0.5*10;
NR2 = NL/50*3.141*0.75*10;

Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {0, 0.5, 0, 1.0};
//+
Point(3) = {5, 0.5, 0, 1.0};
//+
Point(4) = {5, 0, 0, 1.0};
//+
Point(5) = {5, -1, 0, 1.0};
//+
Point(6) = {6, -1, 0, 1.0};
//+
Point(7) = {6.5, -1, 0, 1.0};
//+
Point(8) = {6, -6, 0, 1.0};
//+
Point(9) = {6.5, -6, 0, 1.0};
//+
Line(1) = {2, 3};
//+
Line(2) = {2, 1};
//+
Line(3) = {1, 4};
//+
Line(4) = {6, 8};
//+
Line(5) = {8, 9};
//+
Line(6) = {9, 7};
//+
Circle(7) = {3, 5, 7};
//+
Circle(8) = {4, 5, 6};
//+
Curve Loop(1) = {2, 3, 8, 4, 5, 6, -7, -1};
//+
Plane Surface(1) = {1};
//+
Extrude {0,0,0.2} {
  Surface{1}; Layers{3}; Recombine;
}
//+
Physical Surface("Inlet", 25) = {2};
//+
Physical Surface("outlet", 26) = {6};
//+
Physical Surface("symm", 27) = {9, 3, 5, 7};
//+
Physical Surface("fw", 28) = {8, 4};
//+
Physical Volume("vol", 29) = {1};
//+
Curve Loop(11) = {3, 8, 4, 5, 6, -7, -1, 2};
//+
Curve Loop(12) = {11, 13, 15, 17, 19, 21, -23, -24};
//+
Curve Loop(13) = {11, 13, 15, 17, 19, 21, -23, -24};
//+
Plane Surface(11) = {13};
//+
Curve Loop(15) = {1, 7, -6, -5, -4, -8, -3, -2};
//+
Plane Surface(12) = {15};

//+
//+
Physical Surface("fba", 30) = {10, 1};
//+
//+
Transfinite Curve {24, 1, 13, 3, 17, 4, 21, 6} = NL Using Progression 1;
//+
Transfinite Curve {11, 2, 19, 5} = NH Using Progression 1;
//+
Transfinite Curve {8, 15} = NR1 Using Progression 1;
//+
Transfinite Curve {7, 23} = NR2 Using Progression 1;
