#include"BasicType.hlsli"
Texture2D<float4> tex:register(t0);//0番スロットに設定されたテクスチャ
SamplerState smp:register(s0);//0番スロットに設定されたサンプラ


//定数バッファ
cbuffer cbuff0 : register(b0) {
	matrix world;//ワールド変換行列
	matrix viewproj;//ビュープロジェクション行列
};

//マテリアル用
cbuffer Material : register(b1) {
	float4 diffuse;//ディフューズ色
	float4 specular;//スペキュラ
	float3 ambient;//アンビエント
};

//ピクセルシェーダ
float4 BasicPS(BasicType input) : SV_TARGET{
	//return float4(0,0,0,1);
	//return float4(tex.Sample(smp,input.uv))
	//return float4(input.normal.xyz,1);
	float3 light = normalize(float3(1,-1,1));
	float brightness = dot(-light, input.normal);
	return float4(brightness, brightness, brightness, 1) * diffuse * tex.Sample(smp,input.uv);
}