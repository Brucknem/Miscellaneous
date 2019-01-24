Shader "Holistic/Properties/Challenge4" {
  Properties {
    _diffuseTexture ("Diffuse Texture", 2D) = "white"{}
    _emissiveTexture ("Emissive Texture", 2D) = "black"{}
  }

  SubShader {
    CGPROGRAM
      #pragma surface surf Lambert

      struct Input {
        float2 uv_diffuseTexture;
        float2 uv_emissiveTexture;
      };

      sampler2D _diffuseTexture;
      sampler2D _emissiveTexture;

      void surf(Input IN, inout SurfaceOutput o){
        o.Albedo = tex2D(_diffuseTexture, IN.uv_diffuseTexture).rgb;
        o.Emission = tex2D(_emissiveTexture, IN.uv_emissiveTexture).rgb;
      }
    ENDCG
  }

  Fallback "Diffuse"
}
