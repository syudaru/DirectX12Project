#include"BasicType.hlsli"

//�ϊ����܂Ƃ߂��\����
//�萔�o�b�t�@0
cbuffer SceneData : register(b0) {
	matrix world;//���[���h�ϊ��s��
	matrix view;
	matrix proj;//�r���[�v���W�F�N�V�����s��
	float3 eye;
};
//���_�V�F�[�_
BasicType BasicVS(float4 pos : POSITION, float4 normal : NORMAL, float2 uv:TEXCOORD, min16uint2 boneno : BONE_NO, min16uint weight : WEIGHT) {	//float4 nomal: NORMAL,//min16uint2 boneno : BONE_NO, min16uint weight : WEIGHT
	BasicType output;//�s�N�Z���V�F�[�_�֓n���l
	output.svpos = mul(mul(view, world), pos);
	normal.w = 0;
	output.normal = mul(world,normal);
	output.uv = uv;
	return output;
}
