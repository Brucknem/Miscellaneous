Shader "Holistic/Illumination/Buffers and Queues" {
  Properties{
    _MainTex("Base (RGB)", 2D) = "white"{}
  }

  SubShader {
    Tags {"Queue" = "Geometry+100"}
    ZWrite OFF

    CGPROGRAM

      #pragma surface surf Lambert


      struct Input {
        float2 uv_MainTex;
      };

      sampler2D _MainTex;

      void surf(Input IN, inout SurfaceOutput o){
        o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
      }

    ENDCG
  }

  Fallback "Diffuse"
}
