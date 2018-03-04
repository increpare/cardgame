// Generated by Haxe 3.4.7
#ifndef INCLUDED_starling_events_TouchEvent
#define INCLUDED_starling_events_TouchEvent

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_starling_events_Event
#include <starling/events/Event.h>
#endif
HX_DECLARE_CLASS2(openfl,_Vector,AbstractVector)
HX_DECLARE_CLASS2(starling,display,DisplayObject)
HX_DECLARE_CLASS2(starling,events,Event)
HX_DECLARE_CLASS2(starling,events,EventDispatcher)
HX_DECLARE_CLASS2(starling,events,Touch)
HX_DECLARE_CLASS2(starling,events,TouchEvent)

namespace starling{
namespace events{


class HXCPP_CLASS_ATTRIBUTES TouchEvent_obj : public  ::starling::events::Event_obj
{
	public:
		typedef  ::starling::events::Event_obj super;
		typedef TouchEvent_obj OBJ_;
		TouchEvent_obj();

	public:
		enum { _hx_ClassId = 0x443726dc };

		void __construct(::String type, ::openfl::_Vector::AbstractVector touches,hx::Null< bool >  __o_shiftKey,hx::Null< bool >  __o_ctrlKey,hx::Null< bool >  __o_bubbles);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="starling.events.TouchEvent")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"starling.events.TouchEvent"); }
		static hx::ObjectPtr< TouchEvent_obj > __new(::String type, ::openfl::_Vector::AbstractVector touches,hx::Null< bool >  __o_shiftKey,hx::Null< bool >  __o_ctrlKey,hx::Null< bool >  __o_bubbles);
		static hx::ObjectPtr< TouchEvent_obj > __alloc(hx::Ctx *_hx_ctx,::String type, ::openfl::_Vector::AbstractVector touches,hx::Null< bool >  __o_shiftKey,hx::Null< bool >  __o_ctrlKey,hx::Null< bool >  __o_bubbles);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~TouchEvent_obj();

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
		::String __ToString() const { return HX_HCSTRING("TouchEvent","\xfb","\xaf","\x06","\x66"); }

		static void __boot();
		static ::String TOUCH;
		static  ::openfl::_Vector::AbstractVector sTouches;
		bool _hx___shiftKey;
		bool _hx___ctrlKey;
		Float _hx___timestamp;
		 ::openfl::_Vector::AbstractVector _hx___visitedObjects;
		 ::starling::events::TouchEvent resetTo(::String type, ::openfl::_Vector::AbstractVector touches,hx::Null< bool >  shiftKey,hx::Null< bool >  ctrlKey,hx::Null< bool >  bubbles);
		::Dynamic resetTo_dyn();

		void updateTimestamp( ::openfl::_Vector::AbstractVector touches);
		::Dynamic updateTimestamp_dyn();

		 ::openfl::_Vector::AbstractVector getTouches( ::starling::display::DisplayObject target,::String phase, ::openfl::_Vector::AbstractVector out);
		::Dynamic getTouches_dyn();

		 ::starling::events::Touch getTouch( ::starling::display::DisplayObject target,::String phase,hx::Null< int >  id);
		::Dynamic getTouch_dyn();

		bool interactsWith( ::starling::display::DisplayObject target);
		::Dynamic interactsWith_dyn();

		void dispatch( ::openfl::_Vector::AbstractVector chain);
		::Dynamic dispatch_dyn();

		Float get_timestamp();
		::Dynamic get_timestamp_dyn();

		 ::openfl::_Vector::AbstractVector get_touches();
		::Dynamic get_touches_dyn();

		bool get_shiftKey();
		::Dynamic get_shiftKey_dyn();

		bool get_ctrlKey();
		::Dynamic get_ctrlKey_dyn();

};

} // end namespace starling
} // end namespace events

#endif /* INCLUDED_starling_events_TouchEvent */ 