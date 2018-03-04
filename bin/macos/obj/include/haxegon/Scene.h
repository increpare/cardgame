// Generated by Haxe 3.4.7
#ifndef INCLUDED_haxegon_Scene
#define INCLUDED_haxegon_Scene

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(haxegon,Scene)

namespace haxegon{


class HXCPP_CLASS_ATTRIBUTES Scene_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef Scene_obj OBJ_;
		Scene_obj();

	public:
		enum { _hx_ClassId = 0x3eb4098c };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="haxegon.Scene")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,false,"haxegon.Scene"); }

		hx::ObjectPtr< Scene_obj > __new() {
			hx::ObjectPtr< Scene_obj > __this = new Scene_obj();
			__this->__construct();
			return __this;
		}

		static hx::ObjectPtr< Scene_obj > __alloc(hx::Ctx *_hx_ctx) {
			Scene_obj *__this = (Scene_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Scene_obj), false, "haxegon.Scene"));
			*(void **)__this = Scene_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Scene_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("Scene","\x2c","\x49","\xff","\x0b"); }

		static void init();
		static ::Dynamic init_dyn();

		static void restart(hx::Class scenetorestart);
		static ::Dynamic restart_dyn();

		static void checkforrenderfunction();
		static ::Dynamic checkforrenderfunction_dyn();

		static void update();
		static ::Dynamic update_dyn();

		static void render();
		static ::Dynamic render_dyn();

		static void callscenemethod( ::Dynamic scene,::String method);
		static ::Dynamic callscenemethod_dyn();

		static int findscene(hx::Class findscene);
		static ::Dynamic findscene_dyn();

		static  ::Dynamic change(hx::Class newscene);
		static ::Dynamic change_dyn();

		static  ::Dynamic get(hx::Class requiredscene);
		static ::Dynamic get_dyn();

		static  ::Dynamic getcurrentsceneclass();
		static ::Dynamic getcurrentsceneclass_dyn();

		static ::cpp::VirtualArray scenelist;
		static int currentscene;
		static bool hasseperaterenderfunction;
};

} // end namespace haxegon

#endif /* INCLUDED_haxegon_Scene */ 