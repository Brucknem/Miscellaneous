Shader "Holistic/Dot Product/Logical Cutoff" {
  Properties {
    _MainTex ("Albedo Texture", 2D) = "white"{}
    _stripeSize ("Stripe Size", Range(0, 1)) = 0.5
    _stripeVariation ("Stripe Variation", Range(0, 1)) = 0.5
    _emissionStrength("Emission Strenght", Range(0,2)) = 0.5
  }

  SubShader {
    CGPROGRAM
      #pragma surface surf Lambert

      struct Input {
        float3 viewDir;
        float3 worldPos;
        float2 uv_MainTex;
      };

      sampler2D _MainTex;
      float _stripeSize;
      float _stripeVariation;
      float _emissionStrength;

      void surf(Input IN, inout SurfaceOutput o){
        half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
        o.Emission = (frac(IN.worldPos.y * 20 * (1 - _stripeSize)) > _stripeVariation ?
                        float3(0,1,0):  float3(1,0,0)) * _emissionStrength ;
        o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
      }
    ENDCG
  }

  Fallback "Diffuse"
}
