   M S B A M L   `   `   `  ����?  ;crud, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:crud.pages
crud.pages  5   	       crud.pages.work   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:crud.pages     5   	     � Title$
  work��5   	   $	��450��6   $	��800��6&   .��5	      �  � RowDefinitions 5
   
   �� 5      6   �� 5      $��50 �6   6*   .+�5   
   &   System.Windows.Controls.DataGrid  -   5        $��	BDWorkers��5         AutoGenerateColumns .     Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ ФИО��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$
 auto 6J   1  +System.Windows.Controls.DataGridBoundColumn   Binding 62   �� *fio+6Z     5      $ 
Логин��6%   $
 auto 6N    64   �� *login+6^     5      $ Пароль��6%   $
 auto 6R    65   �� *
password+6b   4  .System.Windows.Controls.DataGridTemplateColumn  5      $ Дата��6)      CellTemplate 5      �� 5      .R�5      �� .+�5   "   �� ��6,   �� *data+ �� StringFormat$ {0:dd/MM/yyyy}��6b   �� 5   "   ��6,   �� *time+6D   5      5      5        5       5      �� 5      .R�5       �� $	��100��6$   ��5!   "   �� 5"   &   	 �� Path$	 photo�6.   
 �� TargetNullValue
 5#   *   �� 5$   .   $��/res/контакты.png��64   5'   '   5)      5*      5,        5-      $
 auto 6)    5.      �� 5/      .R�50      �� $��BntEdit��6%   -   5        $	��150��50   5   .��6T   Редактировать6c   51      53        54      $
 auto 6)    55      �� 56      .R�57      �� $��BntDell��6%   -   5        $	��150��57   C   .��6O   Удалить6X   58      5:      5=      �� 5?   
   $��1��6    �� Orientation$ 
Horizontal=�6"   .+�5@      �� -   5        .��5@   "   Добавить6,   5B      5C      5D      