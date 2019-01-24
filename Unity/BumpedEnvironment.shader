Shader "Holistic/Illumination/BumpedEnvironment" {

	Properties{
		_diffuseTexture("Diffuse Texture", 2D) = "white" {}
		_normalTexture("Normal Texture", 2D) = "bump" {}
		_normalIntensity("Normal Intensity", Range(0,10)) = 1
		_brightness("Brightness", Range(0,10)) = 1
		_emissionBrightness("Emission Brightness", Range(0,2)) = 1
		_cubeMap("Cube Map", CUBE) = "black"{}
	}
		SubShader{

			CGPROGRAM
				#pragma surface surf Lambert

				sampler2D _diffuseTexture;
				sampler2D _normalTexture;
				samplerCUBE _cubeMap;
				half _normalIntensity;
				half _brightness;
				half _emissionBrightness;

				struct Input {
					float2 uv_diffuseTexture;
					float2 uv_normalTexture;
					float3 worldRefl; INTERNAL_DATA
				};

				void surf(Input IN, inout SurfaceOutput o) {
					o.Albedo = tex2D(_diffuseTexture, IN.uv_diffuseTexture).rgb;
					o.Normal = UnpackNormal(tex2D(_normalTexture, IN.uv_normalTexture)) * _brightness;
					o.Normal *= float3(_normalIntensity,_normalIntensity,1);
					o.Emission = texCUBE(_cubeMap, WorldReflectionVector(IN, o.Normal)).rgb * _emissionBrightness;
				//	o.Albedo = texCUBE(_cubeMap, WorldReflectionVector(IN, o.Normal)).rgb * _emissionBrightness;
				}

			ENDCG
	}
		Fallback "Diffuse"
}