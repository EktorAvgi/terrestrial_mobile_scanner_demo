Shader "2nd_floor_carpet" {
        Properties {
            _MainTex ("Base (RGB)", 2D) = "white" {}
            _Color ("Alpha", Color) = (1,1,1,1)
            _RotationSpeed ("Rotation Speed", Float) = 2.0
        }
        SubShader {
            Tags { "RenderType"="Transparent" "Queue" = "Transparent" }
            LOD 200
       
            CGPROGRAM
            #pragma surface surf Lambert vertex:vert
 
            sampler2D _MainTex;
            float4 _Color;
 
            struct Input {
                float2 uv_MainTex;
            };
 
            float _RotationSpeed;
            void vert (inout appdata_full v) {
                v.texcoord.xy -=0.5;
                float s = sin ( _RotationSpeed  );
                float c = cos ( _RotationSpeed  );
                float2x2 rotationMatrix = float2x2( c, -s, s, c);
                rotationMatrix *=0.5;
                rotationMatrix +=0.5;
                rotationMatrix = rotationMatrix * 2-1;
                v.texcoord.xy = mul ( v.texcoord.xy, rotationMatrix );
                v.texcoord.xy += 0.5;
            }
 
            void surf (Input IN, inout SurfaceOutput o) {
                half4 c = tex2D (_MainTex, IN.uv_MainTex);
                o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb * 1;
                o.Albedo *=  _Color.rgb;
                o.Alpha = _Color.a;
            }
            ENDCG
        }
        FallBack "Diffuse"
    }