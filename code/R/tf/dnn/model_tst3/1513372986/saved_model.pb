кр
╠Д
9
Add
x"T
y"T
z"T"
Ttype:
2	
h
All	
input

reduction_indices"Tidx

output
"
	keep_dimsbool( "
Tidxtype0:
2	
P
Assert
	condition
	
data2T"
T
list(type)(0"
	summarizeintѕ
x
Assign
ref"Tђ

value"T

output_ref"Tђ"	
Ttype"
validate_shapebool("
use_lockingbool(ў
{
BiasAdd

value"T	
bias"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
A
Equal
x"T
y"T
z
"
Ttype:
2	
љ
S
HistogramSummary
tag
values"T
summary"
Ttype0:
2		
.
Identity

input"T
output"T"	
Ttype
o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2
і
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(ѕ
<
Mul
x"T
y"T
z"T"
Ttype:
2	љ

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
№
ParseExample

serialized	
names
sparse_keys*Nsparse

dense_keys*Ndense
dense_defaults2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("%
sparse_types
list(type)(:
2	"
Tdense
list(type)(:
2	"
dense_shapeslist(shape)(
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
}
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	ѕ
A
Relu
features"T
activations"T"
Ttype:
2		
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0ѕ
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0ѕ
M
ScalarSummary
tags
values"T
summary"
Ttype:
2		
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
Ш
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
9
Sub
x"T
y"T
z"T"
Ttype:
2	
s

VariableV2
ref"dtypeђ"
shapeshape"
dtypetype"
	containerstring "
shared_namestring ѕ"serve*1.4.12v1.4.0-19-ga52c8d9▒Д

global_step/Initializer/zerosConst*
dtype0	*
_output_shapes
: *
_class
loc:@global_step*
value	B	 R 
Ј
global_step
VariableV2*
dtype0	*
_output_shapes
: *
shared_name *
_class
loc:@global_step*
	container *
shape: 
▓
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 
o
input_example_tensorPlaceholder*
dtype0*#
_output_shapes
:         *
shape:         
U
ParseExample/ConstConst*
valueB *
dtype0*
_output_shapes
: 
W
ParseExample/Const_1Const*
valueB *
dtype0*
_output_shapes
: 
W
ParseExample/Const_2Const*
dtype0*
_output_shapes
: *
valueB 
W
ParseExample/Const_3Const*
valueB *
dtype0*
_output_shapes
: 
W
ParseExample/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
ParseExample/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
W
ParseExample/Const_6Const*
valueB *
dtype0*
_output_shapes
: 
W
ParseExample/Const_7Const*
dtype0*
_output_shapes
: *
valueB 
W
ParseExample/Const_8Const*
_output_shapes
: *
valueB *
dtype0
W
ParseExample/Const_9Const*
valueB *
dtype0*
_output_shapes
: 
X
ParseExample/Const_10Const*
valueB *
dtype0*
_output_shapes
: 
X
ParseExample/Const_11Const*
valueB *
dtype0*
_output_shapes
: 
X
ParseExample/Const_12Const*
dtype0*
_output_shapes
: *
valueB 
X
ParseExample/Const_13Const*
dtype0*
_output_shapes
: *
valueB 
X
ParseExample/Const_14Const*
valueB *
dtype0*
_output_shapes
: 
X
ParseExample/Const_15Const*
valueB *
dtype0*
_output_shapes
: 
b
ParseExample/ParseExample/namesConst*
valueB *
dtype0*
_output_shapes
: 
n
&ParseExample/ParseExample/dense_keys_0Const*
_output_shapes
: *
valueB Bavg_rad*
dtype0
m
&ParseExample/ParseExample/dense_keys_1Const*
valueB Bfract1*
dtype0*
_output_shapes
: 
n
&ParseExample/ParseExample/dense_keys_2Const*
_output_shapes
: *
valueB Bfract10*
dtype0
m
&ParseExample/ParseExample/dense_keys_3Const*
_output_shapes
: *
valueB Bfract2*
dtype0
m
&ParseExample/ParseExample/dense_keys_4Const*
dtype0*
_output_shapes
: *
valueB Bfract3
m
&ParseExample/ParseExample/dense_keys_5Const*
valueB Bfract4*
dtype0*
_output_shapes
: 
m
&ParseExample/ParseExample/dense_keys_6Const*
valueB Bfract5*
dtype0*
_output_shapes
: 
m
&ParseExample/ParseExample/dense_keys_7Const*
valueB Bfract6*
dtype0*
_output_shapes
: 
m
&ParseExample/ParseExample/dense_keys_8Const*
_output_shapes
: *
valueB Bfract7*
dtype0
m
&ParseExample/ParseExample/dense_keys_9Const*
valueB Bfract8*
dtype0*
_output_shapes
: 
n
'ParseExample/ParseExample/dense_keys_10Const*
valueB Bfract9*
dtype0*
_output_shapes
: 
m
'ParseExample/ParseExample/dense_keys_11Const*
valueB Blabel*
dtype0*
_output_shapes
: 
o
'ParseExample/ParseExample/dense_keys_12Const*
dtype0*
_output_shapes
: *
valueB Bmax_rad
r
'ParseExample/ParseExample/dense_keys_13Const*
valueB B
median_rad*
dtype0*
_output_shapes
: 
o
'ParseExample/ParseExample/dense_keys_14Const*
valueB Bmin_rad*
dtype0*
_output_shapes
: 
o
'ParseExample/ParseExample/dense_keys_15Const*
dtype0*
_output_shapes
: *
valueB Bvar_rad
п
ParseExample/ParseExampleParseExampleinput_example_tensorParseExample/ParseExample/names&ParseExample/ParseExample/dense_keys_0&ParseExample/ParseExample/dense_keys_1&ParseExample/ParseExample/dense_keys_2&ParseExample/ParseExample/dense_keys_3&ParseExample/ParseExample/dense_keys_4&ParseExample/ParseExample/dense_keys_5&ParseExample/ParseExample/dense_keys_6&ParseExample/ParseExample/dense_keys_7&ParseExample/ParseExample/dense_keys_8&ParseExample/ParseExample/dense_keys_9'ParseExample/ParseExample/dense_keys_10'ParseExample/ParseExample/dense_keys_11'ParseExample/ParseExample/dense_keys_12'ParseExample/ParseExample/dense_keys_13'ParseExample/ParseExample/dense_keys_14'ParseExample/ParseExample/dense_keys_15ParseExample/ConstParseExample/Const_1ParseExample/Const_2ParseExample/Const_3ParseExample/Const_4ParseExample/Const_5ParseExample/Const_6ParseExample/Const_7ParseExample/Const_8ParseExample/Const_9ParseExample/Const_10ParseExample/Const_11ParseExample/Const_12ParseExample/Const_13ParseExample/Const_14ParseExample/Const_15*
Ndense*к
_output_shapes│
░:         :         :         :         :         :         :         :         :         :         :         :         :         :         :         :         *
Nsparse *
sparse_types
 *r
dense_shapesb
`::::::::::::::::*
Tdense
2
Љ
8dnn/input_from_feature_columns/input_layer/avg_rad/ShapeShapeParseExample/ParseExample*
_output_shapes
:*
T0*
out_type0
љ
Fdnn/input_from_feature_columns/input_layer/avg_rad/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
њ
Hdnn/input_from_feature_columns/input_layer/avg_rad/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
њ
Hdnn/input_from_feature_columns/input_layer/avg_rad/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Э
@dnn/input_from_feature_columns/input_layer/avg_rad/strided_sliceStridedSlice8dnn/input_from_feature_columns/input_layer/avg_rad/ShapeFdnn/input_from_feature_columns/input_layer/avg_rad/strided_slice/stackHdnn/input_from_feature_columns/input_layer/avg_rad/strided_slice/stack_1Hdnn/input_from_feature_columns/input_layer/avg_rad/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
ё
Bdnn/input_from_feature_columns/input_layer/avg_rad/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
ѕ
@dnn/input_from_feature_columns/input_layer/avg_rad/Reshape/shapePack@dnn/input_from_feature_columns/input_layer/avg_rad/strided_sliceBdnn/input_from_feature_columns/input_layer/avg_rad/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
Р
:dnn/input_from_feature_columns/input_layer/avg_rad/ReshapeReshapeParseExample/ParseExample@dnn/input_from_feature_columns/input_layer/avg_rad/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:         
њ
7dnn/input_from_feature_columns/input_layer/fract1/ShapeShapeParseExample/ParseExample:1*
_output_shapes
:*
T0*
out_type0
Ј
Ednn/input_from_feature_columns/input_layer/fract1/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract1/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract1/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
з
?dnn/input_from_feature_columns/input_layer/fract1/strided_sliceStridedSlice7dnn/input_from_feature_columns/input_layer/fract1/ShapeEdnn/input_from_feature_columns/input_layer/fract1/strided_slice/stackGdnn/input_from_feature_columns/input_layer/fract1/strided_slice/stack_1Gdnn/input_from_feature_columns/input_layer/fract1/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
Ѓ
Adnn/input_from_feature_columns/input_layer/fract1/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
Ё
?dnn/input_from_feature_columns/input_layer/fract1/Reshape/shapePack?dnn/input_from_feature_columns/input_layer/fract1/strided_sliceAdnn/input_from_feature_columns/input_layer/fract1/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
Р
9dnn/input_from_feature_columns/input_layer/fract1/ReshapeReshapeParseExample/ParseExample:1?dnn/input_from_feature_columns/input_layer/fract1/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:         
Њ
8dnn/input_from_feature_columns/input_layer/fract10/ShapeShapeParseExample/ParseExample:2*
T0*
out_type0*
_output_shapes
:
љ
Fdnn/input_from_feature_columns/input_layer/fract10/strided_slice/stackConst*
_output_shapes
:*
valueB: *
dtype0
њ
Hdnn/input_from_feature_columns/input_layer/fract10/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
њ
Hdnn/input_from_feature_columns/input_layer/fract10/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
Э
@dnn/input_from_feature_columns/input_layer/fract10/strided_sliceStridedSlice8dnn/input_from_feature_columns/input_layer/fract10/ShapeFdnn/input_from_feature_columns/input_layer/fract10/strided_slice/stackHdnn/input_from_feature_columns/input_layer/fract10/strided_slice/stack_1Hdnn/input_from_feature_columns/input_layer/fract10/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
ё
Bdnn/input_from_feature_columns/input_layer/fract10/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
ѕ
@dnn/input_from_feature_columns/input_layer/fract10/Reshape/shapePack@dnn/input_from_feature_columns/input_layer/fract10/strided_sliceBdnn/input_from_feature_columns/input_layer/fract10/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
С
:dnn/input_from_feature_columns/input_layer/fract10/ReshapeReshapeParseExample/ParseExample:2@dnn/input_from_feature_columns/input_layer/fract10/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:         
њ
7dnn/input_from_feature_columns/input_layer/fract2/ShapeShapeParseExample/ParseExample:3*
_output_shapes
:*
T0*
out_type0
Ј
Ednn/input_from_feature_columns/input_layer/fract2/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract2/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract2/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
з
?dnn/input_from_feature_columns/input_layer/fract2/strided_sliceStridedSlice7dnn/input_from_feature_columns/input_layer/fract2/ShapeEdnn/input_from_feature_columns/input_layer/fract2/strided_slice/stackGdnn/input_from_feature_columns/input_layer/fract2/strided_slice/stack_1Gdnn/input_from_feature_columns/input_layer/fract2/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
Ѓ
Adnn/input_from_feature_columns/input_layer/fract2/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
Ё
?dnn/input_from_feature_columns/input_layer/fract2/Reshape/shapePack?dnn/input_from_feature_columns/input_layer/fract2/strided_sliceAdnn/input_from_feature_columns/input_layer/fract2/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
Р
9dnn/input_from_feature_columns/input_layer/fract2/ReshapeReshapeParseExample/ParseExample:3?dnn/input_from_feature_columns/input_layer/fract2/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:         
њ
7dnn/input_from_feature_columns/input_layer/fract3/ShapeShapeParseExample/ParseExample:4*
_output_shapes
:*
T0*
out_type0
Ј
Ednn/input_from_feature_columns/input_layer/fract3/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract3/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract3/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
з
?dnn/input_from_feature_columns/input_layer/fract3/strided_sliceStridedSlice7dnn/input_from_feature_columns/input_layer/fract3/ShapeEdnn/input_from_feature_columns/input_layer/fract3/strided_slice/stackGdnn/input_from_feature_columns/input_layer/fract3/strided_slice/stack_1Gdnn/input_from_feature_columns/input_layer/fract3/strided_slice/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask
Ѓ
Adnn/input_from_feature_columns/input_layer/fract3/Reshape/shape/1Const*
_output_shapes
: *
value	B :*
dtype0
Ё
?dnn/input_from_feature_columns/input_layer/fract3/Reshape/shapePack?dnn/input_from_feature_columns/input_layer/fract3/strided_sliceAdnn/input_from_feature_columns/input_layer/fract3/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
Р
9dnn/input_from_feature_columns/input_layer/fract3/ReshapeReshapeParseExample/ParseExample:4?dnn/input_from_feature_columns/input_layer/fract3/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:         
њ
7dnn/input_from_feature_columns/input_layer/fract4/ShapeShapeParseExample/ParseExample:5*
T0*
out_type0*
_output_shapes
:
Ј
Ednn/input_from_feature_columns/input_layer/fract4/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract4/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract4/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
з
?dnn/input_from_feature_columns/input_layer/fract4/strided_sliceStridedSlice7dnn/input_from_feature_columns/input_layer/fract4/ShapeEdnn/input_from_feature_columns/input_layer/fract4/strided_slice/stackGdnn/input_from_feature_columns/input_layer/fract4/strided_slice/stack_1Gdnn/input_from_feature_columns/input_layer/fract4/strided_slice/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask
Ѓ
Adnn/input_from_feature_columns/input_layer/fract4/Reshape/shape/1Const*
_output_shapes
: *
value	B :*
dtype0
Ё
?dnn/input_from_feature_columns/input_layer/fract4/Reshape/shapePack?dnn/input_from_feature_columns/input_layer/fract4/strided_sliceAdnn/input_from_feature_columns/input_layer/fract4/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
Р
9dnn/input_from_feature_columns/input_layer/fract4/ReshapeReshapeParseExample/ParseExample:5?dnn/input_from_feature_columns/input_layer/fract4/Reshape/shape*'
_output_shapes
:         *
T0*
Tshape0
њ
7dnn/input_from_feature_columns/input_layer/fract5/ShapeShapeParseExample/ParseExample:6*
T0*
out_type0*
_output_shapes
:
Ј
Ednn/input_from_feature_columns/input_layer/fract5/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
Љ
Gdnn/input_from_feature_columns/input_layer/fract5/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract5/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
з
?dnn/input_from_feature_columns/input_layer/fract5/strided_sliceStridedSlice7dnn/input_from_feature_columns/input_layer/fract5/ShapeEdnn/input_from_feature_columns/input_layer/fract5/strided_slice/stackGdnn/input_from_feature_columns/input_layer/fract5/strided_slice/stack_1Gdnn/input_from_feature_columns/input_layer/fract5/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
Ѓ
Adnn/input_from_feature_columns/input_layer/fract5/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
Ё
?dnn/input_from_feature_columns/input_layer/fract5/Reshape/shapePack?dnn/input_from_feature_columns/input_layer/fract5/strided_sliceAdnn/input_from_feature_columns/input_layer/fract5/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
Р
9dnn/input_from_feature_columns/input_layer/fract5/ReshapeReshapeParseExample/ParseExample:6?dnn/input_from_feature_columns/input_layer/fract5/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:         
њ
7dnn/input_from_feature_columns/input_layer/fract6/ShapeShapeParseExample/ParseExample:7*
_output_shapes
:*
T0*
out_type0
Ј
Ednn/input_from_feature_columns/input_layer/fract6/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract6/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract6/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
з
?dnn/input_from_feature_columns/input_layer/fract6/strided_sliceStridedSlice7dnn/input_from_feature_columns/input_layer/fract6/ShapeEdnn/input_from_feature_columns/input_layer/fract6/strided_slice/stackGdnn/input_from_feature_columns/input_layer/fract6/strided_slice/stack_1Gdnn/input_from_feature_columns/input_layer/fract6/strided_slice/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask
Ѓ
Adnn/input_from_feature_columns/input_layer/fract6/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
Ё
?dnn/input_from_feature_columns/input_layer/fract6/Reshape/shapePack?dnn/input_from_feature_columns/input_layer/fract6/strided_sliceAdnn/input_from_feature_columns/input_layer/fract6/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
Р
9dnn/input_from_feature_columns/input_layer/fract6/ReshapeReshapeParseExample/ParseExample:7?dnn/input_from_feature_columns/input_layer/fract6/Reshape/shape*
Tshape0*'
_output_shapes
:         *
T0
њ
7dnn/input_from_feature_columns/input_layer/fract7/ShapeShapeParseExample/ParseExample:8*
_output_shapes
:*
T0*
out_type0
Ј
Ednn/input_from_feature_columns/input_layer/fract7/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract7/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
Љ
Gdnn/input_from_feature_columns/input_layer/fract7/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
з
?dnn/input_from_feature_columns/input_layer/fract7/strided_sliceStridedSlice7dnn/input_from_feature_columns/input_layer/fract7/ShapeEdnn/input_from_feature_columns/input_layer/fract7/strided_slice/stackGdnn/input_from_feature_columns/input_layer/fract7/strided_slice/stack_1Gdnn/input_from_feature_columns/input_layer/fract7/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
Ѓ
Adnn/input_from_feature_columns/input_layer/fract7/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
Ё
?dnn/input_from_feature_columns/input_layer/fract7/Reshape/shapePack?dnn/input_from_feature_columns/input_layer/fract7/strided_sliceAdnn/input_from_feature_columns/input_layer/fract7/Reshape/shape/1*

axis *
N*
_output_shapes
:*
T0
Р
9dnn/input_from_feature_columns/input_layer/fract7/ReshapeReshapeParseExample/ParseExample:8?dnn/input_from_feature_columns/input_layer/fract7/Reshape/shape*'
_output_shapes
:         *
T0*
Tshape0
њ
7dnn/input_from_feature_columns/input_layer/fract8/ShapeShapeParseExample/ParseExample:9*
T0*
out_type0*
_output_shapes
:
Ј
Ednn/input_from_feature_columns/input_layer/fract8/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
Љ
Gdnn/input_from_feature_columns/input_layer/fract8/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract8/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
з
?dnn/input_from_feature_columns/input_layer/fract8/strided_sliceStridedSlice7dnn/input_from_feature_columns/input_layer/fract8/ShapeEdnn/input_from_feature_columns/input_layer/fract8/strided_slice/stackGdnn/input_from_feature_columns/input_layer/fract8/strided_slice/stack_1Gdnn/input_from_feature_columns/input_layer/fract8/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
Ѓ
Adnn/input_from_feature_columns/input_layer/fract8/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
Ё
?dnn/input_from_feature_columns/input_layer/fract8/Reshape/shapePack?dnn/input_from_feature_columns/input_layer/fract8/strided_sliceAdnn/input_from_feature_columns/input_layer/fract8/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
Р
9dnn/input_from_feature_columns/input_layer/fract8/ReshapeReshapeParseExample/ParseExample:9?dnn/input_from_feature_columns/input_layer/fract8/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:         
Њ
7dnn/input_from_feature_columns/input_layer/fract9/ShapeShapeParseExample/ParseExample:10*
T0*
out_type0*
_output_shapes
:
Ј
Ednn/input_from_feature_columns/input_layer/fract9/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract9/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Љ
Gdnn/input_from_feature_columns/input_layer/fract9/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
з
?dnn/input_from_feature_columns/input_layer/fract9/strided_sliceStridedSlice7dnn/input_from_feature_columns/input_layer/fract9/ShapeEdnn/input_from_feature_columns/input_layer/fract9/strided_slice/stackGdnn/input_from_feature_columns/input_layer/fract9/strided_slice/stack_1Gdnn/input_from_feature_columns/input_layer/fract9/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
Ѓ
Adnn/input_from_feature_columns/input_layer/fract9/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
Ё
?dnn/input_from_feature_columns/input_layer/fract9/Reshape/shapePack?dnn/input_from_feature_columns/input_layer/fract9/strided_sliceAdnn/input_from_feature_columns/input_layer/fract9/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
с
9dnn/input_from_feature_columns/input_layer/fract9/ReshapeReshapeParseExample/ParseExample:10?dnn/input_from_feature_columns/input_layer/fract9/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:         
ћ
8dnn/input_from_feature_columns/input_layer/max_rad/ShapeShapeParseExample/ParseExample:12*
T0*
out_type0*
_output_shapes
:
љ
Fdnn/input_from_feature_columns/input_layer/max_rad/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
њ
Hdnn/input_from_feature_columns/input_layer/max_rad/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
њ
Hdnn/input_from_feature_columns/input_layer/max_rad/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Э
@dnn/input_from_feature_columns/input_layer/max_rad/strided_sliceStridedSlice8dnn/input_from_feature_columns/input_layer/max_rad/ShapeFdnn/input_from_feature_columns/input_layer/max_rad/strided_slice/stackHdnn/input_from_feature_columns/input_layer/max_rad/strided_slice/stack_1Hdnn/input_from_feature_columns/input_layer/max_rad/strided_slice/stack_2*
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask 
ё
Bdnn/input_from_feature_columns/input_layer/max_rad/Reshape/shape/1Const*
_output_shapes
: *
value	B :*
dtype0
ѕ
@dnn/input_from_feature_columns/input_layer/max_rad/Reshape/shapePack@dnn/input_from_feature_columns/input_layer/max_rad/strided_sliceBdnn/input_from_feature_columns/input_layer/max_rad/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
т
:dnn/input_from_feature_columns/input_layer/max_rad/ReshapeReshapeParseExample/ParseExample:12@dnn/input_from_feature_columns/input_layer/max_rad/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:         
Ќ
;dnn/input_from_feature_columns/input_layer/median_rad/ShapeShapeParseExample/ParseExample:13*
T0*
out_type0*
_output_shapes
:
Њ
Idnn/input_from_feature_columns/input_layer/median_rad/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
Ћ
Kdnn/input_from_feature_columns/input_layer/median_rad/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Ћ
Kdnn/input_from_feature_columns/input_layer/median_rad/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Є
Cdnn/input_from_feature_columns/input_layer/median_rad/strided_sliceStridedSlice;dnn/input_from_feature_columns/input_layer/median_rad/ShapeIdnn/input_from_feature_columns/input_layer/median_rad/strided_slice/stackKdnn/input_from_feature_columns/input_layer/median_rad/strided_slice/stack_1Kdnn/input_from_feature_columns/input_layer/median_rad/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
Є
Ednn/input_from_feature_columns/input_layer/median_rad/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
Љ
Cdnn/input_from_feature_columns/input_layer/median_rad/Reshape/shapePackCdnn/input_from_feature_columns/input_layer/median_rad/strided_sliceEdnn/input_from_feature_columns/input_layer/median_rad/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
в
=dnn/input_from_feature_columns/input_layer/median_rad/ReshapeReshapeParseExample/ParseExample:13Cdnn/input_from_feature_columns/input_layer/median_rad/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:         
ћ
8dnn/input_from_feature_columns/input_layer/min_rad/ShapeShapeParseExample/ParseExample:14*
T0*
out_type0*
_output_shapes
:
љ
Fdnn/input_from_feature_columns/input_layer/min_rad/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
њ
Hdnn/input_from_feature_columns/input_layer/min_rad/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
њ
Hdnn/input_from_feature_columns/input_layer/min_rad/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Э
@dnn/input_from_feature_columns/input_layer/min_rad/strided_sliceStridedSlice8dnn/input_from_feature_columns/input_layer/min_rad/ShapeFdnn/input_from_feature_columns/input_layer/min_rad/strided_slice/stackHdnn/input_from_feature_columns/input_layer/min_rad/strided_slice/stack_1Hdnn/input_from_feature_columns/input_layer/min_rad/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
ё
Bdnn/input_from_feature_columns/input_layer/min_rad/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
ѕ
@dnn/input_from_feature_columns/input_layer/min_rad/Reshape/shapePack@dnn/input_from_feature_columns/input_layer/min_rad/strided_sliceBdnn/input_from_feature_columns/input_layer/min_rad/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
т
:dnn/input_from_feature_columns/input_layer/min_rad/ReshapeReshapeParseExample/ParseExample:14@dnn/input_from_feature_columns/input_layer/min_rad/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:         
ћ
8dnn/input_from_feature_columns/input_layer/var_rad/ShapeShapeParseExample/ParseExample:15*
T0*
out_type0*
_output_shapes
:
љ
Fdnn/input_from_feature_columns/input_layer/var_rad/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
њ
Hdnn/input_from_feature_columns/input_layer/var_rad/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
њ
Hdnn/input_from_feature_columns/input_layer/var_rad/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Э
@dnn/input_from_feature_columns/input_layer/var_rad/strided_sliceStridedSlice8dnn/input_from_feature_columns/input_layer/var_rad/ShapeFdnn/input_from_feature_columns/input_layer/var_rad/strided_slice/stackHdnn/input_from_feature_columns/input_layer/var_rad/strided_slice/stack_1Hdnn/input_from_feature_columns/input_layer/var_rad/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
ё
Bdnn/input_from_feature_columns/input_layer/var_rad/Reshape/shape/1Const*
_output_shapes
: *
value	B :*
dtype0
ѕ
@dnn/input_from_feature_columns/input_layer/var_rad/Reshape/shapePack@dnn/input_from_feature_columns/input_layer/var_rad/strided_sliceBdnn/input_from_feature_columns/input_layer/var_rad/Reshape/shape/1*

axis *
N*
_output_shapes
:*
T0
т
:dnn/input_from_feature_columns/input_layer/var_rad/ReshapeReshapeParseExample/ParseExample:15@dnn/input_from_feature_columns/input_layer/var_rad/Reshape/shape*'
_output_shapes
:         *
T0*
Tshape0
x
6dnn/input_from_feature_columns/input_layer/concat/axisConst*
value	B :*
dtype0*
_output_shapes
: 
║
1dnn/input_from_feature_columns/input_layer/concatConcatV2:dnn/input_from_feature_columns/input_layer/avg_rad/Reshape9dnn/input_from_feature_columns/input_layer/fract1/Reshape:dnn/input_from_feature_columns/input_layer/fract10/Reshape9dnn/input_from_feature_columns/input_layer/fract2/Reshape9dnn/input_from_feature_columns/input_layer/fract3/Reshape9dnn/input_from_feature_columns/input_layer/fract4/Reshape9dnn/input_from_feature_columns/input_layer/fract5/Reshape9dnn/input_from_feature_columns/input_layer/fract6/Reshape9dnn/input_from_feature_columns/input_layer/fract7/Reshape9dnn/input_from_feature_columns/input_layer/fract8/Reshape9dnn/input_from_feature_columns/input_layer/fract9/Reshape:dnn/input_from_feature_columns/input_layer/max_rad/Reshape=dnn/input_from_feature_columns/input_layer/median_rad/Reshape:dnn/input_from_feature_columns/input_layer/min_rad/Reshape:dnn/input_from_feature_columns/input_layer/var_rad/Reshape6dnn/input_from_feature_columns/input_layer/concat/axis*

Tidx0*
T0*
N*'
_output_shapes
:         
┼
@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
valueB"      
и
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/minConst*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
valueB
 *.щСЙ*
dtype0
и
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/maxConst*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
valueB
 *.щС>*
dtype0*
_output_shapes
: 
ъ
Hdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:*

seed *
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
seed2 
џ
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
г
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes

:
ъ
:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
_output_shapes

:*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0
К
dnn/hiddenlayer_0/kernel/part_0
VariableV2*
dtype0*
_output_shapes

:*
shared_name *2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
	container *
shape
:
Њ
&dnn/hiddenlayer_0/kernel/part_0/AssignAssigndnn/hiddenlayer_0/kernel/part_0:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform*
validate_shape(*
_output_shapes

:*
use_locking(*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0
«
$dnn/hiddenlayer_0/kernel/part_0/readIdentitydnn/hiddenlayer_0/kernel/part_0*
_output_shapes

:*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0
«
/dnn/hiddenlayer_0/bias/part_0/Initializer/zerosConst*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
valueB*    *
dtype0*
_output_shapes
:
╗
dnn/hiddenlayer_0/bias/part_0
VariableV2*
dtype0*
_output_shapes
:*
shared_name *0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
	container *
shape:
■
$dnn/hiddenlayer_0/bias/part_0/AssignAssigndnn/hiddenlayer_0/bias/part_0/dnn/hiddenlayer_0/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
ц
"dnn/hiddenlayer_0/bias/part_0/readIdentitydnn/hiddenlayer_0/bias/part_0*
_output_shapes
:*
T0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0
s
dnn/hiddenlayer_0/kernelIdentity$dnn/hiddenlayer_0/kernel/part_0/read*
T0*
_output_shapes

:
К
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concatdnn/hiddenlayer_0/kernel*'
_output_shapes
:         *
transpose_a( *
transpose_b( *
T0
k
dnn/hiddenlayer_0/biasIdentity"dnn/hiddenlayer_0/bias/part_0/read*
T0*
_output_shapes
:
Ъ
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/bias*
T0*
data_formatNHWC*'
_output_shapes
:         
k
dnn/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*'
_output_shapes
:         
[
dnn/zero_fraction/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
ѓ
dnn/zero_fraction/EqualEqualdnn/hiddenlayer_0/Reludnn/zero_fraction/zero*
T0*'
_output_shapes
:         
x
dnn/zero_fraction/CastCastdnn/zero_fraction/Equal*

SrcT0
*'
_output_shapes
:         *

DstT0
h
dnn/zero_fraction/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
Ї
dnn/zero_fraction/MeanMeandnn/zero_fraction/Castdnn/zero_fraction/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
а
2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_0/fraction_of_zero_values*
dtype0
Ф
-dnn/dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/Mean*
T0*
_output_shapes
: 
Ё
$dnn/dnn/hiddenlayer_0/activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_0/activation
Њ
 dnn/dnn/hiddenlayer_0/activationHistogramSummary$dnn/dnn/hiddenlayer_0/activation/tagdnn/hiddenlayer_0/Relu*
_output_shapes
: *
T0
┼
@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shapeConst*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
valueB"      *
dtype0*
_output_shapes
:
и
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/minConst*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
valueB
 *.щСЙ*
dtype0*
_output_shapes
: 
и
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/maxConst*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
valueB
 *.щС>*
dtype0*
_output_shapes
: 
ъ
Hdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shape*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
seed2 *
dtype0*
_output_shapes

:*

seed 
џ
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
г
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes

:
ъ
:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes

:
К
dnn/hiddenlayer_1/kernel/part_0
VariableV2*
shared_name *2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
	container *
shape
:*
dtype0*
_output_shapes

:
Њ
&dnn/hiddenlayer_1/kernel/part_0/AssignAssigndnn/hiddenlayer_1/kernel/part_0:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform*
use_locking(*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
validate_shape(*
_output_shapes

:
«
$dnn/hiddenlayer_1/kernel/part_0/readIdentitydnn/hiddenlayer_1/kernel/part_0*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes

:
«
/dnn/hiddenlayer_1/bias/part_0/Initializer/zerosConst*
_output_shapes
:*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
valueB*    *
dtype0
╗
dnn/hiddenlayer_1/bias/part_0
VariableV2*
_output_shapes
:*
shared_name *0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
	container *
shape:*
dtype0
■
$dnn/hiddenlayer_1/bias/part_0/AssignAssigndnn/hiddenlayer_1/bias/part_0/dnn/hiddenlayer_1/bias/part_0/Initializer/zeros*
use_locking(*
T0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
validate_shape(*
_output_shapes
:
ц
"dnn/hiddenlayer_1/bias/part_0/readIdentitydnn/hiddenlayer_1/bias/part_0*
T0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
_output_shapes
:
s
dnn/hiddenlayer_1/kernelIdentity$dnn/hiddenlayer_1/kernel/part_0/read*
T0*
_output_shapes

:
г
dnn/hiddenlayer_1/MatMulMatMuldnn/hiddenlayer_0/Reludnn/hiddenlayer_1/kernel*
transpose_b( *
T0*'
_output_shapes
:         *
transpose_a( 
k
dnn/hiddenlayer_1/biasIdentity"dnn/hiddenlayer_1/bias/part_0/read*
_output_shapes
:*
T0
Ъ
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/bias*
data_formatNHWC*'
_output_shapes
:         *
T0
k
dnn/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*'
_output_shapes
:         *
T0
]
dnn/zero_fraction_1/zeroConst*
_output_shapes
: *
valueB
 *    *
dtype0
є
dnn/zero_fraction_1/EqualEqualdnn/hiddenlayer_1/Reludnn/zero_fraction_1/zero*'
_output_shapes
:         *
T0
|
dnn/zero_fraction_1/CastCastdnn/zero_fraction_1/Equal*

SrcT0
*'
_output_shapes
:         *

DstT0
j
dnn/zero_fraction_1/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
Њ
dnn/zero_fraction_1/MeanMeandnn/zero_fraction_1/Castdnn/zero_fraction_1/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
а
2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_1/fraction_of_zero_values*
dtype0*
_output_shapes
: 
Г
-dnn/dnn/hiddenlayer_1/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsdnn/zero_fraction_1/Mean*
T0*
_output_shapes
: 
Ё
$dnn/dnn/hiddenlayer_1/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_1/activation*
dtype0*
_output_shapes
: 
Њ
 dnn/dnn/hiddenlayer_1/activationHistogramSummary$dnn/dnn/hiddenlayer_1/activation/tagdnn/hiddenlayer_1/Relu*
T0*
_output_shapes
: 
┼
@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shapeConst*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
valueB"      *
dtype0*
_output_shapes
:
и
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/minConst*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
valueB
 *.щСЙ*
dtype0*
_output_shapes
: 
и
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/maxConst*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
valueB
 *.щС>*
dtype0*
_output_shapes
: 
ъ
Hdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shape*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
seed2 *
dtype0*
_output_shapes

:*

seed 
џ
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
г
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:
ъ
:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:
К
dnn/hiddenlayer_2/kernel/part_0
VariableV2*
shared_name *2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
	container *
shape
:*
dtype0*
_output_shapes

:
Њ
&dnn/hiddenlayer_2/kernel/part_0/AssignAssigndnn/hiddenlayer_2/kernel/part_0:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform*
use_locking(*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
validate_shape(*
_output_shapes

:
«
$dnn/hiddenlayer_2/kernel/part_0/readIdentitydnn/hiddenlayer_2/kernel/part_0*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:
«
/dnn/hiddenlayer_2/bias/part_0/Initializer/zerosConst*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
valueB*    *
dtype0*
_output_shapes
:
╗
dnn/hiddenlayer_2/bias/part_0
VariableV2*
	container *
shape:*
dtype0*
_output_shapes
:*
shared_name *0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0
■
$dnn/hiddenlayer_2/bias/part_0/AssignAssigndnn/hiddenlayer_2/bias/part_0/dnn/hiddenlayer_2/bias/part_0/Initializer/zeros*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0
ц
"dnn/hiddenlayer_2/bias/part_0/readIdentitydnn/hiddenlayer_2/bias/part_0*
T0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
_output_shapes
:
s
dnn/hiddenlayer_2/kernelIdentity$dnn/hiddenlayer_2/kernel/part_0/read*
_output_shapes

:*
T0
г
dnn/hiddenlayer_2/MatMulMatMuldnn/hiddenlayer_1/Reludnn/hiddenlayer_2/kernel*
T0*'
_output_shapes
:         *
transpose_a( *
transpose_b( 
k
dnn/hiddenlayer_2/biasIdentity"dnn/hiddenlayer_2/bias/part_0/read*
T0*
_output_shapes
:
Ъ
dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMuldnn/hiddenlayer_2/bias*
T0*
data_formatNHWC*'
_output_shapes
:         
k
dnn/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*
T0*'
_output_shapes
:         
]
dnn/zero_fraction_2/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
є
dnn/zero_fraction_2/EqualEqualdnn/hiddenlayer_2/Reludnn/zero_fraction_2/zero*'
_output_shapes
:         *
T0
|
dnn/zero_fraction_2/CastCastdnn/zero_fraction_2/Equal*

SrcT0
*'
_output_shapes
:         *

DstT0
j
dnn/zero_fraction_2/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
Њ
dnn/zero_fraction_2/MeanMeandnn/zero_fraction_2/Castdnn/zero_fraction_2/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
а
2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_2/fraction_of_zero_values*
dtype0*
_output_shapes
: 
Г
-dnn/dnn/hiddenlayer_2/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsdnn/zero_fraction_2/Mean*
T0*
_output_shapes
: 
Ё
$dnn/dnn/hiddenlayer_2/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_2/activation*
dtype0*
_output_shapes
: 
Њ
 dnn/dnn/hiddenlayer_2/activationHistogramSummary$dnn/dnn/hiddenlayer_2/activation/tagdnn/hiddenlayer_2/Relu*
T0*
_output_shapes
: 
и
9dnn/logits/kernel/part_0/Initializer/random_uniform/shapeConst*+
_class!
loc:@dnn/logits/kernel/part_0*
valueB"      *
dtype0*
_output_shapes
:
Е
7dnn/logits/kernel/part_0/Initializer/random_uniform/minConst*+
_class!
loc:@dnn/logits/kernel/part_0*
valueB
 *q─┐*
dtype0*
_output_shapes
: 
Е
7dnn/logits/kernel/part_0/Initializer/random_uniform/maxConst*+
_class!
loc:@dnn/logits/kernel/part_0*
valueB
 *q─?*
dtype0*
_output_shapes
: 
Ѕ
Adnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform9dnn/logits/kernel/part_0/Initializer/random_uniform/shape*
seed2 *
dtype0*
_output_shapes

:*

seed *
T0*+
_class!
loc:@dnn/logits/kernel/part_0
■
7dnn/logits/kernel/part_0/Initializer/random_uniform/subSub7dnn/logits/kernel/part_0/Initializer/random_uniform/max7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes
: 
љ
7dnn/logits/kernel/part_0/Initializer/random_uniform/mulMulAdnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniform7dnn/logits/kernel/part_0/Initializer/random_uniform/sub*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes

:
ѓ
3dnn/logits/kernel/part_0/Initializer/random_uniformAdd7dnn/logits/kernel/part_0/Initializer/random_uniform/mul7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes

:
╣
dnn/logits/kernel/part_0
VariableV2*
dtype0*
_output_shapes

:*
shared_name *+
_class!
loc:@dnn/logits/kernel/part_0*
	container *
shape
:
э
dnn/logits/kernel/part_0/AssignAssigndnn/logits/kernel/part_03dnn/logits/kernel/part_0/Initializer/random_uniform*
_output_shapes

:*
use_locking(*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
validate_shape(
Ў
dnn/logits/kernel/part_0/readIdentitydnn/logits/kernel/part_0*
_output_shapes

:*
T0*+
_class!
loc:@dnn/logits/kernel/part_0
а
(dnn/logits/bias/part_0/Initializer/zerosConst*)
_class
loc:@dnn/logits/bias/part_0*
valueB*    *
dtype0*
_output_shapes
:
Г
dnn/logits/bias/part_0
VariableV2*
_output_shapes
:*
shared_name *)
_class
loc:@dnn/logits/bias/part_0*
	container *
shape:*
dtype0
Р
dnn/logits/bias/part_0/AssignAssigndnn/logits/bias/part_0(dnn/logits/bias/part_0/Initializer/zeros*
T0*)
_class
loc:@dnn/logits/bias/part_0*
validate_shape(*
_output_shapes
:*
use_locking(
Ј
dnn/logits/bias/part_0/readIdentitydnn/logits/bias/part_0*
T0*)
_class
loc:@dnn/logits/bias/part_0*
_output_shapes
:
e
dnn/logits/kernelIdentitydnn/logits/kernel/part_0/read*
_output_shapes

:*
T0
ъ
dnn/logits/MatMulMatMuldnn/hiddenlayer_2/Reludnn/logits/kernel*
T0*'
_output_shapes
:         *
transpose_a( *
transpose_b( 
]
dnn/logits/biasIdentitydnn/logits/bias/part_0/read*
_output_shapes
:*
T0
і
dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/bias*
T0*
data_formatNHWC*'
_output_shapes
:         
]
dnn/zero_fraction_3/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
ѓ
dnn/zero_fraction_3/EqualEqualdnn/logits/BiasAdddnn/zero_fraction_3/zero*
T0*'
_output_shapes
:         
|
dnn/zero_fraction_3/CastCastdnn/zero_fraction_3/Equal*'
_output_shapes
:         *

DstT0*

SrcT0

j
dnn/zero_fraction_3/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
Њ
dnn/zero_fraction_3/MeanMeandnn/zero_fraction_3/Castdnn/zero_fraction_3/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
њ
+dnn/dnn/logits/fraction_of_zero_values/tagsConst*7
value.B, B&dnn/dnn/logits/fraction_of_zero_values*
dtype0*
_output_shapes
: 
Ъ
&dnn/dnn/logits/fraction_of_zero_valuesScalarSummary+dnn/dnn/logits/fraction_of_zero_values/tagsdnn/zero_fraction_3/Mean*
_output_shapes
: *
T0
w
dnn/dnn/logits/activation/tagConst**
value!B Bdnn/dnn/logits/activation*
dtype0*
_output_shapes
: 
Ђ
dnn/dnn/logits/activationHistogramSummarydnn/dnn/logits/activation/tagdnn/logits/BiasAdd*
_output_shapes
: *
T0
g
dnn/head/logits/ShapeShapednn/logits/BiasAdd*
T0*
out_type0*
_output_shapes
:
b
 dnn/head/logits/assert_rank/rankConst*
value	B :*
dtype0*
_output_shapes
: 
R
Jdnn/head/logits/assert_rank/assert_type/statically_determined_correct_typeNoOp
C
;dnn/head/logits/assert_rank/static_checks_determined_all_okNoOp
Ф
#dnn/head/logits/strided_slice/stackConst<^dnn/head/logits/assert_rank/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
Г
%dnn/head/logits/strided_slice/stack_1Const<^dnn/head/logits/assert_rank/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
Г
%dnn/head/logits/strided_slice/stack_2Const<^dnn/head/logits/assert_rank/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
╔
dnn/head/logits/strided_sliceStridedSlicednn/head/logits/Shape#dnn/head/logits/strided_slice/stack%dnn/head/logits/strided_slice/stack_1%dnn/head/logits/strided_slice/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask
ъ
dnn/head/logits/assert_equal/xConst<^dnn/head/logits/assert_rank/static_checks_determined_all_ok*
value	B :*
dtype0*
_output_shapes
: 
І
"dnn/head/logits/assert_equal/EqualEqualdnn/head/logits/assert_equal/xdnn/head/logits/strided_slice*
T0*
_output_shapes
: 
Б
"dnn/head/logits/assert_equal/ConstConst<^dnn/head/logits/assert_rank/static_checks_determined_all_ok*
valueB *
dtype0*
_output_shapes
: 
ц
 dnn/head/logits/assert_equal/AllAll"dnn/head/logits/assert_equal/Equal"dnn/head/logits/assert_equal/Const*
_output_shapes
: *
	keep_dims( *

Tidx0
і
*dnn/head/logits/assert_equal/Assert/AssertAssert dnn/head/logits/assert_equal/Alldnn/head/logits/Shape*

T
2*
	summarize
╠
dnn/head/logitsIdentitydnn/logits/BiasAdd<^dnn/head/logits/assert_rank/static_checks_determined_all_ok+^dnn/head/logits/assert_equal/Assert/Assert*
T0*'
_output_shapes
:         
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
ё
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_e80db09db0444233ade549222a29f2f4/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
	separator *
N*
_output_shapes
: 
Q
save/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
\
save/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 
}
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards*
_output_shapes
: 
Е
save/SaveV2/tensor_namesConst*▄
valueмB¤	Bdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/logits/biasBdnn/logits/kernelBglobal_step*
dtype0*
_output_shapes
:	
╔
save/SaveV2/shape_and_slicesConst*y
valuepBn	B15 0,15B15 15 0,15:0,15B15 0,15B15 15 0,15:0,15B15 0,15B15 15 0,15:0,15B1 0,1B15 1 0,15:0,1B *
dtype0*
_output_shapes
:	
Б
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices"dnn/hiddenlayer_0/bias/part_0/read$dnn/hiddenlayer_0/kernel/part_0/read"dnn/hiddenlayer_1/bias/part_0/read$dnn/hiddenlayer_1/kernel/part_0/read"dnn/hiddenlayer_2/bias/part_0/read$dnn/hiddenlayer_2/kernel/part_0/readdnn/logits/bias/part_0/readdnn/logits/kernel/part_0/readglobal_step*
dtypes
2		
Љ
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2*'
_class
loc:@save/ShardedFilename*
_output_shapes
: *
T0
Ю
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency*
_output_shapes
:*
T0*

axis *
N
}
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const*
delete_old_dirs(
z
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints*
T0*
_output_shapes
: 
z
save/RestoreV2/tensor_namesConst*+
value"B Bdnn/hiddenlayer_0/bias*
dtype0*
_output_shapes
:
o
save/RestoreV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB15 0,15
њ
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
_output_shapes
:*
dtypes
2
─
save/AssignAssigndnn/hiddenlayer_0/bias/part_0save/RestoreV2*
_output_shapes
:*
use_locking(*
T0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
validate_shape(
~
save/RestoreV2_1/tensor_namesConst*-
value$B"Bdnn/hiddenlayer_0/kernel*
dtype0*
_output_shapes
:
y
!save/RestoreV2_1/shape_and_slicesConst*$
valueBB15 15 0,15:0,15*
dtype0*
_output_shapes
:
ю
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
_output_shapes

:*
dtypes
2
л
save/Assign_1Assigndnn/hiddenlayer_0/kernel/part_0save/RestoreV2_1*
validate_shape(*
_output_shapes

:*
use_locking(*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0
|
save/RestoreV2_2/tensor_namesConst*+
value"B Bdnn/hiddenlayer_1/bias*
dtype0*
_output_shapes
:
q
!save/RestoreV2_2/shape_and_slicesConst*
valueBB15 0,15*
dtype0*
_output_shapes
:
ў
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save/Assign_2Assigndnn/hiddenlayer_1/bias/part_0save/RestoreV2_2*
use_locking(*
T0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
validate_shape(*
_output_shapes
:
~
save/RestoreV2_3/tensor_namesConst*-
value$B"Bdnn/hiddenlayer_1/kernel*
dtype0*
_output_shapes
:
y
!save/RestoreV2_3/shape_and_slicesConst*$
valueBB15 15 0,15:0,15*
dtype0*
_output_shapes
:
ю
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
_output_shapes

:*
dtypes
2
л
save/Assign_3Assigndnn/hiddenlayer_1/kernel/part_0save/RestoreV2_3*
use_locking(*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
validate_shape(*
_output_shapes

:
|
save/RestoreV2_4/tensor_namesConst*
_output_shapes
:*+
value"B Bdnn/hiddenlayer_2/bias*
dtype0
q
!save/RestoreV2_4/shape_and_slicesConst*
valueBB15 0,15*
dtype0*
_output_shapes
:
ў
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save/Assign_4Assigndnn/hiddenlayer_2/bias/part_0save/RestoreV2_4*
T0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
validate_shape(*
_output_shapes
:*
use_locking(
~
save/RestoreV2_5/tensor_namesConst*-
value$B"Bdnn/hiddenlayer_2/kernel*
dtype0*
_output_shapes
:
y
!save/RestoreV2_5/shape_and_slicesConst*$
valueBB15 15 0,15:0,15*
dtype0*
_output_shapes
:
ю
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes

:
л
save/Assign_5Assigndnn/hiddenlayer_2/kernel/part_0save/RestoreV2_5*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
validate_shape(*
_output_shapes

:*
use_locking(
u
save/RestoreV2_6/tensor_namesConst*$
valueBBdnn/logits/bias*
dtype0*
_output_shapes
:
o
!save/RestoreV2_6/shape_and_slicesConst*
valueBB1 0,1*
dtype0*
_output_shapes
:
ў
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
_output_shapes
:*
dtypes
2
║
save/Assign_6Assigndnn/logits/bias/part_0save/RestoreV2_6*
_output_shapes
:*
use_locking(*
T0*)
_class
loc:@dnn/logits/bias/part_0*
validate_shape(
w
save/RestoreV2_7/tensor_namesConst*&
valueBBdnn/logits/kernel*
dtype0*
_output_shapes
:
w
!save/RestoreV2_7/shape_and_slicesConst*"
valueBB15 1 0,15:0,1*
dtype0*
_output_shapes
:
ю
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
_output_shapes

:*
dtypes
2
┬
save/Assign_7Assigndnn/logits/kernel/part_0save/RestoreV2_7*
_output_shapes

:*
use_locking(*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
validate_shape(
q
save/RestoreV2_8/tensor_namesConst* 
valueBBglobal_step*
dtype0*
_output_shapes
:
j
!save/RestoreV2_8/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
ќ
save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
dtypes
2	*
_output_shapes
:
а
save/Assign_8Assignglobal_stepsave/RestoreV2_8*
_output_shapes
: *
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(
е
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8
-
save/restore_allNoOp^save/restore_shard

initNoOp

init_all_tablesNoOp
+

group_depsNoOp^init^init_all_tables
R
save_1/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
є
save_1/StringJoin/inputs_1Const*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_85bb83fff9614d92b9561277ab45ecbd/part
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
S
save_1/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
^
save_1/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 
Ё
save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards*
_output_shapes
: 
Ф
save_1/SaveV2/tensor_namesConst*▄
valueмB¤	Bdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/logits/biasBdnn/logits/kernelBglobal_step*
dtype0*
_output_shapes
:	
╦
save_1/SaveV2/shape_and_slicesConst*y
valuepBn	B15 0,15B15 15 0,15:0,15B15 0,15B15 15 0,15:0,15B15 0,15B15 15 0,15:0,15B1 0,1B15 1 0,15:0,1B *
dtype0*
_output_shapes
:	
Ф
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slices"dnn/hiddenlayer_0/bias/part_0/read$dnn/hiddenlayer_0/kernel/part_0/read"dnn/hiddenlayer_1/bias/part_0/read$dnn/hiddenlayer_1/kernel/part_0/read"dnn/hiddenlayer_2/bias/part_0/read$dnn/hiddenlayer_2/kernel/part_0/readdnn/logits/bias/part_0/readdnn/logits/kernel/part_0/readglobal_step*
dtypes
2		
Ў
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2*
_output_shapes
: *
T0*)
_class
loc:@save_1/ShardedFilename
Б
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency*

axis *
N*
_output_shapes
:*
T0
Ѓ
save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const*
delete_old_dirs(
ѓ
save_1/IdentityIdentitysave_1/Const^save_1/control_dependency^save_1/MergeV2Checkpoints*
_output_shapes
: *
T0
|
save_1/RestoreV2/tensor_namesConst*
_output_shapes
:*+
value"B Bdnn/hiddenlayer_0/bias*
dtype0
q
!save_1/RestoreV2/shape_and_slicesConst*
valueBB15 0,15*
dtype0*
_output_shapes
:
џ
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices*
_output_shapes
:*
dtypes
2
╚
save_1/AssignAssigndnn/hiddenlayer_0/bias/part_0save_1/RestoreV2*
use_locking(*
T0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
validate_shape(*
_output_shapes
:
ђ
save_1/RestoreV2_1/tensor_namesConst*-
value$B"Bdnn/hiddenlayer_0/kernel*
dtype0*
_output_shapes
:
{
#save_1/RestoreV2_1/shape_and_slicesConst*$
valueBB15 15 0,15:0,15*
dtype0*
_output_shapes
:
ц
save_1/RestoreV2_1	RestoreV2save_1/Constsave_1/RestoreV2_1/tensor_names#save_1/RestoreV2_1/shape_and_slices*
_output_shapes

:*
dtypes
2
н
save_1/Assign_1Assigndnn/hiddenlayer_0/kernel/part_0save_1/RestoreV2_1*
use_locking(*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
validate_shape(*
_output_shapes

:
~
save_1/RestoreV2_2/tensor_namesConst*+
value"B Bdnn/hiddenlayer_1/bias*
dtype0*
_output_shapes
:
s
#save_1/RestoreV2_2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB15 0,15
а
save_1/RestoreV2_2	RestoreV2save_1/Constsave_1/RestoreV2_2/tensor_names#save_1/RestoreV2_2/shape_and_slices*
_output_shapes
:*
dtypes
2
╠
save_1/Assign_2Assigndnn/hiddenlayer_1/bias/part_0save_1/RestoreV2_2*
use_locking(*
T0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
validate_shape(*
_output_shapes
:
ђ
save_1/RestoreV2_3/tensor_namesConst*
dtype0*
_output_shapes
:*-
value$B"Bdnn/hiddenlayer_1/kernel
{
#save_1/RestoreV2_3/shape_and_slicesConst*$
valueBB15 15 0,15:0,15*
dtype0*
_output_shapes
:
ц
save_1/RestoreV2_3	RestoreV2save_1/Constsave_1/RestoreV2_3/tensor_names#save_1/RestoreV2_3/shape_and_slices*
_output_shapes

:*
dtypes
2
н
save_1/Assign_3Assigndnn/hiddenlayer_1/kernel/part_0save_1/RestoreV2_3*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
validate_shape(*
_output_shapes

:*
use_locking(*
T0
~
save_1/RestoreV2_4/tensor_namesConst*+
value"B Bdnn/hiddenlayer_2/bias*
dtype0*
_output_shapes
:
s
#save_1/RestoreV2_4/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB15 0,15
а
save_1/RestoreV2_4	RestoreV2save_1/Constsave_1/RestoreV2_4/tensor_names#save_1/RestoreV2_4/shape_and_slices*
_output_shapes
:*
dtypes
2
╠
save_1/Assign_4Assigndnn/hiddenlayer_2/bias/part_0save_1/RestoreV2_4*
use_locking(*
T0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
validate_shape(*
_output_shapes
:
ђ
save_1/RestoreV2_5/tensor_namesConst*-
value$B"Bdnn/hiddenlayer_2/kernel*
dtype0*
_output_shapes
:
{
#save_1/RestoreV2_5/shape_and_slicesConst*
dtype0*
_output_shapes
:*$
valueBB15 15 0,15:0,15
ц
save_1/RestoreV2_5	RestoreV2save_1/Constsave_1/RestoreV2_5/tensor_names#save_1/RestoreV2_5/shape_and_slices*
_output_shapes

:*
dtypes
2
н
save_1/Assign_5Assigndnn/hiddenlayer_2/kernel/part_0save_1/RestoreV2_5*
use_locking(*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
validate_shape(*
_output_shapes

:
w
save_1/RestoreV2_6/tensor_namesConst*$
valueBBdnn/logits/bias*
dtype0*
_output_shapes
:
q
#save_1/RestoreV2_6/shape_and_slicesConst*
valueBB1 0,1*
dtype0*
_output_shapes
:
а
save_1/RestoreV2_6	RestoreV2save_1/Constsave_1/RestoreV2_6/tensor_names#save_1/RestoreV2_6/shape_and_slices*
_output_shapes
:*
dtypes
2
Й
save_1/Assign_6Assigndnn/logits/bias/part_0save_1/RestoreV2_6*
use_locking(*
T0*)
_class
loc:@dnn/logits/bias/part_0*
validate_shape(*
_output_shapes
:
y
save_1/RestoreV2_7/tensor_namesConst*&
valueBBdnn/logits/kernel*
dtype0*
_output_shapes
:
y
#save_1/RestoreV2_7/shape_and_slicesConst*
dtype0*
_output_shapes
:*"
valueBB15 1 0,15:0,1
ц
save_1/RestoreV2_7	RestoreV2save_1/Constsave_1/RestoreV2_7/tensor_names#save_1/RestoreV2_7/shape_and_slices*
dtypes
2*
_output_shapes

:
к
save_1/Assign_7Assigndnn/logits/kernel/part_0save_1/RestoreV2_7*
_output_shapes

:*
use_locking(*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
validate_shape(
s
save_1/RestoreV2_8/tensor_namesConst* 
valueBBglobal_step*
dtype0*
_output_shapes
:
l
#save_1/RestoreV2_8/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
ъ
save_1/RestoreV2_8	RestoreV2save_1/Constsave_1/RestoreV2_8/tensor_names#save_1/RestoreV2_8/shape_and_slices*
dtypes
2	*
_output_shapes
:
ц
save_1/Assign_8Assignglobal_stepsave_1/RestoreV2_8*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
╝
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_2^save_1/Assign_3^save_1/Assign_4^save_1/Assign_5^save_1/Assign_6^save_1/Assign_7^save_1/Assign_8
1
save_1/restore_allNoOp^save_1/restore_shard"B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8"Г
	variablesЪю
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0
┘
!dnn/hiddenlayer_0/kernel/part_0:0&dnn/hiddenlayer_0/kernel/part_0/Assign&dnn/hiddenlayer_0/kernel/part_0/read:0"&
dnn/hiddenlayer_0/kernel  "2<dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform:0
├
dnn/hiddenlayer_0/bias/part_0:0$dnn/hiddenlayer_0/bias/part_0/Assign$dnn/hiddenlayer_0/bias/part_0/read:0"!
dnn/hiddenlayer_0/bias "21dnn/hiddenlayer_0/bias/part_0/Initializer/zeros:0
┘
!dnn/hiddenlayer_1/kernel/part_0:0&dnn/hiddenlayer_1/kernel/part_0/Assign&dnn/hiddenlayer_1/kernel/part_0/read:0"&
dnn/hiddenlayer_1/kernel  "2<dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform:0
├
dnn/hiddenlayer_1/bias/part_0:0$dnn/hiddenlayer_1/bias/part_0/Assign$dnn/hiddenlayer_1/bias/part_0/read:0"!
dnn/hiddenlayer_1/bias "21dnn/hiddenlayer_1/bias/part_0/Initializer/zeros:0
┘
!dnn/hiddenlayer_2/kernel/part_0:0&dnn/hiddenlayer_2/kernel/part_0/Assign&dnn/hiddenlayer_2/kernel/part_0/read:0"&
dnn/hiddenlayer_2/kernel  "2<dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform:0
├
dnn/hiddenlayer_2/bias/part_0:0$dnn/hiddenlayer_2/bias/part_0/Assign$dnn/hiddenlayer_2/bias/part_0/read:0"!
dnn/hiddenlayer_2/bias "21dnn/hiddenlayer_2/bias/part_0/Initializer/zeros:0
Х
dnn/logits/kernel/part_0:0dnn/logits/kernel/part_0/Assigndnn/logits/kernel/part_0/read:0"
dnn/logits/kernel  "25dnn/logits/kernel/part_0/Initializer/random_uniform:0
а
dnn/logits/bias/part_0:0dnn/logits/bias/part_0/Assigndnn/logits/bias/part_0/read:0"
dnn/logits/bias "2*dnn/logits/bias/part_0/Initializer/zeros:0" 
legacy_init_op


group_deps"О
	summaries╔
к
/dnn/dnn/hiddenlayer_0/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_0/activation:0
/dnn/dnn/hiddenlayer_1/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_1/activation:0
/dnn/dnn/hiddenlayer_2/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_2/activation:0
(dnn/dnn/logits/fraction_of_zero_values:0
dnn/dnn/logits/activation:0"П
trainable_variables┼┬
┘
!dnn/hiddenlayer_0/kernel/part_0:0&dnn/hiddenlayer_0/kernel/part_0/Assign&dnn/hiddenlayer_0/kernel/part_0/read:0"&
dnn/hiddenlayer_0/kernel  "2<dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform:0
├
dnn/hiddenlayer_0/bias/part_0:0$dnn/hiddenlayer_0/bias/part_0/Assign$dnn/hiddenlayer_0/bias/part_0/read:0"!
dnn/hiddenlayer_0/bias "21dnn/hiddenlayer_0/bias/part_0/Initializer/zeros:0
┘
!dnn/hiddenlayer_1/kernel/part_0:0&dnn/hiddenlayer_1/kernel/part_0/Assign&dnn/hiddenlayer_1/kernel/part_0/read:0"&
dnn/hiddenlayer_1/kernel  "2<dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform:0
├
dnn/hiddenlayer_1/bias/part_0:0$dnn/hiddenlayer_1/bias/part_0/Assign$dnn/hiddenlayer_1/bias/part_0/read:0"!
dnn/hiddenlayer_1/bias "21dnn/hiddenlayer_1/bias/part_0/Initializer/zeros:0
┘
!dnn/hiddenlayer_2/kernel/part_0:0&dnn/hiddenlayer_2/kernel/part_0/Assign&dnn/hiddenlayer_2/kernel/part_0/read:0"&
dnn/hiddenlayer_2/kernel  "2<dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform:0
├
dnn/hiddenlayer_2/bias/part_0:0$dnn/hiddenlayer_2/bias/part_0/Assign$dnn/hiddenlayer_2/bias/part_0/read:0"!
dnn/hiddenlayer_2/bias "21dnn/hiddenlayer_2/bias/part_0/Initializer/zeros:0
Х
dnn/logits/kernel/part_0:0dnn/logits/kernel/part_0/Assigndnn/logits/kernel/part_0/read:0"
dnn/logits/kernel  "25dnn/logits/kernel/part_0/Initializer/random_uniform:0
а
dnn/logits/bias/part_0:0dnn/logits/bias/part_0/Assigndnn/logits/bias/part_0/read:0"
dnn/logits/bias "2*dnn/logits/bias/part_0/Initializer/zeros:0" 
global_step

global_step:0*ў
predictї
5
examples)
input_example_tensor:0         7
predictions(
dnn/head/logits:0         tensorflow/serving/predict*Ћ

regressionє
3
inputs)
input_example_tensor:0         3
outputs(
dnn/head/logits:0         tensorflow/serving/regress*џ
serving_defaultє
3
inputs)
input_example_tensor:0         3
outputs(
dnn/head/logits:0         tensorflow/serving/regress