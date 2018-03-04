// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_lime_ui_Touch
#include <lime/ui/Touch.h>
#endif
#ifndef INCLUDED_lime_utils_ObjectPool_openfl__internal_TouchData
#include <lime/utils/ObjectPool_openfl__internal_TouchData.h>
#endif
#ifndef INCLUDED_openfl__internal_TouchData
#include <openfl/_internal/TouchData.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_InteractiveObject
#include <openfl/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_aa6661caf6f12359_23_new,"openfl._internal.TouchData","new",0xcd4ddaab,"openfl._internal.TouchData.new","openfl/_internal/TouchData.hx",23,0x1860a967)
HX_LOCAL_STACK_FRAME(_hx_pos_aa6661caf6f12359_28_reset,"openfl._internal.TouchData","reset",0x6e11bcda,"openfl._internal.TouchData.reset","openfl/_internal/TouchData.hx",28,0x1860a967)
HX_LOCAL_STACK_FRAME(_hx_pos_aa6661caf6f12359_13_boot,"openfl._internal.TouchData","boot",0xceea7b87,"openfl._internal.TouchData.boot","openfl/_internal/TouchData.hx",13,0x1860a967)
namespace openfl{
namespace _internal{

void TouchData_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_aa6661caf6f12359_23_new)
HXDLIN(  23)		this->rollOutStack = ::Array_obj< ::Dynamic>::__new(0);
            	}

Dynamic TouchData_obj::__CreateEmpty() { return new TouchData_obj; }

void *TouchData_obj::_hx_vtable = 0;

Dynamic TouchData_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< TouchData_obj > _hx_result = new TouchData_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool TouchData_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x35f61a41;
}

void TouchData_obj::reset(){
            	HX_STACKFRAME(&_hx_pos_aa6661caf6f12359_28_reset)
HXLINE(  30)		this->touch = null();
HXLINE(  31)		this->touchDownTarget = null();
HXLINE(  32)		this->touchOverTarget = null();
HXLINE(  34)		this->rollOutStack->removeRange((int)0,this->rollOutStack->length);
            	}


HX_DEFINE_DYNAMIC_FUNC0(TouchData_obj,reset,(void))

 ::lime::utils::ObjectPool_openfl__internal_TouchData TouchData_obj::_hx___pool;


hx::ObjectPtr< TouchData_obj > TouchData_obj::__new() {
	hx::ObjectPtr< TouchData_obj > __this = new TouchData_obj();
	__this->__construct();
	return __this;
}

hx::ObjectPtr< TouchData_obj > TouchData_obj::__alloc(hx::Ctx *_hx_ctx) {
	TouchData_obj *__this = (TouchData_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(TouchData_obj), true, "openfl._internal.TouchData"));
	*(void **)__this = TouchData_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

TouchData_obj::TouchData_obj()
{
}

void TouchData_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(TouchData);
	HX_MARK_MEMBER_NAME(rollOutStack,"rollOutStack");
	HX_MARK_MEMBER_NAME(touch,"touch");
	HX_MARK_MEMBER_NAME(touchDownTarget,"touchDownTarget");
	HX_MARK_MEMBER_NAME(touchOverTarget,"touchOverTarget");
	HX_MARK_END_CLASS();
}

void TouchData_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(rollOutStack,"rollOutStack");
	HX_VISIT_MEMBER_NAME(touch,"touch");
	HX_VISIT_MEMBER_NAME(touchDownTarget,"touchDownTarget");
	HX_VISIT_MEMBER_NAME(touchOverTarget,"touchOverTarget");
}

hx::Val TouchData_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"touch") ) { return hx::Val( touch ); }
		if (HX_FIELD_EQ(inName,"reset") ) { return hx::Val( reset_dyn() ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"rollOutStack") ) { return hx::Val( rollOutStack ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"touchDownTarget") ) { return hx::Val( touchDownTarget ); }
		if (HX_FIELD_EQ(inName,"touchOverTarget") ) { return hx::Val( touchOverTarget ); }
	}
	return super::__Field(inName,inCallProp);
}

bool TouchData_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"__pool") ) { outValue = ( _hx___pool ); return true; }
	}
	return false;
}

hx::Val TouchData_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"touch") ) { touch=inValue.Cast<  ::lime::ui::Touch >(); return inValue; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"rollOutStack") ) { rollOutStack=inValue.Cast< ::Array< ::Dynamic> >(); return inValue; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"touchDownTarget") ) { touchDownTarget=inValue.Cast<  ::openfl::display::InteractiveObject >(); return inValue; }
		if (HX_FIELD_EQ(inName,"touchOverTarget") ) { touchOverTarget=inValue.Cast<  ::openfl::display::InteractiveObject >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

bool TouchData_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"__pool") ) { _hx___pool=ioValue.Cast<  ::lime::utils::ObjectPool_openfl__internal_TouchData >(); return true; }
	}
	return false;
}

void TouchData_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("rollOutStack","\x77","\x60","\x71","\x65"));
	outFields->push(HX_HCSTRING("touch","\xbf","\x17","\x33","\x14"));
	outFields->push(HX_HCSTRING("touchDownTarget","\xf2","\xb5","\x29","\x4e"));
	outFields->push(HX_HCSTRING("touchOverTarget","\x64","\x90","\xc0","\xf6"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo TouchData_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*Array< ::Dynamic >*/ ,(int)offsetof(TouchData_obj,rollOutStack),HX_HCSTRING("rollOutStack","\x77","\x60","\x71","\x65")},
	{hx::fsObject /*::lime::ui::Touch*/ ,(int)offsetof(TouchData_obj,touch),HX_HCSTRING("touch","\xbf","\x17","\x33","\x14")},
	{hx::fsObject /*::openfl::display::InteractiveObject*/ ,(int)offsetof(TouchData_obj,touchDownTarget),HX_HCSTRING("touchDownTarget","\xf2","\xb5","\x29","\x4e")},
	{hx::fsObject /*::openfl::display::InteractiveObject*/ ,(int)offsetof(TouchData_obj,touchOverTarget),HX_HCSTRING("touchOverTarget","\x64","\x90","\xc0","\xf6")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo TouchData_obj_sStaticStorageInfo[] = {
	{hx::fsObject /*::lime::utils::ObjectPool_openfl__internal_TouchData*/ ,(void *) &TouchData_obj::_hx___pool,HX_HCSTRING("__pool","\xfc","\xe3","\x54","\xf9")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String TouchData_obj_sMemberFields[] = {
	HX_HCSTRING("rollOutStack","\x77","\x60","\x71","\x65"),
	HX_HCSTRING("touch","\xbf","\x17","\x33","\x14"),
	HX_HCSTRING("touchDownTarget","\xf2","\xb5","\x29","\x4e"),
	HX_HCSTRING("touchOverTarget","\x64","\x90","\xc0","\xf6"),
	HX_HCSTRING("reset","\xcf","\x49","\xc8","\xe6"),
	::String(null()) };

static void TouchData_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(TouchData_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(TouchData_obj::_hx___pool,"__pool");
};

#ifdef HXCPP_VISIT_ALLOCS
static void TouchData_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(TouchData_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(TouchData_obj::_hx___pool,"__pool");
};

#endif

hx::Class TouchData_obj::__mClass;

static ::String TouchData_obj_sStaticFields[] = {
	HX_HCSTRING("__pool","\xfc","\xe3","\x54","\xf9"),
	::String(null())
};

void TouchData_obj::__register()
{
	hx::Object *dummy = new TouchData_obj;
	TouchData_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("openfl._internal.TouchData","\x39","\xa9","\xb2","\x63");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &TouchData_obj::__GetStatic;
	__mClass->mSetStaticField = &TouchData_obj::__SetStatic;
	__mClass->mMarkFunc = TouchData_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(TouchData_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(TouchData_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< TouchData_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = TouchData_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = TouchData_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = TouchData_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void TouchData_obj::__boot()
{
{
            		HX_BEGIN_LOCAL_FUNC_S0(hx::LocalFunc,_hx_Closure_0) HXARGC(0)
            		 ::openfl::_internal::TouchData _hx_run(){
            			HX_GC_STACKFRAME(&_hx_pos_aa6661caf6f12359_13_boot)
HXDLIN(  13)			return  ::openfl::_internal::TouchData_obj::__alloc( HX_CTX );
            		}
            		HX_END_LOCAL_FUNC0(return)

            		HX_BEGIN_LOCAL_FUNC_S0(hx::LocalFunc,_hx_Closure_1) HXARGC(1)
            		void _hx_run( ::openfl::_internal::TouchData data){
            			HX_STACKFRAME(&_hx_pos_aa6661caf6f12359_13_boot)
HXDLIN(  13)			data->reset();
            		}
            		HX_END_LOCAL_FUNC1((void))

            	HX_GC_STACKFRAME(&_hx_pos_aa6661caf6f12359_13_boot)
HXDLIN(  13)		_hx___pool =  ::lime::utils::ObjectPool_openfl__internal_TouchData_obj::__alloc( HX_CTX , ::Dynamic(new _hx_Closure_0()), ::Dynamic(new _hx_Closure_1()),null());
            	}
}

} // end namespace openfl
} // end namespace _internal