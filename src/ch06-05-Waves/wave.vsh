
cbuffer MatrixBuffer : register(b0)
{
	float4x4 model;
	float4x4 view;
	float4x4 proj;
};

 struct VS_IN
{
    float4 Pos   : POSITION;
    float4 Color : COLOR0;
};

struct VS_OUT
{
    float4 Pos   : SV_POSITION;
    float4 Color : COLOR0;
};

VS_OUT VS( VS_IN vs_in)
{	
 
   VS_OUT vs_out;
   vs_in.Pos.w = 1.0f;
   vs_out.Pos = mul(vs_in.Pos,  model);
   vs_out.Pos = mul(vs_out.Pos, view);
   vs_out.Pos = mul(vs_out.Pos, proj);

   vs_out.Color = vs_in.Color;
 
   return vs_out;
}
