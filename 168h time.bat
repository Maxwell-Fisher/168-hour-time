::168 hour time format, because 24 hour time wasn't enough
::https://maxwellcrafter.com
::More regretful code can be found at https://github.com/Maxwell-Fisher/168-hour-time

 :::::Everything is terrible, enjoy this even more terrible code:::::
::                                                                  ::
::       |\/| ---- _                                                ::
::      =(--)=_____ \                                               ::
::      c___ (______/                                               ::
::                                                                  ::
 ::19ddefabe5c2652a30e671914cf84c49b0a6f45318adacc0aeb3563ae72d134e::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                  ::
::  MIT License                                                                     ::
::                                                                                  ::
::  Copyright (c) 2022 Maxwell Fisher (@Maxwellcrafter)                             ::
::                                                                                  ::
::  Permission is hereby granted, free of charge, to any person obtaining a copy    ::
::  of this software and associated documentation files (the "Software"), to deal   ::
::  in the Software without restriction, including without limitation the rights    ::
::  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell       ::
::  copies of the Software, and to permit persons to whom the Software is           ::
::  furnished to do so, subject to the following conditions:                        ::
::                                                                                  ::
::  The above copyright notice and this permission notice shall be included in all  ::
::  copies or substantial portions of the Software.                                 ::
::                                                                                  ::
::  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR      ::
::  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,        ::
::  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE     ::
::  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER          ::
::  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,   ::
::  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE   ::
::  SOFTWARE.                                                                       ::
::                                                                                  ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
cls

::Haha, CPU usage go brrrr
:loopBeginning


::Adds a certain amount of hours depending on the day of the week
set timeDifference=0
echo %date% > nul | find "Sun" && set timeDifference=0
echo %date% > nul | find "Mon" && set timeDifference=24
echo %date% > nul | find "Tue" && set timeDifference=48
echo %date% > nul | find "Wed" && set timeDifference=72
echo %date% > nul | find "Thu" && set timeDifference=96
echo %date% > nul | find "Fri" && set timeDifference=120
echo %date% > nul | find "Sat" && set timeDifference=144

::Takes the time out of the time
set hour=%time:~0,2%
set minute=%time:~3,2%
set second=%time:~6,2%

::Adds the amount of hours from the previous day to the current day
set /a hour=hour+timeDifference

::Removes the zeros from the minute and seconds. Even though they will be added later. Because it can.
set /a minute=minute
set /a second=second

::Sets the hour to be 3 digits, with zeros before the "normal" numbers
set hour=00%hour%
set hour=%hour:~-3%

::Does the same as the hour thing above, but not as cursed
set minute=0%minute%
set minute=%minute:~-2%

::Same thing here
set second=0%second%
set second=%second:~-2%

::Clears the screen and then shows you the regret
cls
echo %hour%:%minute%:%second%

::Repeat the suffering all over again (forever)
goto loopBeginning

::This is here incase everything goes wrong
echo Oops, everything is terrible!
pause
exit /b
