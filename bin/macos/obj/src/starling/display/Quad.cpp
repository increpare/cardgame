// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_openfl__Vector_AbstractVector
#include <openfl/_Vector/AbstractVector.h>
#endif
#ifndef INCLUDED_openfl_errors_ArgumentError
#include <openfl/errors/ArgumentError.h>
#endif
#ifndef INCLUDED_openfl_errors_Error
#include <openfl/errors/Error.h>
#endif
#ifndef INCLUDED_openfl_geom_Matrix
#include <openfl/geom/Matrix.h>
#endif
#ifndef INCLUDED_openfl_geom_Matrix3D
#include <openfl/geom/Matrix3D.h>
#endif
#ifndef INCLUDED_openfl_geom_Point
#include <openfl/geom/Point.h>
#endif
#ifndef INCLUDED_openfl_geom_Rectangle
#include <openfl/geom/Rectangle.h>
#endif
#ifndef INCLUDED_openfl_geom_Vector3D
#include <openfl/geom/Vector3D.h>
#endif
#ifndef INCLUDED_starling_display_DisplayObject
#include <starling/display/DisplayObject.h>
#endif
#ifndef INCLUDED_starling_display_DisplayObjectContainer
#include <starling/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_starling_display_Mesh
#include <starling/display/Mesh.h>
#endif
#ifndef INCLUDED_starling_display_Quad
#include <starling/display/Quad.h>
#endif
#ifndef INCLUDED_starling_display_Stage
#include <starling/display/Stage.h>
#endif
#ifndef INCLUDED_starling_events_EventDispatcher
#include <starling/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_starling_rendering_IndexData
#include <starling/rendering/IndexData.h>
#endif
#ifndef INCLUDED_starling_rendering_VertexData
#include <starling/rendering/VertexData.h>
#endif
#ifndef INCLUDED_starling_rendering_VertexDataFormat
#include <starling/rendering/VertexDataFormat.h>
#endif
#ifndef INCLUDED_starling_styles_MeshStyle
#include <starling/styles/MeshStyle.h>
#endif
#ifndef INCLUDED_starling_textures_Texture
#include <starling/textures/Texture.h>
#endif
#ifndef INCLUDED_starling_utils_RectangleUtil
#include <starling/utils/RectangleUtil.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_1efa6e292af3e694_64_new,"starling.display.Quad","new",0xf88fef6b,"starling.display.Quad.new","starling/display/Quad.hx",64,0x8338c1a3)
HX_LOCAL_STACK_FRAME(_hx_pos_1efa6e292af3e694_81___setupVertices,"starling.display.Quad","__setupVertices",0x529bac01,"starling.display.Quad.__setupVertices","starling/display/Quad.hx",81,0x8338c1a3)
HX_LOCAL_STACK_FRAME(_hx_pos_1efa6e292af3e694_120_getBounds,"starling.display.Quad","getBounds",0x927d88f6,"starling.display.Quad.getBounds","starling/display/Quad.hx",120,0x8338c1a3)
HX_LOCAL_STACK_FRAME(_hx_pos_1efa6e292af3e694_156_hitTest,"starling.display.Quad","hitTest",0x6a1f60d0,"starling.display.Quad.hitTest","starling/display/Quad.hx",156,0x8338c1a3)
HX_LOCAL_STACK_FRAME(_hx_pos_1efa6e292af3e694_166_readjustSize,"starling.display.Quad","readjustSize",0x7663d5f8,"starling.display.Quad.readjustSize","starling/display/Quad.hx",166,0x8338c1a3)
HX_LOCAL_STACK_FRAME(_hx_pos_1efa6e292af3e694_202_set_texture,"starling.display.Quad","set_texture",0x0f9ad209,"starling.display.Quad.set_texture","starling/display/Quad.hx",202,0x8338c1a3)
HX_LOCAL_STACK_FRAME(_hx_pos_1efa6e292af3e694_180_fromTexture,"starling.display.Quad","fromTexture",0x1773ce9c,"starling.display.Quad.fromTexture","starling/display/Quad.hx",180,0x8338c1a3)
HX_LOCAL_STACK_FRAME(_hx_pos_1efa6e292af3e694_58_boot,"starling.display.Quad","boot",0x7d7a8ec7,"starling.display.Quad.boot","starling/display/Quad.hx",58,0x8338c1a3)
HX_LOCAL_STACK_FRAME(_hx_pos_1efa6e292af3e694_59_boot,"starling.display.Quad","boot",0x7d7a8ec7,"starling.display.Quad.boot","starling/display/Quad.hx",59,0x8338c1a3)
HX_LOCAL_STACK_FRAME(_hx_pos_1efa6e292af3e694_60_boot,"starling.display.Quad","boot",0x7d7a8ec7,"starling.display.Quad.boot","starling/display/Quad.hx",60,0x8338c1a3)
namespace starling{
namespace display{

void Quad_obj::__construct(Float width,Float height,hx::Null< int >  __o_color){
int color = __o_color.Default(16777215);
            	HX_GC_STACKFRAME(&_hx_pos_1efa6e292af3e694_64_new)
HXLINE(  65)		this->_hx___bounds =  ::openfl::geom::Rectangle_obj::__alloc( HX_CTX ,(int)0,(int)0,width,height);
HXLINE(  67)		 ::starling::rendering::VertexData vertexData =  ::starling::rendering::VertexData_obj::__alloc( HX_CTX ,::starling::styles::MeshStyle_obj::VERTEX_FORMAT,(int)4);
HXLINE(  68)		 ::starling::rendering::IndexData indexData =  ::starling::rendering::IndexData_obj::__alloc( HX_CTX ,(int)6);
HXLINE(  70)		super::__construct(vertexData,indexData,null());
HXLINE(  72)		bool _hx_tmp;
HXDLIN(  72)		if ((width != ((Float)0.0))) {
HXLINE(  72)			_hx_tmp = (height == ((Float)0.0));
            		}
            		else {
HXLINE(  72)			_hx_tmp = true;
            		}
HXDLIN(  72)		if (_hx_tmp) {
HXLINE(  73)			HX_STACK_DO_THROW( ::openfl::errors::ArgumentError_obj::__alloc( HX_CTX ,HX_("Invalid size: width and height must not be zero",27,53,df,64)));
            		}
HXLINE(  75)		this->_hx___setupVertices();
HXLINE(  76)		this->set_color(color);
            	}

Dynamic Quad_obj::__CreateEmpty() { return new Quad_obj; }

void *Quad_obj::_hx_vtable = 0;

Dynamic Quad_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< Quad_obj > _hx_result = new Quad_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2]);
	return _hx_result;
}

bool Quad_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x3cebba07) {
		if (inClassId<=(int)0x25137bc0) {
			return inClassId==(int)0x00000001 || inClassId==(int)0x25137bc0;
		} else {
			return inClassId==(int)0x3cebba07;
		}
	} else {
		return inClassId==(int)0x3f9ca8e1 || inClassId==(int)0x6dea180f;
	}
}

void Quad_obj::_hx___setupVertices(){
            	HX_STACKFRAME(&_hx_pos_1efa6e292af3e694_81___setupVertices)
HXLINE(  82)		::String posAttr = HX_("position",a9,a0,fa,ca);
HXLINE(  83)		::String texAttr = HX_("texCoords",65,5d,73,a1);
HXLINE(  84)		 ::starling::textures::Texture texture = this->get_style()->get_texture();
HXLINE(  85)		 ::starling::rendering::VertexData vertexData = this->get_vertexData();
HXLINE(  86)		 ::starling::rendering::IndexData indexData = this->get_indexData();
HXLINE(  88)		indexData->set_numIndices((int)0);
HXLINE(  89)		indexData->addQuad((int)0,(int)1,(int)2,(int)3);
HXLINE(  91)		if ((vertexData->get_numVertices() != (int)4)) {
HXLINE(  93)			vertexData->set_numVertices((int)4);
HXLINE(  94)			vertexData->trim();
            		}
HXLINE(  97)		if (hx::IsNotNull( texture )) {
HXLINE(  99)			texture->setupVertexPositions(vertexData,(int)0,HX_("position",a9,a0,fa,ca),this->_hx___bounds);
HXLINE( 100)			texture->setupTextureCoordinates(vertexData,(int)0,texAttr);
            		}
            		else {
HXLINE( 104)			Float _hx_tmp = this->_hx___bounds->get_left();
HXDLIN( 104)			vertexData->setPoint((int)0,posAttr,_hx_tmp,this->_hx___bounds->get_top());
HXLINE( 105)			Float _hx_tmp1 = this->_hx___bounds->get_right();
HXDLIN( 105)			vertexData->setPoint((int)1,posAttr,_hx_tmp1,this->_hx___bounds->get_top());
HXLINE( 106)			Float _hx_tmp2 = this->_hx___bounds->get_left();
HXDLIN( 106)			vertexData->setPoint((int)2,posAttr,_hx_tmp2,this->_hx___bounds->get_bottom());
HXLINE( 107)			Float _hx_tmp3 = this->_hx___bounds->get_right();
HXDLIN( 107)			vertexData->setPoint((int)3,posAttr,_hx_tmp3,this->_hx___bounds->get_bottom());
HXLINE( 109)			vertexData->setPoint((int)0,texAttr,((Float)0.0),((Float)0.0));
HXLINE( 110)			vertexData->setPoint((int)1,texAttr,((Float)1.0),((Float)0.0));
HXLINE( 111)			vertexData->setPoint((int)2,texAttr,((Float)0.0),((Float)1.0));
HXLINE( 112)			vertexData->setPoint((int)3,texAttr,((Float)1.0),((Float)1.0));
            		}
HXLINE( 115)		this->setRequiresRedraw();
            	}


HX_DEFINE_DYNAMIC_FUNC0(Quad_obj,_hx___setupVertices,(void))

 ::openfl::geom::Rectangle Quad_obj::getBounds( ::starling::display::DisplayObject targetSpace, ::openfl::geom::Rectangle out){
            	HX_GC_STACKFRAME(&_hx_pos_1efa6e292af3e694_120_getBounds)
HXLINE( 121)		if (hx::IsNull( out )) {
HXLINE( 121)			out =  ::openfl::geom::Rectangle_obj::__alloc( HX_CTX ,null(),null(),null(),null());
            		}
HXLINE( 123)		if (hx::IsEq( targetSpace,hx::ObjectPtr<OBJ_>(this) )) {
HXLINE( 125)			out->copyFrom(this->_hx___bounds);
            		}
            		else {
HXLINE( 127)			bool _hx_tmp;
HXDLIN( 127)			if (hx::IsEq( targetSpace,this->get_parent() )) {
HXLINE( 127)				_hx_tmp = !(this->get_isRotated());
            			}
            			else {
HXLINE( 127)				_hx_tmp = false;
            			}
HXDLIN( 127)			if (_hx_tmp) {
HXLINE( 129)				Float scaleX = this->get_scaleX();
HXLINE( 130)				Float scaleY = this->get_scaleY();
HXLINE( 132)				Float _hx_tmp1 = this->get_x();
HXDLIN( 132)				Float _hx_tmp2 = (_hx_tmp1 - (this->get_pivotX() * scaleX));
HXDLIN( 132)				Float _hx_tmp3 = this->get_y();
HXDLIN( 132)				Float _hx_tmp4 = (_hx_tmp3 - (this->get_pivotY() * scaleY));
HXLINE( 133)				Float _hx_tmp5 = (this->_hx___bounds->width * scaleX);
HXLINE( 132)				out->setTo(_hx_tmp2,_hx_tmp4,_hx_tmp5,(this->_hx___bounds->height * scaleY));
HXLINE( 135)				if ((scaleX < (int)0)) {
HXLINE( 135)					 ::openfl::geom::Rectangle out1 = out;
HXDLIN( 135)					out1->width = (out1->width * (int)-1);
HXDLIN( 135)					 ::openfl::geom::Rectangle out2 = out;
HXDLIN( 135)					out2->x = (out2->x - out->width);
            				}
HXLINE( 136)				if ((scaleY < (int)0)) {
HXLINE( 136)					 ::openfl::geom::Rectangle out3 = out;
HXDLIN( 136)					out3->height = (out3->height * (int)-1);
HXDLIN( 136)					 ::openfl::geom::Rectangle out4 = out;
HXDLIN( 136)					out4->y = (out4->y - out->height);
            				}
            			}
            			else {
HXLINE( 138)				bool _hx_tmp6;
HXDLIN( 138)				if (this->get_is3D()) {
HXLINE( 138)					_hx_tmp6 = hx::IsNotNull( this->get_stage() );
            				}
            				else {
HXLINE( 138)					_hx_tmp6 = false;
            				}
HXDLIN( 138)				if (_hx_tmp6) {
HXLINE( 140)					this->get_stage()->getCameraPosition(targetSpace,::starling::display::Quad_obj::sPoint3D);
HXLINE( 141)					this->getTransformationMatrix3D(targetSpace,::starling::display::Quad_obj::sMatrix3D);
HXLINE( 142)					::starling::utils::RectangleUtil_obj::getBoundsProjected(this->_hx___bounds,::starling::display::Quad_obj::sMatrix3D,::starling::display::Quad_obj::sPoint3D,out);
            				}
            				else {
HXLINE( 146)					this->getTransformationMatrix(targetSpace,::starling::display::Quad_obj::sMatrix);
HXLINE( 147)					::starling::utils::RectangleUtil_obj::getBounds(this->_hx___bounds,::starling::display::Quad_obj::sMatrix,out);
            				}
            			}
            		}
HXLINE( 150)		return out;
            	}


 ::starling::display::DisplayObject Quad_obj::hitTest( ::openfl::geom::Point localPoint){
            	HX_STACKFRAME(&_hx_pos_1efa6e292af3e694_156_hitTest)
HXDLIN( 156)		bool _hx_tmp;
HXDLIN( 156)		bool _hx_tmp1;
HXDLIN( 156)		if (!(!(this->get_visible()))) {
HXDLIN( 156)			_hx_tmp1 = !(this->get_touchable());
            		}
            		else {
HXDLIN( 156)			_hx_tmp1 = true;
            		}
HXDLIN( 156)		if (!(_hx_tmp1)) {
HXDLIN( 156)			_hx_tmp = !(this->hitTestMask(localPoint));
            		}
            		else {
HXDLIN( 156)			_hx_tmp = true;
            		}
HXDLIN( 156)		if (_hx_tmp) {
HXDLIN( 156)			return null();
            		}
            		else {
HXLINE( 157)			if (this->_hx___bounds->containsPoint(localPoint)) {
HXLINE( 157)				return hx::ObjectPtr<OBJ_>(this);
            			}
            			else {
HXLINE( 158)				return null();
            			}
            		}
HXLINE( 156)		return null();
            	}


void Quad_obj::readjustSize(hx::Null< Float >  __o_width,hx::Null< Float >  __o_height){
Float width = __o_width.Default(-1);
Float height = __o_height.Default(-1);
            	HX_STACKFRAME(&_hx_pos_1efa6e292af3e694_166_readjustSize)
HXLINE( 167)		if ((width <= (int)0)) {
HXLINE( 167)			if (hx::IsNotNull( this->get_texture() )) {
HXLINE( 167)				width = this->get_texture()->get_frameWidth();
            			}
            			else {
HXLINE( 167)				width = this->_hx___bounds->width;
            			}
            		}
HXLINE( 168)		if ((height <= (int)0)) {
HXLINE( 168)			if (hx::IsNotNull( this->get_texture() )) {
HXLINE( 168)				height = this->get_texture()->get_frameHeight();
            			}
            			else {
HXLINE( 168)				height = this->_hx___bounds->height;
            			}
            		}
HXLINE( 170)		bool _hx_tmp;
HXDLIN( 170)		if ((width == this->_hx___bounds->width)) {
HXLINE( 170)			_hx_tmp = (height != this->_hx___bounds->height);
            		}
            		else {
HXLINE( 170)			_hx_tmp = true;
            		}
HXDLIN( 170)		if (_hx_tmp) {
HXLINE( 172)			this->_hx___bounds->setTo((int)0,(int)0,width,height);
HXLINE( 173)			this->_hx___setupVertices();
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC2(Quad_obj,readjustSize,(void))

 ::starling::textures::Texture Quad_obj::set_texture( ::starling::textures::Texture value){
            	HX_STACKFRAME(&_hx_pos_1efa6e292af3e694_202_set_texture)
HXLINE( 203)		if (hx::IsNotEq( value,this->get_texture() )) {
HXLINE( 205)			this->super::set_texture(value);
HXLINE( 206)			this->_hx___setupVertices();
            		}
HXLINE( 208)		return value;
            	}


 ::openfl::geom::Vector3D Quad_obj::sPoint3D;

 ::openfl::geom::Matrix Quad_obj::sMatrix;

 ::openfl::geom::Matrix3D Quad_obj::sMatrix3D;

 ::starling::display::Quad Quad_obj::fromTexture( ::starling::textures::Texture texture){
            	HX_GC_STACKFRAME(&_hx_pos_1efa6e292af3e694_180_fromTexture)
HXLINE( 181)		 ::starling::display::Quad quad =  ::starling::display::Quad_obj::__alloc( HX_CTX ,(int)100,(int)100,null());
HXLINE( 182)		quad->set_texture(texture);
HXLINE( 183)		quad->readjustSize(null(),null());
HXLINE( 184)		return quad;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Quad_obj,fromTexture,return )


hx::ObjectPtr< Quad_obj > Quad_obj::__new(Float width,Float height,hx::Null< int >  __o_color) {
	hx::ObjectPtr< Quad_obj > __this = new Quad_obj();
	__this->__construct(width,height,__o_color);
	return __this;
}

hx::ObjectPtr< Quad_obj > Quad_obj::__alloc(hx::Ctx *_hx_ctx,Float width,Float height,hx::Null< int >  __o_color) {
	Quad_obj *__this = (Quad_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Quad_obj), true, "starling.display.Quad"));
	*(void **)__this = Quad_obj::_hx_vtable;
	__this->__construct(width,height,__o_color);
	return __this;
}

Quad_obj::Quad_obj()
{
}

void Quad_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Quad);
	HX_MARK_MEMBER_NAME(_hx___bounds,"__bounds");
	 ::starling::display::Mesh_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Quad_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(_hx___bounds,"__bounds");
	 ::starling::display::Mesh_obj::__Visit(HX_VISIT_ARG);
}

hx::Val Quad_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"hitTest") ) { return hx::Val( hitTest_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"__bounds") ) { return hx::Val( _hx___bounds ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"getBounds") ) { return hx::Val( getBounds_dyn() ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"set_texture") ) { return hx::Val( set_texture_dyn() ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"readjustSize") ) { return hx::Val( readjustSize_dyn() ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"__setupVertices") ) { return hx::Val( _hx___setupVertices_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

bool Quad_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"sMatrix") ) { outValue = ( sMatrix ); return true; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"sPoint3D") ) { outValue = ( sPoint3D ); return true; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"sMatrix3D") ) { outValue = ( sMatrix3D ); return true; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"fromTexture") ) { outValue = fromTexture_dyn(); return true; }
	}
	return false;
}

hx::Val Quad_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 8:
		if (HX_FIELD_EQ(inName,"__bounds") ) { _hx___bounds=inValue.Cast<  ::openfl::geom::Rectangle >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

bool Quad_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"sMatrix") ) { sMatrix=ioValue.Cast<  ::openfl::geom::Matrix >(); return true; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"sPoint3D") ) { sPoint3D=ioValue.Cast<  ::openfl::geom::Vector3D >(); return true; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"sMatrix3D") ) { sMatrix3D=ioValue.Cast<  ::openfl::geom::Matrix3D >(); return true; }
	}
	return false;
}

void Quad_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("__bounds","\x95","\xf1","\x4c","\x0e"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo Quad_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*::openfl::geom::Rectangle*/ ,(int)offsetof(Quad_obj,_hx___bounds),HX_HCSTRING("__bounds","\x95","\xf1","\x4c","\x0e")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo Quad_obj_sStaticStorageInfo[] = {
	{hx::fsObject /*::openfl::geom::Vector3D*/ ,(void *) &Quad_obj::sPoint3D,HX_HCSTRING("sPoint3D","\xce","\x00","\x1c","\xd0")},
	{hx::fsObject /*::openfl::geom::Matrix*/ ,(void *) &Quad_obj::sMatrix,HX_HCSTRING("sMatrix","\x14","\x03","\x81","\x9e")},
	{hx::fsObject /*::openfl::geom::Matrix3D*/ ,(void *) &Quad_obj::sMatrix3D,HX_HCSTRING("sMatrix3D","\xc5","\x1c","\x17","\x03")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String Quad_obj_sMemberFields[] = {
	HX_HCSTRING("__bounds","\x95","\xf1","\x4c","\x0e"),
	HX_HCSTRING("__setupVertices","\x76","\xa8","\xe7","\xa1"),
	HX_HCSTRING("getBounds","\xab","\x0f","\x74","\xe2"),
	HX_HCSTRING("hitTest","\x45","\x60","\x7f","\xe2"),
	HX_HCSTRING("readjustSize","\x63","\xae","\x68","\x0e"),
	HX_HCSTRING("set_texture","\xfe","\x2f","\x48","\x2f"),
	::String(null()) };

static void Quad_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Quad_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(Quad_obj::sPoint3D,"sPoint3D");
	HX_MARK_MEMBER_NAME(Quad_obj::sMatrix,"sMatrix");
	HX_MARK_MEMBER_NAME(Quad_obj::sMatrix3D,"sMatrix3D");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Quad_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Quad_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Quad_obj::sPoint3D,"sPoint3D");
	HX_VISIT_MEMBER_NAME(Quad_obj::sMatrix,"sMatrix");
	HX_VISIT_MEMBER_NAME(Quad_obj::sMatrix3D,"sMatrix3D");
};

#endif

hx::Class Quad_obj::__mClass;

static ::String Quad_obj_sStaticFields[] = {
	HX_HCSTRING("sPoint3D","\xce","\x00","\x1c","\xd0"),
	HX_HCSTRING("sMatrix","\x14","\x03","\x81","\x9e"),
	HX_HCSTRING("sMatrix3D","\xc5","\x1c","\x17","\x03"),
	HX_HCSTRING("fromTexture","\x91","\x2c","\x21","\x37"),
	::String(null())
};

void Quad_obj::__register()
{
	hx::Object *dummy = new Quad_obj;
	Quad_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("starling.display.Quad","\xf9","\x5d","\x9b","\xcd");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &Quad_obj::__GetStatic;
	__mClass->mSetStaticField = &Quad_obj::__SetStatic;
	__mClass->mMarkFunc = Quad_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(Quad_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(Quad_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< Quad_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Quad_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Quad_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Quad_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void Quad_obj::__boot()
{
{
            	HX_GC_STACKFRAME(&_hx_pos_1efa6e292af3e694_58_boot)
HXDLIN(  58)		sPoint3D =  ::openfl::geom::Vector3D_obj::__alloc( HX_CTX ,null(),null(),null(),null());
            	}
{
            	HX_GC_STACKFRAME(&_hx_pos_1efa6e292af3e694_59_boot)
HXDLIN(  59)		sMatrix =  ::openfl::geom::Matrix_obj::__alloc( HX_CTX ,null(),null(),null(),null(),null(),null());
            	}
{
            	HX_GC_STACKFRAME(&_hx_pos_1efa6e292af3e694_60_boot)
HXDLIN(  60)		sMatrix3D =  ::openfl::geom::Matrix3D_obj::__alloc( HX_CTX ,null());
            	}
}

} // end namespace starling
} // end namespace display