   M S B A M L   `   `   `  ����G  CForksnSpoons, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ForksnSpoonsForksnSpoons  5   	       ForksnSpoons.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:ForksnSpoons     5   	     � Title$  
MainWindow��5   	   $	��550��6   $	��800��6)   .��5
      � -   5         �Name$ mainGrid��5
      .+�5   
   � ���#EAE7DC � ColumnDefinitions 5   
   �� 5      $
��195* �6   �� 5      $
��410* �6   �� 5      $
��187* �6   .+�5   
   ��  J� Opacity$ 1Q�6   $��Center=�5      $��Center=�5      $	��340��6-   $��1��5      $��31,60,25,60q�6"   $��5q�5       �� CornerRadius$ 10��5      ���#D8C3A5 �� Padding$ 10q�5      $	��350��5      ._�5      �� .+�5      �� $��0, 0, 0, 30q�5      $��Center=�5       
  Header#��[  5      Авторизация5!      �� 5"      $��
Логин��6    	 label#��[ 6(   �� 5#      -   5         ��Name$ tbxLogin��5$      $
��Left=�5%      $��Center=�5&      $	��265��5'      $��38��5(      �� 5)      $��Пароль��6   #��[ 6)   G� 5*      -   5         G�Name$ pbxPassword��5+      $
��Left=�5,      $��Center=�5-      $	��264��5.      $��38��5/      �� 50      -   5        $��0, 30, 0, 10q�51      $��Center=�52        NoMouseOverButtonTemplate#��[ 53       
 button#��[ 54       �� 	IsDefault . .��56   -   
Войти58      �� 59      -   5          	HyperLink#��[ 59      #��[ 6<   .��6�   *(Войти без авторизации6�   5:      5;      5<      5=      5>      