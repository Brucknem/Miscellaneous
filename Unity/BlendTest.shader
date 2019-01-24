Shader "Holistic/Passes and Blending/Blend Test" {

	Properties{
    _MainTex("Texture", 2D) = "black" {}
  }

  SubShader {
    Tags {"Queue" = "Transparent"}
    Blend One One
    Pass {
      SetTexture [_MainTex] { combine texture }
    }
  }
}
