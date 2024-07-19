(*
    Brent Method 
    Mathematica
    John Bryan
    2020
    wolframscript -file 'brent.wl' -cloud
*)


clear all;

brentmethod[func_,targ_,aa_,bb_,ttolerance_] := Module[{a,b,s,tolerance,temp,c,d,term1,term2,term3,mflag},
   f[x_]:=func[x]-targ;
   a=aa;
   b=bb;
   s=bb;
   tolerance=ttolerance;
   If [Abs[f[a]]<Abs[f[b]],
      temp=a;
      a=b;
      b=temp;
     ,##&[];
   ];
   c = a;
   mflag=True;
   While [ f[b]!=0 && f[s]!=0 && Abs[b-a]>tolerance,
      If [(f[a] != f[c]) && (f[b] != f[c]),
         term1 = (a*f[b]*f[c])/((f[a]-f[b])*(f[a]-f[c]));
         term2 = (b*f[a]*f[c]) / ((f[b]-f[a])*(f[b]-f[c]));
         term3 = (c*f[a]*f[b]) / ((f[c]-f[a])*(f[c]-f[b]));
         s = term1+term2+term3;
         ,
            s = b-(f[b]*(b-a)/(f[b]-f[a]));
      ];
      If [ (!(((3*a+b)/4<s)&&(s<b))) ||
            (mflag && ((Abs[s-b]>=Abs[b-c]/2))) ||
            (!mflag&&(Abs[s-b]>=Abs[c-d]/2)) ||
            (mflag&&(Abs[b-c]<Abs[tolerance])) ||
            (!mflag&&(Abs[c-d]<Abs[tolerance])),
         s = (a+b)/2;
         mflag=True;
         ,
         mflag=False;
      ];
      d = c;
      c = b;
      If [f[a]*f[s]<0,
         b = s;
      ,
         a = s;
      ];
      If [Abs[f[a]] < Abs[f[b]],
         temp=a;
         a=b;
         b=temp;
      ,
      ##&[];
      ];
   ];
   Return[s];
];

(*
    f[x_] := (x+4)*(x+1);
    a=-5.;
    b=-3.;
    tolerance=0.00000002;
    s=brentmethod[f,a,b,tolerance];
    Print["root=",s];
    ClearAll;
    g[x_] := Sin[x];
    a=3.*Pi/4.;
    b=5.*Pi/4.;
    tolerance=0.00000002;
    s=brentmethod[g,a,b,tolerance];
    Print["root=",s];
*)