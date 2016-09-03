with Ada.Exceptions;

with Gnoga.Application.Singleton;
with Gnoga.Gui.Window;
with Gnoga.Gui.View;
with Gnoga.Gui.Element.Canvas;
with Gnoga.Gui.Element.Canvas.Context_2D;

procedure Gnoga_Draw2D is
   Main_Window : Gnoga.Gui.Window.Window_Type;
   Main_View   : Gnoga.Gui.View.View_Type;
   My_Canvas   : Gnoga.Gui.Element.Canvas.Canvas_Type;
   Canvas_Context : Gnoga.Gui.Element.Canvas.Context_2D.Context_2D_Type;
begin
   Gnoga.Application.Title ("Drawing Example");
   Gnoga.Application.HTML_On_Close (
                       "<b>Connection to Application has been terminated</b>");
   Gnoga.Application.Open_URL ("http://127.0.0.1:8080");
   Gnoga.Application.Singleton.Initialize (Main_Window, Port => 8080);

   Main_View.Create (Main_Window);
   My_Canvas.Create (Parent => Main_View, Width => 600, Height => 400);
   Canvas_Context.Get_Drawing_Context_2D (My_Canvas);

   Canvas_Context.Translate (10, 10);
   Canvas_Context.Scale (5.0, 5.0);
   Canvas_Context.Font (Height => "5px");

   Canvas_Context.Move_To (0, 0);
   Canvas_Context.Line_To (30, 0);
   Canvas_Context.Line_To (28, 2);
   Canvas_Context.Fill_Text ("X", 24, 5);
   Canvas_Context.Move_To (0, 0);
   Canvas_Context.Line_To (0, 30);
   Canvas_Context.Line_To (2, 28);
   Canvas_Context.Fill_Text ("Y", 1, 26);
   Canvas_Context.Fill_Text ("0", 1, 5);

   Canvas_Context.Move_To (20, 10);
   Canvas_Context.Arc_Radians (10, 10, 10, 0.0, 3.14 / 2.0);
   Canvas_Context.Fill_Text ("0", 21, 10);
   Canvas_Context.Fill_Text ("Pi/2", 10, 27);
   Canvas_Context.Stroke;

   Gnoga.Application.Singleton.Message_Loop;

exception
   when E : others =>
      Gnoga.Log (Ada.Exceptions.Exception_Name (E) & " - "
                 & Ada.Exceptions.Exception_Message (E));
end Gnoga_Draw2D;
