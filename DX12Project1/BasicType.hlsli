//0�ŃT���v���̃R�[�h�A�P��8.6.2�܂ł̃R�[�h
#if 0
//���_�V�F�[�_���s�N�Z���V�F�[�_�ւ̂����Ɏg�p����
//�\����
struct BasicType {
	float4 svpos:SV_POSITION;//�V�X�e���p���_���W
	float4 normal : NORMAL;//�@���x�N�g��
	float2 uv:TEXCOORD;//UV�l
};
#else
struct BasicType {
	float4 svpos:SV_POSITION;//�V�X�e���p���_���W
	float4 pos:POSITION;//�V�X�e���p���_���W
	float4 normal:NORMAL0;//�@���x�N�g��
	float4 vnormal:NORMAL1;//�@���x�N�g��
	float2 uv:TEXCOORD;//UV�l
	float3 ray:VECTOR;//�x�N�g��
};
#endif
