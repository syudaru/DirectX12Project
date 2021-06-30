//0でサンプルのコード、１で8.6.2までのコード
#if 0
#include"BasicType.hlsli"
//変換をまとめた構造体
//定数バッファ0
cbuffer SceneData : register(b0) {
	matrix world;//ワールド変換行列
	matrix view;
	matrix proj;//ビュープロジェクション行列
	float3 eye;
};
//頂点シェーダ
BasicType BasicVS(float4 pos : POSITION, float4 normal : NORMAL, float2 uv : TEXCOORD, min16uint2 boneno : BONE_NO, min16uint weight : WEIGHT) {	//float4 nomal: NORMAL,//min16uint2 boneno : BONE_NO, min16uint weight : WEIGHT
	BasicType output;//ピクセルシェーダへ渡す値
	output.svpos = mul(mul(view, world), pos);
	normal.w = 0;
	output.normal = mul(world, normal);
	output.uv = uv;
	return output;
}
#else 
#include"BasicType.hlsli"

//定数バッファ0
cbuffer SceneData : register(b0) {
	matrix world;//ワールド変換行列
	matrix view;
	matrix proj;//ビュープロジェクション行列
	float3 eye;
};

//頂点シェーダ→ピクセルシェーダへのやり取りに使用する
//構造体
struct Output {
	float4 svpos:SV_POSITION;//システム用頂点座標
	float4 pos:POSITION;//システム用頂点座標
	float4 normal:NORMAL0;//法線ベクトル
	float4 vnormal:NORMAL1;//法線ベクトル
	float2 uv:TEXCOORD;//UV値
	float3 ray:VECTOR;//ベクトル
};

BasicType BasicVS(float4 pos : POSITION, float4 normal : NORMAL, float2 uv : TEXCOORD) {
	BasicType output;//ピクセルシェーダへ渡す値
	pos = mul(world, pos);
	output.svpos = mul(mul(proj, view), pos);//シェーダでは列優先なので注意
	output.pos = mul(view, pos);
	normal.w = 0;//ここ重要(平行移動成分を無効にする)
	output.normal = mul(world, normal);//法線にもワールド変換を行う
	output.vnormal = mul(view, output.normal);
	output.uv = uv;
	output.ray = normalize(pos.xyz - mul(view, eye));//視線ベクトル

	return output;
}
#endif
