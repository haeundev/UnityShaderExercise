Shader "Custom/NewSurfaceShader"
{
    Properties
    {
        _Red("Red", Range(0,1)) = 0
        _Green("Green", Range(0,1)) = 0
        _Blue("Blue", Range(0,1)) = 0
        _Brightness("Brightness", Range(-1,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        struct Input
        {
            float4 color : COLOR;
        };

        float _Red;
        float _Green;
        float _Blue;
        float _Brightness;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = float3(_Red, _Green, _Blue) + _Brightness;
            o.Alpha = 1;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
