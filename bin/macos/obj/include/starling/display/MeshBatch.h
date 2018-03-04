// Generated by Haxe 3.4.7
#ifndef INCLUDED_starling_display_MeshBatch
#define INCLUDED_starling_display_MeshBatch

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_starling_display_Mesh
#include <starling/display/Mesh.h>
#endif
HX_DECLARE_CLASS2(openfl,geom,Matrix)
HX_DECLARE_CLASS2(starling,display,DisplayObject)
HX_DECLARE_CLASS2(starling,display,Mesh)
HX_DECLARE_CLASS2(starling,display,MeshBatch)
HX_DECLARE_CLASS2(starling,events,EventDispatcher)
HX_DECLARE_CLASS2(starling,rendering,Effect)
HX_DECLARE_CLASS2(starling,rendering,FilterEffect)
HX_DECLARE_CLASS2(starling,rendering,MeshEffect)
HX_DECLARE_CLASS2(starling,rendering,Painter)
HX_DECLARE_CLASS2(starling,styles,MeshStyle)
HX_DECLARE_CLASS2(starling,utils,MeshSubset)

namespace starling{
namespace display{


class HXCPP_CLASS_ATTRIBUTES MeshBatch_obj : public  ::starling::display::Mesh_obj
{
	public:
		typedef  ::starling::display::Mesh_obj super;
		typedef MeshBatch_obj OBJ_;
		MeshBatch_obj();

	public:
		enum { _hx_ClassId = 0x7db9e433 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="starling.display.MeshBatch")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"starling.display.MeshBatch"); }
		static hx::ObjectPtr< MeshBatch_obj > __new();
		static hx::ObjectPtr< MeshBatch_obj > __alloc(hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~MeshBatch_obj();

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
		::String __ToString() const { return HX_HCSTRING("MeshBatch","\x6d","\xd2","\xad","\x87"); }

		static void __boot();
		static int MAX_NUM_VERTICES;
		static  ::starling::utils::MeshSubset sFullMeshSubset;
		 ::starling::rendering::MeshEffect _hx___effect;
		bool _hx___batchable;
		bool _hx___vertexSyncRequired;
		bool _hx___indexSyncRequired;
		void dispose();

		void setVertexDataChanged();

		void setIndexDataChanged();

		void _hx___setVertexAndIndexDataChanged();
		::Dynamic _hx___setVertexAndIndexDataChanged_dyn();

		void _hx___syncVertexBuffer();
		::Dynamic _hx___syncVertexBuffer_dyn();

		void _hx___syncIndexBuffer();
		::Dynamic _hx___syncIndexBuffer_dyn();

		void clear();
		::Dynamic clear_dyn();

		void addMesh( ::starling::display::Mesh mesh, ::openfl::geom::Matrix matrix,hx::Null< Float >  alpha, ::starling::utils::MeshSubset subset,hx::Null< bool >  ignoreTransformations);
		::Dynamic addMesh_dyn();

		void addMeshAt( ::starling::display::Mesh mesh,int indexID,int vertexID);
		::Dynamic addMeshAt_dyn();

		void _hx___setupFor( ::starling::display::Mesh mesh);
		::Dynamic _hx___setupFor_dyn();

		bool canAddMesh( ::starling::display::Mesh mesh,hx::Null< int >  numVertices);
		::Dynamic canAddMesh_dyn();

		void render( ::starling::rendering::Painter painter);

		void setStyle( ::starling::styles::MeshStyle meshStyle,hx::Null< bool >  mergeWithPredecessor);

		int set_numVertices(int value);
		::Dynamic set_numVertices_dyn();

		int set_numIndices(int value);
		::Dynamic set_numIndices_dyn();

		bool get_batchable();
		::Dynamic get_batchable_dyn();

		bool set_batchable(bool value);
		::Dynamic set_batchable_dyn();

};

} // end namespace starling
} // end namespace display

#endif /* INCLUDED_starling_display_MeshBatch */ 