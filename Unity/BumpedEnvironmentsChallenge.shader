Shader "Holistic/Illumination/BumpedEnvironmentsChallenge" {
	Properties{
		_normalMap("Normal Map", 2D) = "bump"{}
		_cubeMap("Cube Map", CUBE) = "white"{}
	}
		SubShader{
			CGPROGRAM
			#pragma surface surf Lambert

			sampler2D _normalMap;
			samplerCUBE _cubeMap;

			struct Input {
				float2 uv_normalMap;
				float3 worldRefl; INTERNAL_DATA
			};

			void surf(Input IN, inout SurfaceOutput o) {
				o.Normal = UnpackNormal(tex2D(_normalMap, IN.uv_normalMap)) * 0.3;
				o.Albedo = texCUBE(_cubeMap, WorldReflectionVector(IN, o.Normal)).rgb;
			}

		ENDCG
	}
		Fallback "Diffuse"
}