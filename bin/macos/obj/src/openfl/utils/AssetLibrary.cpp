// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_lime_app_Future
#include <lime/app/Future.h>
#endif
#ifndef INCLUDED_lime_graphics_Image
#include <lime/graphics/Image.h>
#endif
#ifndef INCLUDED_lime_media_AudioBuffer
#include <lime/media/AudioBuffer.h>
#endif
#ifndef INCLUDED_lime_text_Font
#include <lime/text/Font.h>
#endif
#ifndef INCLUDED_lime_utils_AssetLibrary
#include <lime/utils/AssetLibrary.h>
#endif
#ifndef INCLUDED_lime_utils_AssetManifest
#include <lime/utils/AssetManifest.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectContainer
#include <openfl/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_InteractiveObject
#include <openfl/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl_display_MovieClip
#include <openfl/display/MovieClip.h>
#endif
#ifndef INCLUDED_openfl_display_Sprite
#include <openfl/display/Sprite.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_utils_AssetLibrary
#include <openfl/utils/AssetLibrary.h>
#endif
#ifndef INCLUDED_openfl_utils_ByteArrayData
#include <openfl/utils/ByteArrayData.h>
#endif
#ifndef INCLUDED_openfl_utils_IDataInput
#include <openfl/utils/IDataInput.h>
#endif
#ifndef INCLUDED_openfl_utils_IDataOutput
#include <openfl/utils/IDataOutput.h>
#endif
#ifndef INCLUDED_openfl_utils__ByteArray_ByteArray_Impl_
#include <openfl/utils/_ByteArray/ByteArray_Impl_.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_22_new,"openfl.utils.AssetLibrary","new",0x69b47d78,"openfl.utils.AssetLibrary.new","openfl/utils/AssetLibrary.hx",22,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_29_exists,"openfl.utils.AssetLibrary","exists",0xdc46afc4,"openfl.utils.AssetLibrary.exists","openfl/utils/AssetLibrary.hx",29,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_85_getAsset,"openfl.utils.AssetLibrary","getAsset",0x76ad5562,"openfl.utils.AssetLibrary.getAsset","openfl/utils/AssetLibrary.hx",85,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_100_getAudioBuffer,"openfl.utils.AssetLibrary","getAudioBuffer",0x0089fb68,"openfl.utils.AssetLibrary.getAudioBuffer","openfl/utils/AssetLibrary.hx",100,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_115_getBytes,"openfl.utils.AssetLibrary","getBytes",0x0e0bf3dd,"openfl.utils.AssetLibrary.getBytes","openfl/utils/AssetLibrary.hx",115,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_130_getFont,"openfl.utils.AssetLibrary","getFont",0xd39c269d,"openfl.utils.AssetLibrary.getFont","openfl/utils/AssetLibrary.hx",130,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_145_getImage,"openfl.utils.AssetLibrary","getImage",0x0ddd0acd,"openfl.utils.AssetLibrary.getImage","openfl/utils/AssetLibrary.hx",145,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_160_getMovieClip,"openfl.utils.AssetLibrary","getMovieClip",0xec0e8f12,"openfl.utils.AssetLibrary.getMovieClip","openfl/utils/AssetLibrary.hx",160,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_167_getPath,"openfl.utils.AssetLibrary","getPath",0xda2dae73,"openfl.utils.AssetLibrary.getPath","openfl/utils/AssetLibrary.hx",167,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_182_getText,"openfl.utils.AssetLibrary","getText",0xdcd5957b,"openfl.utils.AssetLibrary.getText","openfl/utils/AssetLibrary.hx",182,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_197_isLocal,"openfl.utils.AssetLibrary","isLocal",0xd2cf8639,"openfl.utils.AssetLibrary.isLocal","openfl/utils/AssetLibrary.hx",197,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_212_list,"openfl.utils.AssetLibrary","list",0x12e9e446,"openfl.utils.AssetLibrary.list","openfl/utils/AssetLibrary.hx",212,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_227_loadAsset,"openfl.utils.AssetLibrary","loadAsset",0xda144502,"openfl.utils.AssetLibrary.loadAsset","openfl/utils/AssetLibrary.hx",227,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_242_load,"openfl.utils.AssetLibrary","load",0x12ee620e,"openfl.utils.AssetLibrary.load","openfl/utils/AssetLibrary.hx",242,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_257_loadAudioBuffer,"openfl.utils.AssetLibrary","loadAudioBuffer",0x7bb86308,"openfl.utils.AssetLibrary.loadAudioBuffer","openfl/utils/AssetLibrary.hx",257,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_272_loadBytes,"openfl.utils.AssetLibrary","loadBytes",0x7172e37d,"openfl.utils.AssetLibrary.loadBytes","openfl/utils/AssetLibrary.hx",272,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_287_loadFont,"openfl.utils.AssetLibrary","loadFont",0xa4fd0afd,"openfl.utils.AssetLibrary.loadFont","openfl/utils/AssetLibrary.hx",287,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_345_loadImage,"openfl.utils.AssetLibrary","loadImage",0x7143fa6d,"openfl.utils.AssetLibrary.loadImage","openfl/utils/AssetLibrary.hx",345,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_360_loadMovieClip,"openfl.utils.AssetLibrary","loadMovieClip",0xdf35ceb2,"openfl.utils.AssetLibrary.loadMovieClip","openfl/utils/AssetLibrary.hx",360,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_358_loadMovieClip,"openfl.utils.AssetLibrary","loadMovieClip",0xdf35ceb2,"openfl.utils.AssetLibrary.loadMovieClip","openfl/utils/AssetLibrary.hx",358,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_367_loadText,"openfl.utils.AssetLibrary","loadText",0xae3679db,"openfl.utils.AssetLibrary.loadText","openfl/utils/AssetLibrary.hx",367,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_382_unload,"openfl.utils.AssetLibrary","unload",0x81f332e7,"openfl.utils.AssetLibrary.unload","openfl/utils/AssetLibrary.hx",382,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_44_fromBytes,"openfl.utils.AssetLibrary","fromBytes",0x0ac481b9,"openfl.utils.AssetLibrary.fromBytes","openfl/utils/AssetLibrary.hx",44,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_51_fromFile,"openfl.utils.AssetLibrary","fromFile",0x922478ee,"openfl.utils.AssetLibrary.fromFile","openfl/utils/AssetLibrary.hx",51,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_56_fromManifest,"openfl.utils.AssetLibrary","fromManifest",0x34ddc721,"openfl.utils.AssetLibrary.fromManifest","openfl/utils/AssetLibrary.hx",56,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_304_loadFromBytes,"openfl.utils.AssetLibrary","loadFromBytes",0x393bbeb3,"openfl.utils.AssetLibrary.loadFromBytes","openfl/utils/AssetLibrary.hx",304,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_302_loadFromBytes,"openfl.utils.AssetLibrary","loadFromBytes",0x393bbeb3,"openfl.utils.AssetLibrary.loadFromBytes","openfl/utils/AssetLibrary.hx",302,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_315_loadFromFile,"openfl.utils.AssetLibrary","loadFromFile",0x1f8d7934,"openfl.utils.AssetLibrary.loadFromFile","openfl/utils/AssetLibrary.hx",315,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_313_loadFromFile,"openfl.utils.AssetLibrary","loadFromFile",0x1f8d7934,"openfl.utils.AssetLibrary.loadFromFile","openfl/utils/AssetLibrary.hx",313,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_322_loadFromManifest,"openfl.utils.AssetLibrary","loadFromManifest",0x78d36267,"openfl.utils.AssetLibrary.loadFromManifest","openfl/utils/AssetLibrary.hx",322,0x41ec4c76)
HX_LOCAL_STACK_FRAME(_hx_pos_547ec2a4bdcd47c7_330_loadFromManifest,"openfl.utils.AssetLibrary","loadFromManifest",0x78d36267,"openfl.utils.AssetLibrary.loadFromManifest","openfl/utils/AssetLibrary.hx",330,0x41ec4c76)
namespace openfl{
namespace utils{

void AssetLibrary_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_22_new)
HXDLIN(  22)		super::__construct();
            	}

Dynamic AssetLibrary_obj::__CreateEmpty() { return new AssetLibrary_obj; }

void *AssetLibrary_obj::_hx_vtable = 0;

Dynamic AssetLibrary_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< AssetLibrary_obj > _hx_result = new AssetLibrary_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool AssetLibrary_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x34644188) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x34644188;
	} else {
		return inClassId==(int)0x425552e3;
	}
}

bool AssetLibrary_obj::exists(::String id,::String type){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_29_exists)
HXDLIN(  29)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE(  31)			return this->_hx___proxy->exists(id,type);
            		}
            		else {
HXLINE(  35)			return this->super::exists(id,type);
            		}
HXLINE(  29)		return false;
            	}


 ::Dynamic AssetLibrary_obj::getAsset(::String id,::String type){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_85_getAsset)
HXDLIN(  85)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE(  87)			return this->_hx___proxy->getAsset(id,type);
            		}
            		else {
HXLINE(  91)			return this->super::getAsset(id,type);
            		}
HXLINE(  85)		return null();
            	}


 ::lime::media::AudioBuffer AssetLibrary_obj::getAudioBuffer(::String id){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_100_getAudioBuffer)
HXDLIN( 100)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 102)			return this->_hx___proxy->getAudioBuffer(id);
            		}
            		else {
HXLINE( 106)			return this->super::getAudioBuffer(id);
            		}
HXLINE( 100)		return null();
            	}


 ::haxe::io::Bytes AssetLibrary_obj::getBytes(::String id){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_115_getBytes)
HXDLIN( 115)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 117)			return this->_hx___proxy->getBytes(id);
            		}
            		else {
HXLINE( 121)			return this->super::getBytes(id);
            		}
HXLINE( 115)		return null();
            	}


 ::lime::text::Font AssetLibrary_obj::getFont(::String id){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_130_getFont)
HXDLIN( 130)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 132)			return this->_hx___proxy->getFont(id);
            		}
            		else {
HXLINE( 136)			return this->super::getFont(id);
            		}
HXLINE( 130)		return null();
            	}


 ::lime::graphics::Image AssetLibrary_obj::getImage(::String id){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_145_getImage)
HXDLIN( 145)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 147)			return this->_hx___proxy->getImage(id);
            		}
            		else {
HXLINE( 151)			return this->super::getImage(id);
            		}
HXLINE( 145)		return null();
            	}


 ::openfl::display::MovieClip AssetLibrary_obj::getMovieClip(::String id){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_160_getMovieClip)
HXDLIN( 160)		return null();
            	}


HX_DEFINE_DYNAMIC_FUNC1(AssetLibrary_obj,getMovieClip,return )

::String AssetLibrary_obj::getPath(::String id){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_167_getPath)
HXDLIN( 167)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 169)			return this->_hx___proxy->getPath(id);
            		}
            		else {
HXLINE( 173)			return this->super::getPath(id);
            		}
HXLINE( 167)		return null();
            	}


::String AssetLibrary_obj::getText(::String id){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_182_getText)
HXDLIN( 182)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 184)			return this->_hx___proxy->getText(id);
            		}
            		else {
HXLINE( 188)			return this->super::getText(id);
            		}
HXLINE( 182)		return null();
            	}


bool AssetLibrary_obj::isLocal(::String id,::String type){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_197_isLocal)
HXDLIN( 197)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 199)			return this->_hx___proxy->isLocal(id,type);
            		}
            		else {
HXLINE( 203)			return this->super::isLocal(id,type);
            		}
HXLINE( 197)		return false;
            	}


::Array< ::String > AssetLibrary_obj::list(::String type){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_212_list)
HXDLIN( 212)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 214)			return this->_hx___proxy->list(type);
            		}
            		else {
HXLINE( 218)			return this->super::list(type);
            		}
HXLINE( 212)		return null();
            	}


 ::lime::app::Future AssetLibrary_obj::loadAsset(::String id,::String type){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_227_loadAsset)
HXDLIN( 227)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 229)			return this->_hx___proxy->loadAsset(id,type);
            		}
            		else {
HXLINE( 233)			return this->super::loadAsset(id,type);
            		}
HXLINE( 227)		return null();
            	}


 ::lime::app::Future AssetLibrary_obj::load(){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_242_load)
HXDLIN( 242)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 244)			return this->_hx___proxy->load();
            		}
            		else {
HXLINE( 248)			return this->super::load();
            		}
HXLINE( 242)		return null();
            	}


 ::lime::app::Future AssetLibrary_obj::loadAudioBuffer(::String id){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_257_loadAudioBuffer)
HXDLIN( 257)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 259)			return this->_hx___proxy->loadAudioBuffer(id);
            		}
            		else {
HXLINE( 263)			return this->super::loadAudioBuffer(id);
            		}
HXLINE( 257)		return null();
            	}


 ::lime::app::Future AssetLibrary_obj::loadBytes(::String id){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_272_loadBytes)
HXDLIN( 272)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 274)			return this->_hx___proxy->loadBytes(id);
            		}
            		else {
HXLINE( 278)			return this->super::loadBytes(id);
            		}
HXLINE( 272)		return null();
            	}


 ::lime::app::Future AssetLibrary_obj::loadFont(::String id){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_287_loadFont)
HXDLIN( 287)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 289)			return this->_hx___proxy->loadFont(id);
            		}
            		else {
HXLINE( 293)			return this->super::loadFont(id);
            		}
HXLINE( 287)		return null();
            	}


 ::lime::app::Future AssetLibrary_obj::loadImage(::String id){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_345_loadImage)
HXDLIN( 345)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 347)			return this->_hx___proxy->loadImage(id);
            		}
            		else {
HXLINE( 351)			return this->super::loadImage(id);
            		}
HXLINE( 345)		return null();
            	}


 ::lime::app::Future AssetLibrary_obj::loadMovieClip(::String id){
            		HX_BEGIN_LOCAL_FUNC_S2(hx::LocalFunc,_hx_Closure_0,::String,id, ::openfl::utils::AssetLibrary,_gthis) HXARGC(0)
            		 ::openfl::display::MovieClip _hx_run(){
            			HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_360_loadMovieClip)
HXLINE( 360)			return _gthis->getMovieClip(id);
            		}
            		HX_END_LOCAL_FUNC0(return)

            	HX_GC_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_358_loadMovieClip)
HXDLIN( 358)		 ::openfl::utils::AssetLibrary _gthis = hx::ObjectPtr<OBJ_>(this);
HXLINE( 360)		return  ::lime::app::Future_obj::__alloc( HX_CTX , ::Dynamic(new _hx_Closure_0(id,_gthis)),null());
            	}


HX_DEFINE_DYNAMIC_FUNC1(AssetLibrary_obj,loadMovieClip,return )

 ::lime::app::Future AssetLibrary_obj::loadText(::String id){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_367_loadText)
HXDLIN( 367)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 369)			return this->_hx___proxy->loadText(id);
            		}
            		else {
HXLINE( 373)			return this->super::loadText(id);
            		}
HXLINE( 367)		return null();
            	}


void AssetLibrary_obj::unload(){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_382_unload)
HXDLIN( 382)		if (hx::IsNotNull( this->_hx___proxy )) {
HXLINE( 384)			this->_hx___proxy->unload();
HXDLIN( 384)			return;
            		}
            		else {
HXLINE( 388)			this->super::unload();
HXDLIN( 388)			return;
            		}
            	}


 ::openfl::utils::AssetLibrary AssetLibrary_obj::fromBytes( ::openfl::utils::ByteArrayData bytes,::String rootPath){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_44_fromBytes)
HXDLIN(  44)		return ::openfl::utils::AssetLibrary_obj::fromManifest(::lime::utils::AssetManifest_obj::fromBytes(::openfl::utils::_ByteArray::ByteArray_Impl__obj::toBytes(bytes),rootPath));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(AssetLibrary_obj,fromBytes,return )

 ::openfl::utils::AssetLibrary AssetLibrary_obj::fromFile(::String path,::String rootPath){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_51_fromFile)
HXDLIN(  51)		return ::openfl::utils::AssetLibrary_obj::fromManifest(::lime::utils::AssetManifest_obj::fromFile(path,rootPath));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(AssetLibrary_obj,fromFile,return )

 ::openfl::utils::AssetLibrary AssetLibrary_obj::fromManifest( ::lime::utils::AssetManifest manifest){
            	HX_GC_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_56_fromManifest)
HXLINE(  58)		 ::lime::utils::AssetLibrary library = ::lime::utils::AssetLibrary_obj::fromManifest(manifest);
HXLINE(  60)		if (hx::IsNotNull( library )) {
HXLINE(  62)			if (::Std_obj::is(library,hx::ClassOf< ::openfl::utils::AssetLibrary >())) {
HXLINE(  64)				return ( ( ::openfl::utils::AssetLibrary)(library) );
            			}
            			else {
HXLINE(  68)				 ::openfl::utils::AssetLibrary _library =  ::openfl::utils::AssetLibrary_obj::__alloc( HX_CTX );
HXLINE(  69)				_library->_hx___proxy = library;
HXLINE(  70)				return _library;
            			}
            		}
            		else {
HXLINE(  76)			return null();
            		}
HXLINE(  60)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(AssetLibrary_obj,fromManifest,return )

 ::lime::app::Future AssetLibrary_obj::loadFromBytes( ::openfl::utils::ByteArrayData bytes,::String rootPath){
            		HX_BEGIN_LOCAL_FUNC_S0(hx::LocalFunc,_hx_Closure_0) HXARGC(1)
            		 ::lime::app::Future _hx_run( ::lime::utils::AssetManifest manifest){
            			HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_304_loadFromBytes)
HXLINE( 304)			return ::openfl::utils::AssetLibrary_obj::loadFromManifest(manifest);
            		}
            		HX_END_LOCAL_FUNC1(return)

            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_302_loadFromBytes)
HXDLIN( 302)		return ::lime::utils::AssetManifest_obj::loadFromBytes(::openfl::utils::_ByteArray::ByteArray_Impl__obj::toBytes(bytes),rootPath)->then( ::Dynamic(new _hx_Closure_0()));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(AssetLibrary_obj,loadFromBytes,return )

 ::lime::app::Future AssetLibrary_obj::loadFromFile(::String path,::String rootPath){
            		HX_BEGIN_LOCAL_FUNC_S0(hx::LocalFunc,_hx_Closure_0) HXARGC(1)
            		 ::lime::app::Future _hx_run( ::lime::utils::AssetManifest manifest){
            			HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_315_loadFromFile)
HXLINE( 315)			return ::openfl::utils::AssetLibrary_obj::loadFromManifest(manifest);
            		}
            		HX_END_LOCAL_FUNC1(return)

            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_313_loadFromFile)
HXDLIN( 313)		return ::lime::utils::AssetManifest_obj::loadFromFile(path,rootPath)->then( ::Dynamic(new _hx_Closure_0()));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(AssetLibrary_obj,loadFromFile,return )

 ::lime::app::Future AssetLibrary_obj::loadFromManifest( ::lime::utils::AssetManifest manifest){
            	HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_322_loadFromManifest)
HXLINE( 324)		 ::openfl::utils::AssetLibrary library = ::openfl::utils::AssetLibrary_obj::fromManifest(manifest);
HXLINE( 326)		if (hx::IsNotNull( library )) {
            			HX_BEGIN_LOCAL_FUNC_S0(hx::LocalFunc,_hx_Closure_0) HXARGC(1)
            			 ::lime::app::Future _hx_run( ::lime::utils::AssetLibrary library1){
            				HX_STACKFRAME(&_hx_pos_547ec2a4bdcd47c7_330_loadFromManifest)
HXLINE( 330)				return ::lime::app::Future_obj::withValue(( ( ::openfl::utils::AssetLibrary)(library1) ));
            			}
            			HX_END_LOCAL_FUNC1(return)

HXLINE( 328)			return library->load()->then( ::Dynamic(new _hx_Closure_0()));
            		}
            		else {
HXLINE( 336)			return ::lime::app::Future_obj::withError(HX_("Could not load asset manifest",cd,c6,09,7f));
            		}
HXLINE( 326)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(AssetLibrary_obj,loadFromManifest,return )


hx::ObjectPtr< AssetLibrary_obj > AssetLibrary_obj::__new() {
	hx::ObjectPtr< AssetLibrary_obj > __this = new AssetLibrary_obj();
	__this->__construct();
	return __this;
}

hx::ObjectPtr< AssetLibrary_obj > AssetLibrary_obj::__alloc(hx::Ctx *_hx_ctx) {
	AssetLibrary_obj *__this = (AssetLibrary_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(AssetLibrary_obj), true, "openfl.utils.AssetLibrary"));
	*(void **)__this = AssetLibrary_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

AssetLibrary_obj::AssetLibrary_obj()
{
}

void AssetLibrary_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(AssetLibrary);
	HX_MARK_MEMBER_NAME(_hx___proxy,"__proxy");
	 ::lime::utils::AssetLibrary_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void AssetLibrary_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(_hx___proxy,"__proxy");
	 ::lime::utils::AssetLibrary_obj::__Visit(HX_VISIT_ARG);
}

hx::Val AssetLibrary_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"list") ) { return hx::Val( list_dyn() ); }
		if (HX_FIELD_EQ(inName,"load") ) { return hx::Val( load_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"exists") ) { return hx::Val( exists_dyn() ); }
		if (HX_FIELD_EQ(inName,"unload") ) { return hx::Val( unload_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"__proxy") ) { return hx::Val( _hx___proxy ); }
		if (HX_FIELD_EQ(inName,"getFont") ) { return hx::Val( getFont_dyn() ); }
		if (HX_FIELD_EQ(inName,"getPath") ) { return hx::Val( getPath_dyn() ); }
		if (HX_FIELD_EQ(inName,"getText") ) { return hx::Val( getText_dyn() ); }
		if (HX_FIELD_EQ(inName,"isLocal") ) { return hx::Val( isLocal_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"getAsset") ) { return hx::Val( getAsset_dyn() ); }
		if (HX_FIELD_EQ(inName,"getBytes") ) { return hx::Val( getBytes_dyn() ); }
		if (HX_FIELD_EQ(inName,"getImage") ) { return hx::Val( getImage_dyn() ); }
		if (HX_FIELD_EQ(inName,"loadFont") ) { return hx::Val( loadFont_dyn() ); }
		if (HX_FIELD_EQ(inName,"loadText") ) { return hx::Val( loadText_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"loadAsset") ) { return hx::Val( loadAsset_dyn() ); }
		if (HX_FIELD_EQ(inName,"loadBytes") ) { return hx::Val( loadBytes_dyn() ); }
		if (HX_FIELD_EQ(inName,"loadImage") ) { return hx::Val( loadImage_dyn() ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"getMovieClip") ) { return hx::Val( getMovieClip_dyn() ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"loadMovieClip") ) { return hx::Val( loadMovieClip_dyn() ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"getAudioBuffer") ) { return hx::Val( getAudioBuffer_dyn() ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"loadAudioBuffer") ) { return hx::Val( loadAudioBuffer_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

bool AssetLibrary_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 8:
		if (HX_FIELD_EQ(inName,"fromFile") ) { outValue = fromFile_dyn(); return true; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"fromBytes") ) { outValue = fromBytes_dyn(); return true; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"fromManifest") ) { outValue = fromManifest_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"loadFromFile") ) { outValue = loadFromFile_dyn(); return true; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"loadFromBytes") ) { outValue = loadFromBytes_dyn(); return true; }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"loadFromManifest") ) { outValue = loadFromManifest_dyn(); return true; }
	}
	return false;
}

hx::Val AssetLibrary_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"__proxy") ) { _hx___proxy=inValue.Cast<  ::lime::utils::AssetLibrary >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void AssetLibrary_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("__proxy","\x4e","\x47","\xee","\x32"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo AssetLibrary_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*::lime::utils::AssetLibrary*/ ,(int)offsetof(AssetLibrary_obj,_hx___proxy),HX_HCSTRING("__proxy","\x4e","\x47","\xee","\x32")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *AssetLibrary_obj_sStaticStorageInfo = 0;
#endif

static ::String AssetLibrary_obj_sMemberFields[] = {
	HX_HCSTRING("__proxy","\x4e","\x47","\xee","\x32"),
	HX_HCSTRING("exists","\xdc","\x1d","\xe0","\xbf"),
	HX_HCSTRING("getAsset","\x7a","\x79","\x10","\x86"),
	HX_HCSTRING("getAudioBuffer","\x80","\x41","\xe3","\x26"),
	HX_HCSTRING("getBytes","\xf5","\x17","\x6f","\x1d"),
	HX_HCSTRING("getFont","\x85","\x0d","\x43","\x16"),
	HX_HCSTRING("getImage","\xe5","\x2e","\x40","\x1d"),
	HX_HCSTRING("getMovieClip","\x2a","\x9f","\x71","\x27"),
	HX_HCSTRING("getPath","\x5b","\x95","\xd4","\x1c"),
	HX_HCSTRING("getText","\x63","\x7c","\x7c","\x1f"),
	HX_HCSTRING("isLocal","\x21","\x6d","\x76","\x15"),
	HX_HCSTRING("list","\x5e","\x1c","\xb3","\x47"),
	HX_HCSTRING("loadAsset","\xea","\xb5","\x70","\x41"),
	HX_HCSTRING("load","\x26","\x9a","\xb7","\x47"),
	HX_HCSTRING("loadAudioBuffer","\xf0","\x71","\x7c","\xe3"),
	HX_HCSTRING("loadBytes","\x65","\x54","\xcf","\xd8"),
	HX_HCSTRING("loadFont","\x15","\x2f","\x60","\xb4"),
	HX_HCSTRING("loadImage","\x55","\x6b","\xa0","\xd8"),
	HX_HCSTRING("loadMovieClip","\x9a","\xd3","\x80","\x9a"),
	HX_HCSTRING("loadText","\xf3","\x9d","\x99","\xbd"),
	HX_HCSTRING("unload","\xff","\xa0","\x8c","\x65"),
	::String(null()) };

static void AssetLibrary_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(AssetLibrary_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void AssetLibrary_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(AssetLibrary_obj::__mClass,"__mClass");
};

#endif

hx::Class AssetLibrary_obj::__mClass;

static ::String AssetLibrary_obj_sStaticFields[] = {
	HX_HCSTRING("fromBytes","\xa1","\xf2","\x20","\x72"),
	HX_HCSTRING("fromFile","\x06","\x9d","\x87","\xa1"),
	HX_HCSTRING("fromManifest","\x39","\xd7","\x40","\x70"),
	HX_HCSTRING("loadFromBytes","\x9b","\xc3","\x86","\xf4"),
	HX_HCSTRING("loadFromFile","\x4c","\x89","\xf0","\x5a"),
	HX_HCSTRING("loadFromManifest","\x7f","\x5e","\x9c","\xdc"),
	::String(null())
};

void AssetLibrary_obj::__register()
{
	hx::Object *dummy = new AssetLibrary_obj;
	AssetLibrary_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("openfl.utils.AssetLibrary","\x86","\xa1","\xe2","\x86");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &AssetLibrary_obj::__GetStatic;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = AssetLibrary_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(AssetLibrary_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(AssetLibrary_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< AssetLibrary_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = AssetLibrary_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = AssetLibrary_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = AssetLibrary_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace openfl
} // end namespace utils