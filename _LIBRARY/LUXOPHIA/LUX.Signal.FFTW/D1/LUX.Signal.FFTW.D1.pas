﻿unit LUX.Signal.FFTW.D1;

interface //#################################################################### ■

uses LUX,
     LUX.Data.Lattice.T1,
     LUX.Signal.FFTW,
     fftw3;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDFT1D<_TItem_,_TTimes_,_TFreqs_>

     IDFT1D = interface( IDFT )
     ['{8A6BFC87-970E-4A18-856C-8EEF6109D4B6}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TDFT1D<_TItem_:record;
            _TTimes_:TPoinArray1D<_TItem_>,constructor;
            _TFreqs_:TPoinArray1D<_TItem_>,constructor> = class( TDFT<_TItem_,_TTimes_,_TFreqs_>, IDFT1D )
     private
     protected
       ///// アクセス
       procedure SetTimesN;
       procedure SetFreqsN;
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDFT1D<_TItem_,_TGrid_>

     TDFT1D<_TItem_:record;
            _TGrid_:TPoinArray1D<_TItem_>,constructor> = class( TDFT1D<_TItem_,_TGrid_,_TGrid_> )
     private
     protected
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDFT1D<_TItem_,_TTimes_,_TFreqs_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TDFT1D<_TItem_,_TTimes_,_TFreqs_>.SetTimesN;
begin
     _Freqs.PoinsX := _Times.PoinsX;

     RecreaPlans;
end;

procedure TDFT1D<_TItem_,_TTimes_,_TFreqs_>.SetFreqsN;
begin
     _Times.PoinsX := _Freqs.PoinsX;

     RecreaPlans;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDFT1D<_TItem_,_TTimes_,_TFreqs_>.Create;
begin
     inherited;

     with _Times as TPoinArray1D<_TItem_> do
     begin
          _OnChange := SetTimesN;

          PoinsX := 2;
     end;

     with _Freqs as TPoinArray1D<_TItem_> do
     begin
          _OnChange := SetFreqsN;

          PoinsX := 2;
     end;
end;

destructor TDFT1D<_TItem_,_TTimes_,_TFreqs_>.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDFT1D<_TItem_,_TGrid_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■