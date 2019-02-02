function varargout = mainGUI(varargin)
% MAINGUI MATLAB code for mainGUI.fig
%      MAINGUI, by itself, creates a new MAINGUI or raises the existing
%      singleton*.
%
%      H = MAINGUI returns the handle to a new MAINGUI or the handle to
%      the existing singleton*.
%
%      MAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINGUI.M with the given input arguments.
%
%      MAINGUI('Property','Value',...) creates a new MAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainGUI

% Last Modified by GUIDE v2.5 30-May-2016 20:50:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @mainGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before mainGUI is made visible.
function mainGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainGUI (see VARARGIN)

% Choose default command line output for mainGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mainGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in recognizeButton.
function recognizeButton_Callback(hObject, eventdata, handles)
% hObject    handle to recognizeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load('svmModel.mat');
global img;

if size(img,3)>1
    img=rgb2gray(img);
else
    img=img;
end

filter=fspecial('gauss',3);
filtered=imfilter(img,filter);

outSize=[16,16];
resized=imresize(filtered,outSize);

edged=edge(resized,'canny');

x_new=zeros(1,256);
x=1;
[rows,cols]=size(edged);
for i=1:rows
     for j=1:cols
         x_new(1,x)=edged(i,j);
         x=x+1;
      end
end
    
y_new=fcihPredict(model,x_new);

if(y_new==1)
    %img=insertText(img,[0,0],'Cast detected');
    [rows,cols]=size(img);
    img = insertObjectAnnotation(img, 'rectangle',[10,10,cols-50,rows-50],'Cast'); 
    set(handles.text1,'String','Cast detected');
    
elseif(y_new==2)
    %img=insertText(img,[0,0],'RBC detected');
    [rows,cols]=size(img);
    img = insertObjectAnnotation(img, 'rectangle',[5,5,cols-10,rows-10],'RBC');
    set(handles.text1,'String','RBC detected');
end

axes(handles.axes1);
imshow(img);


% --- Executes on button press in selectImageButton.
function selectImageButton_Callback(hObject, eventdata, handles)
% hObject    handle to selectImageButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global img;
[file,path]=uigetfile('*','choose orginal image');
file=[path file];

img=imread(file);

axes(handles.axes1);
imshow(img);

%gimg=im2bw(gimg);
