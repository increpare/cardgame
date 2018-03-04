// Generated by Haxe 3.4.7
#ifndef INCLUDED_starling_events_Event
#define INCLUDED_starling_events_Event

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(openfl,_Vector,AbstractVector)
HX_DECLARE_CLASS2(starling,events,Event)
HX_DECLARE_CLASS2(starling,events,EventDispatcher)

namespace starling{
namespace events{


class HXCPP_CLASS_ATTRIBUTES Event_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef Event_obj OBJ_;
		Event_obj();

	public:
		enum { _hx_ClassId = 0x1e772cb9 };

		void __construct(::String type,hx::Null< bool >  __o_bubbles, ::Dynamic data);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="starling.events.Event")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"starling.events.Event"); }
		static hx::ObjectPtr< Event_obj > __new(::String type,hx::Null< bool >  __o_bubbles, ::Dynamic data);
		static hx::ObjectPtr< Event_obj > __alloc(hx::Ctx *_hx_ctx,::String type,hx::Null< bool >  __o_bubbles, ::Dynamic data);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Event_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("Event","\xfa","\x37","\xf2","\x08"); }

		static void __boot();
		static ::String ADDED;
		static ::String ADDED_TO_STAGE;
		static ::String ENTER_FRAME;
		static ::String REMOVED;
		static ::String REMOVED_FROM_STAGE;
		static ::String TRIGGERED;
		static ::String RESIZE;
		static ::String COMPLETE;
		static ::String CONTEXT3D_CREATE;
		static ::String RENDER;
		static ::String ROOT_CREATED;
		static ::String REMOVE_FROM_JUGGLER;
		static ::String TEXTURES_RESTORED;
		static ::String IO_ERROR;
		static ::String SECURITY_ERROR;
		static ::String PARSE_ERROR;
		static ::String FATAL_ERROR;
		static ::String CHANGE;
		static ::String CANCEL;
		static ::String SCROLL;
		static ::String OPEN;
		static ::String CLOSE;
		static ::String SELECT;
		static ::String READY;
		static ::String UPDATE;
		static  ::openfl::_Vector::AbstractVector sEventPool;
		static  ::starling::events::Event fromPool(::String type,hx::Null< bool >  bubbles, ::Dynamic data);
		static ::Dynamic fromPool_dyn();

		static void toPool( ::starling::events::Event event);
		static ::Dynamic toPool_dyn();

		void stopPropagation();
		::Dynamic stopPropagation_dyn();

		void stopImmediatePropagation();
		::Dynamic stopImmediatePropagation_dyn();

		virtual ::String toString();
		::Dynamic toString_dyn();

		bool bubbles;
		 ::starling::events::EventDispatcher target;
		 ::starling::events::EventDispatcher currentTarget;
		::String type;
		 ::Dynamic data;
		void setTarget( ::starling::events::EventDispatcher value);
		::Dynamic setTarget_dyn();

		void setCurrentTarget( ::starling::events::EventDispatcher value);
		::Dynamic setCurrentTarget_dyn();

		void setData( ::Dynamic value);
		::Dynamic setData_dyn();

		bool stopsPropagation;
		bool stopsImmediatePropagation;
		 ::starling::events::Event reset(::String type,hx::Null< bool >  bubbles, ::Dynamic data);
		::Dynamic reset_dyn();

};

} // end namespace starling
} // end namespace events

#endif /* INCLUDED_starling_events_Event */ 