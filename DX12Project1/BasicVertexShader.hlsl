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
BasicType BasicVS(float4 pos : POSITION, float4 normal : NORMAL, float2 uv:TEXCOORD, min16uint2 boneno : BONE_NO, min16uint weight : WEIGHT) {	//float4 nomal: NORMAL,//min16uint2 boneno : BONE_NO, min16uint weight : WEIGHT
	BasicType output;//ピクセルシェーダへ渡す値
	output.svpos = mul(mul(view, world), pos);
	normal.w = 0;
	output.normal = mul(world,normal);
	output.uv = uv;
	return output;
}
