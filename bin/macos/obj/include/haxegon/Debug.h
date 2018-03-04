// Generated by Haxe 3.4.7
#ifndef INCLUDED_haxegon_Debug
#define INCLUDED_haxegon_Debug

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(haxegon,Debug)

namespace haxegon{


class HXCPP_CLASS_ATTRIBUTES Debug_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef Debug_obj OBJ_;
		Debug_obj();

	public:
		enum { _hx_ClassId = 0x0196515b };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="haxegon.Debug")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,false,"haxegon.Debug"); }

		hx::ObjectPtr< Debug_obj > __new() {
			hx::ObjectPtr< Debug_obj > __this = new Debug_obj();
			__this->__construct();
			return __this;
		}

		static hx::ObjectPtr< Debug_obj > __alloc(hx::Ctx *_hx_ctx) {
			Debug_obj *__this = (Debug_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Debug_obj), false, "haxegon.Debug"));
			*(void **)__this = Debug_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Debug_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("Debug","\x33","\xc2","\x4c","\x6a"); }

		static void __boot();
		static void clear();
		static ::Dynamic clear_dyn();

		static void log( ::Dynamic t, ::Dynamic pos);
		static ::Dynamic log_dyn();

		static bool positionmatch( ::Dynamic p1, ::Dynamic p2);
		static ::Dynamic positionmatch_dyn();

		static bool update();
		static ::Dynamic update_dyn();

		static void drawwindow();
		static ::Dynamic drawwindow_dyn();

		static void render();
		static ::Dynamic render_dyn();

		static bool showlogwindow;
		static ::Array< ::String > history;
		static ::Array< ::Dynamic> posinfo;
		static ::Array< int > repeatcount;
		static  ::Dynamic gui;
		static void init();
		static ::Dynamic init_dyn();

		static void drawicon(int x,int y,int c,::String type);
		static ::Dynamic drawicon_dyn();

		static int drawscrollbar(int x,int y,int width,int height,int scrollpos,int scrollmax,bool applywheel,hx::Null< int >  scrolladjustment);
		static ::Dynamic drawscrollbar_dyn();

};

} // end namespace haxegon

#endif /* INCLUDED_haxegon_Debug */ 