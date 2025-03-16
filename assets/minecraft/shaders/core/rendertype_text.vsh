#version 110

#moj_import <fog.glsl>
#moj_import <light.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler0;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;
uniform int FogShape;
uniform vec2 ScreenSize;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

#define HH_VERSION 3
#define HH_OFFSET 67

// Function to convert a vertical ascent into a ID.
float get_id(float offset) {
    if (offset <= 0.0)
        return 0.0;
    return trunc(offset/1000.0);
}

void main() {
    vec3 pos = Position;

    vertexDistance = fog_distance(ModelViewMat, IViewRotMat * Position, FogShape);
    vertexColor = Color;
    texCoord0 = UV0;

    vec2 pixel = vec2(ProjMat[0][0], ProjMat[1][1]) / 2.0;
    int guiScale = int(round(pixel.x / (1 / ScreenSize.x)));
    vec2 guiSize = ScreenSize / guiScale;

    float id = get_id((round(HH_OFFSET - Position.y)) * -1);

    // Detect if GUI text.
    if (id > 99 && Color.a != 0.0) {
        float yOffset = 0.0;
        float xOffset = 0.0;
        float layer = 0.0;
        vec2 scale = vec2(1, 1);
        bool outlined = false;

        switch (int(id)) {
            case 100:
                xOffset = int(guiSize.x * (-50.0/100))-290;
                yOffset = int(guiSize.y * (0.0/100))+11;
                layer = -2.0E-4;
                break;
            case 101:
                xOffset = int(guiSize.x * (-50.0/100))-290;
                yOffset = int(guiSize.y * (0.0/100))+14;
                layer = -2.0E-4;
                break;
            case 102:
                xOffset = int(guiSize.x * (-50.0/100))-279;
                yOffset = int(guiSize.y * (0.0/100))+12;
                layer = -1.0E-4;
                break;
            case 103:
                xOffset = int(guiSize.x * (-50.0/100))-290;
                yOffset = int(guiSize.y * (0.0/100))+21;
                layer = -2.0E-4;
                break;
            case 104:
                xOffset = int(guiSize.x * (-50.0/100))-290;
                yOffset = int(guiSize.y * (0.0/100))+24;
                layer = -2.0E-4;
                break;
            case 105:
                xOffset = int(guiSize.x * (-50.0/100))-279;
                yOffset = int(guiSize.y * (0.0/100))+22;
                layer = -1.0E-4;
                break;
            case 106:
                xOffset = int(guiSize.x * (-50.0/100))-260;
                yOffset = int(guiSize.y * (0.0/100))+11;
                layer = -2.0E-4;
                break;
            case 107:
                xOffset = int(guiSize.x * (-50.0/100))-260;
                yOffset = int(guiSize.y * (0.0/100))+14;
                layer = -2.0E-4;
                break;
            case 108:
                xOffset = int(guiSize.x * (-50.0/100))-249;
                yOffset = int(guiSize.y * (0.0/100))+12;
                layer = -1.0E-4;
                break;
            case 109:
                xOffset = int(guiSize.x * (-50.0/100))-260;
                yOffset = int(guiSize.y * (0.0/100))+21;
                layer = -2.0E-4;
                break;
            case 110:
                xOffset = int(guiSize.x * (-50.0/100))-260;
                yOffset = int(guiSize.y * (0.0/100))+24;
                layer = -2.0E-4;
                break;
            case 111:
                xOffset = int(guiSize.x * (-50.0/100))-249;
                yOffset = int(guiSize.y * (0.0/100))+22;
                layer = -1.0E-4;
                break;
            case 112:
                xOffset = int(guiSize.x * (-50.0/100))-216;
                yOffset = int(guiSize.y * (0.0/100))+11;
                layer = -2.0E-4;
                break;
            case 113:
                xOffset = int(guiSize.x * (-50.0/100))-216;
                yOffset = int(guiSize.y * (0.0/100))+14;
                layer = -2.0E-4;
                break;
            case 114:
                xOffset = int(guiSize.x * (-50.0/100))-205;
                yOffset = int(guiSize.y * (0.0/100))+12;
                layer = -1.0E-4;
                break;
            case 115:
                xOffset = int(guiSize.x * (-50.0/100))-216;
                yOffset = int(guiSize.y * (0.0/100))+21;
                layer = -2.0E-4;
                break;
            case 116:
                xOffset = int(guiSize.x * (-50.0/100))-216;
                yOffset = int(guiSize.y * (0.0/100))+24;
                layer = -2.0E-4;
                break;
            case 117:
                xOffset = int(guiSize.x * (-50.0/100))-205;
                yOffset = int(guiSize.y * (0.0/100))+22;
                layer = -1.0E-4;
                break;
            case 118:
                xOffset = int(guiSize.x * (-50.0/100))-172;
                yOffset = int(guiSize.y * (0.0/100))+23;
                layer = -3.0000000000000003E-4;
                break;
            case 119:
                xOffset = int(guiSize.x * (-50.0/100))-173;
                yOffset = int(guiSize.y * (0.0/100))+22;
                layer = -2.0E-4;
                break;
            case 120:
                xOffset = int(guiSize.x * (-50.0/100))-162;
                yOffset = int(guiSize.y * (0.0/100))+22;
                layer = -1.0E-4;
                break;
            case 121:
                xOffset = int(guiSize.x * (-50.0/100))-130;
                yOffset = int(guiSize.y * (0.0/100))+23;
                layer = -3.0000000000000003E-4;
                break;
            case 122:
                xOffset = int(guiSize.x * (-50.0/100))-131;
                yOffset = int(guiSize.y * (0.0/100))+22;
                layer = -2.0E-4;
                break;
            case 123:
                xOffset = int(guiSize.x * (-50.0/100))-120;
                yOffset = int(guiSize.y * (0.0/100))+22;
                layer = -1.0E-4;
                break;
            case 124:
                xOffset = int(guiSize.x * (-50.0/100))+210;
                yOffset = int(guiSize.y * (0.0/100))+23;
                layer = -5.0E-4;
                break;
            case 125:
                xOffset = int(guiSize.x * (-50.0/100))+209;
                yOffset = int(guiSize.y * (0.0/100))+22;
                layer = -4.0E-4;
                break;
            case 126:
                xOffset = int(guiSize.x * (-50.0/100))+209;
                yOffset = int(guiSize.y * (0.0/100))+22;
                layer = -3.0000000000000003E-4;
                break;
            case 127:
                xOffset = int(guiSize.x * (-50.0/100))+189;
                yOffset = int(guiSize.y * (0.0/100))+21;
                layer = -2.0E-4;
                break;
            case 128:
                xOffset = int(guiSize.x * (-50.0/100))+189;
                yOffset = int(guiSize.y * (0.0/100))+24;
                layer = -2.0E-4;
                break;
            case 129:
                xOffset = int(guiSize.x * (-50.0/100))+220;
                yOffset = int(guiSize.y * (0.0/100))+22;
                layer = -1.0E-4;
                break;
            case 130:
                xOffset = int(guiSize.x * (-50.0/100))-130;
                yOffset = int(guiSize.y * (0.0/100))+12;
                layer = -4.0E-4;
                break;
            case 131:
                xOffset = int(guiSize.x * (-50.0/100))-131;
                yOffset = int(guiSize.y * (0.0/100))+11;
                layer = -3.0000000000000003E-4;
                break;
            case 132:
                xOffset = int(guiSize.x * (-50.0/100))-151;
                yOffset = int(guiSize.y * (0.0/100))+10;
                layer = -2.0E-4;
                break;
            case 133:
                xOffset = int(guiSize.x * (-50.0/100))-151;
                yOffset = int(guiSize.y * (0.0/100))+13;
                layer = -2.0E-4;
                break;
            case 134:
                xOffset = int(guiSize.x * (-50.0/100))-120;
                yOffset = int(guiSize.y * (0.0/100))+11;
                layer = -1.0E-4;
                break;
            case 135:
                xOffset = int(guiSize.x * (-50.0/100))+210;
                yOffset = int(guiSize.y * (0.0/100))+12;
                layer = -4.0E-4;
                break;
            case 136:
                xOffset = int(guiSize.x * (-50.0/100))+209;
                yOffset = int(guiSize.y * (0.0/100))+11;
                layer = -3.0000000000000003E-4;
                break;
            case 137:
                xOffset = int(guiSize.x * (-50.0/100))+189;
                yOffset = int(guiSize.y * (0.0/100))+10;
                layer = -2.0E-4;
                break;
            case 138:
                xOffset = int(guiSize.x * (-50.0/100))+189;
                yOffset = int(guiSize.y * (0.0/100))+13;
                layer = -2.0E-4;
                break;
            case 139:
                xOffset = int(guiSize.x * (-50.0/100))+220;
                yOffset = int(guiSize.y * (0.0/100))+11;
                layer = -1.0E-4;
                break;
            case 140:
                xOffset = int(guiSize.x * (-50.0/100))-7;
                yOffset = int(guiSize.y * (0.0/100))+48;
                layer = -2.0E-4;
                break;
            case 141:
                xOffset = int(guiSize.x * (-50.0/100))-7;
                yOffset = int(guiSize.y * (0.0/100))+51;
                layer = -2.0E-4;
                break;
            case 142:
                xOffset = int(guiSize.x * (-50.0/100))+4;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -1.0E-4;
                break;
            case 143:
                xOffset = int(guiSize.x * (-50.0/100))+25;
                yOffset = int(guiSize.y * (0.0/100))+48;
                layer = -2.0E-4;
                break;
            case 144:
                xOffset = int(guiSize.x * (-50.0/100))+25;
                yOffset = int(guiSize.y * (0.0/100))+51;
                layer = -2.0E-4;
                break;
            case 145:
                xOffset = int(guiSize.x * (-50.0/100))+36;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -1.0E-4;
                break;
            case 146:
                xOffset = int(guiSize.x * (-50.0/100))+57;
                yOffset = int(guiSize.y * (0.0/100))+48;
                layer = -2.0E-4;
                break;
            case 147:
                xOffset = int(guiSize.x * (-50.0/100))+57;
                yOffset = int(guiSize.y * (0.0/100))+51;
                layer = -2.0E-4;
                break;
            case 148:
                xOffset = int(guiSize.x * (-50.0/100))+68;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -1.0E-4;
                break;
            case 149:
                xOffset = int(guiSize.x * (-50.0/100))+89;
                yOffset = int(guiSize.y * (0.0/100))+48;
                layer = -2.0E-4;
                break;
            case 150:
                xOffset = int(guiSize.x * (-50.0/100))+89;
                yOffset = int(guiSize.y * (0.0/100))+51;
                layer = -2.0E-4;
                break;
            case 151:
                xOffset = int(guiSize.x * (-50.0/100))+100;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -1.0E-4;
                break;
            case 152:
                xOffset = int(guiSize.x * (-50.0/100))+210;
                yOffset = int(guiSize.y * (0.0/100))+12;
                layer = -5.0E-4;
                break;
            case 153:
                xOffset = int(guiSize.x * (-50.0/100))+209;
                yOffset = int(guiSize.y * (0.0/100))+11;
                layer = -4.0E-4;
                break;
            case 154:
                xOffset = int(guiSize.x * (-50.0/100))-130;
                yOffset = int(guiSize.y * (0.0/100))+12;
                layer = -3.0000000000000003E-4;
                break;
            case 155:
                xOffset = int(guiSize.x * (-50.0/100))-131;
                yOffset = int(guiSize.y * (0.0/100))+11;
                layer = -2.0E-4;
                break;
            case 156:
                xOffset = int(guiSize.x * (-50.0/100))+210;
                yOffset = int(guiSize.y * (0.0/100))+23;
                layer = -3.0000000000000003E-4;
                break;
            case 157:
                xOffset = int(guiSize.x * (-50.0/100))+209;
                yOffset = int(guiSize.y * (0.0/100))+22;
                layer = -2.0E-4;
                break;
            case 158:
                xOffset = int(guiSize.x * (-50.0/100))-143;
                yOffset = int(guiSize.y * (0.0/100))+8;
                layer = -2.0E-4;
                break;
            case 159:
                xOffset = int(guiSize.x * (-50.0/100))-143;
                yOffset = int(guiSize.y * (0.0/100))+11;
                layer = -2.0E-4;
                break;
            case 160:
                xOffset = int(guiSize.x * (-50.0/100))-132;
                yOffset = int(guiSize.y * (0.0/100))+9;
                layer = -1.0E-4;
                break;
            case 161:
                xOffset = int(guiSize.x * (-50.0/100))-109;
                yOffset = int(guiSize.y * (0.0/100))+8;
                layer = -2.0E-4;
                break;
            case 162:
                xOffset = int(guiSize.x * (-50.0/100))-109;
                yOffset = int(guiSize.y * (0.0/100))+11;
                layer = -2.0E-4;
                break;
            case 163:
                xOffset = int(guiSize.x * (-50.0/100))-98;
                yOffset = int(guiSize.y * (0.0/100))+9;
                layer = -1.0E-4;
                break;
            case 164:
                xOffset = int(guiSize.x * (-50.0/100))-143;
                yOffset = int(guiSize.y * (0.0/100))+28;
                layer = -2.0E-4;
                break;
            case 165:
                xOffset = int(guiSize.x * (-50.0/100))-143;
                yOffset = int(guiSize.y * (0.0/100))+31;
                layer = -2.0E-4;
                break;
            case 166:
                xOffset = int(guiSize.x * (-50.0/100))-132;
                yOffset = int(guiSize.y * (0.0/100))+29;
                layer = -1.0E-4;
                break;
            case 167:
                xOffset = int(guiSize.x * (-50.0/100))-109;
                yOffset = int(guiSize.y * (0.0/100))+28;
                layer = -2.0E-4;
                break;
            case 168:
                xOffset = int(guiSize.x * (-50.0/100))-109;
                yOffset = int(guiSize.y * (0.0/100))+31;
                layer = -2.0E-4;
                break;
            case 169:
                xOffset = int(guiSize.x * (-50.0/100))-98;
                yOffset = int(guiSize.y * (0.0/100))+29;
                layer = -1.0E-4;
                break;
            case 170:
                xOffset = int(guiSize.x * (-50.0/100))-143;
                yOffset = int(guiSize.y * (0.0/100))+48;
                layer = -2.0E-4;
                break;
            case 171:
                xOffset = int(guiSize.x * (-50.0/100))-143;
                yOffset = int(guiSize.y * (0.0/100))+51;
                layer = -2.0E-4;
                break;
            case 172:
                xOffset = int(guiSize.x * (-50.0/100))-132;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -1.0E-4;
                break;
            case 173:
                xOffset = int(guiSize.x * (-50.0/100))-109;
                yOffset = int(guiSize.y * (0.0/100))+48;
                layer = -2.0E-4;
                break;
            case 174:
                xOffset = int(guiSize.x * (-50.0/100))-109;
                yOffset = int(guiSize.y * (0.0/100))+51;
                layer = -2.0E-4;
                break;
            case 175:
                xOffset = int(guiSize.x * (-50.0/100))-98;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -1.0E-4;
                break;
            case 176:
                xOffset = int(guiSize.x * (-50.0/100))-52;
                yOffset = int(guiSize.y * (0.0/100))+50;
                layer = -3.0000000000000003E-4;
                break;
            case 177:
                xOffset = int(guiSize.x * (-50.0/100))-53;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -2.0E-4;
                break;
            case 178:
                xOffset = int(guiSize.x * (-50.0/100))-42;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -1.0E-4;
                break;
            case 179:
                xOffset = int(guiSize.x * (-50.0/100))-10;
                yOffset = int(guiSize.y * (0.0/100))+50;
                layer = -3.0000000000000003E-4;
                break;
            case 180:
                xOffset = int(guiSize.x * (-50.0/100))-11;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -2.0E-4;
                break;
            case 181:
                xOffset = int(guiSize.x * (-50.0/100));
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -1.0E-4;
                break;
            case 182:
                xOffset = int(guiSize.x * (-50.0/100))+90;
                yOffset = int(guiSize.y * (0.0/100))+50;
                layer = -5.0E-4;
                break;
            case 183:
                xOffset = int(guiSize.x * (-50.0/100))+89;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -4.0E-4;
                break;
            case 184:
                xOffset = int(guiSize.x * (-50.0/100))+89;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -3.0000000000000003E-4;
                break;
            case 185:
                xOffset = int(guiSize.x * (-50.0/100))+69;
                yOffset = int(guiSize.y * (0.0/100))+48;
                layer = -2.0E-4;
                break;
            case 186:
                xOffset = int(guiSize.x * (-50.0/100))+69;
                yOffset = int(guiSize.y * (0.0/100))+51;
                layer = -2.0E-4;
                break;
            case 187:
                xOffset = int(guiSize.x * (-50.0/100))-10;
                yOffset = int(guiSize.y * (0.0/100))+39;
                layer = -4.0E-4;
                break;
            case 188:
                xOffset = int(guiSize.x * (-50.0/100))-11;
                yOffset = int(guiSize.y * (0.0/100))+38;
                layer = -3.0000000000000003E-4;
                break;
            case 189:
                xOffset = int(guiSize.x * (-50.0/100))-31;
                yOffset = int(guiSize.y * (0.0/100))+37;
                layer = -2.0E-4;
                break;
            case 190:
                xOffset = int(guiSize.x * (-50.0/100))-31;
                yOffset = int(guiSize.y * (0.0/100))+40;
                layer = -2.0E-4;
                break;
            case 191:
                xOffset = int(guiSize.x * (-50.0/100));
                yOffset = int(guiSize.y * (0.0/100))+38;
                layer = -1.0E-4;
                break;
            case 192:
                xOffset = int(guiSize.x * (-50.0/100))+90;
                yOffset = int(guiSize.y * (0.0/100))+39;
                layer = -4.0E-4;
                break;
            case 193:
                xOffset = int(guiSize.x * (-50.0/100))+89;
                yOffset = int(guiSize.y * (0.0/100))+38;
                layer = -3.0000000000000003E-4;
                break;
            case 194:
                xOffset = int(guiSize.x * (-50.0/100))+69;
                yOffset = int(guiSize.y * (0.0/100))+37;
                layer = -2.0E-4;
                break;
            case 195:
                xOffset = int(guiSize.x * (-50.0/100))+69;
                yOffset = int(guiSize.y * (0.0/100))+40;
                layer = -2.0E-4;
                break;
            case 196:
                xOffset = int(guiSize.x * (-50.0/100))+100;
                yOffset = int(guiSize.y * (0.0/100))+38;
                layer = -1.0E-4;
                break;
            case 197:
                xOffset = int(guiSize.x * (-50.0/100))-10;
                yOffset = int(guiSize.y * (0.0/100))+65;
                layer = -3.0000000000000003E-4;
                break;
            case 198:
                xOffset = int(guiSize.x * (-50.0/100))-10;
                yOffset = int(guiSize.y * (0.0/100))+65;
                layer = -2.0E-4;
                break;
            case 199:
                xOffset = int(guiSize.x * (-50.0/100))-5;
                yOffset = int(guiSize.y * (0.0/100))+67;
                layer = -1.0E-4;
                break;
            case 200:
                xOffset = int(guiSize.x * (-50.0/100))+10;
                yOffset = int(guiSize.y * (0.0/100))+65;
                layer = -3.0000000000000003E-4;
                break;
            case 201:
                xOffset = int(guiSize.x * (-50.0/100))+10;
                yOffset = int(guiSize.y * (0.0/100))+65;
                layer = -2.0E-4;
                break;
            case 202:
                xOffset = int(guiSize.x * (-50.0/100))+15;
                yOffset = int(guiSize.y * (0.0/100))+67;
                layer = -1.0E-4;
                break;
            case 203:
                xOffset = int(guiSize.x * (-50.0/100))-10;
                yOffset = int(guiSize.y * (0.0/100))+55;
                layer = -3.0000000000000003E-4;
                break;
            case 204:
                xOffset = int(guiSize.x * (-50.0/100))-10;
                yOffset = int(guiSize.y * (0.0/100))+55;
                layer = -2.0E-4;
                break;
            case 205:
                xOffset = int(guiSize.x * (-50.0/100))-5;
                yOffset = int(guiSize.y * (0.0/100))+57;
                layer = -1.0E-4;
                break;
            case 206:
                xOffset = int(guiSize.x * (-50.0/100))+10;
                yOffset = int(guiSize.y * (0.0/100))+55;
                layer = -3.0000000000000003E-4;
                break;
            case 207:
                xOffset = int(guiSize.x * (-50.0/100))+10;
                yOffset = int(guiSize.y * (0.0/100))+55;
                layer = -2.0E-4;
                break;
            case 208:
                xOffset = int(guiSize.x * (-50.0/100))+15;
                yOffset = int(guiSize.y * (0.0/100))+57;
                layer = -1.0E-4;
                break;
            case 209:
                xOffset = int(guiSize.x * (-0.0/100))-25;
                yOffset = int(guiSize.y * (100.0/100))-25;
                layer = -5.0E-4;
                break;
            case 210:
                xOffset = int(guiSize.x * (-0.0/100))-27;
                yOffset = int(guiSize.y * (100.0/100))-37;
                layer = -4.0E-4;
                break;
            case 211:
                xOffset = int(guiSize.x * (-0.0/100))-28;
                yOffset = int(guiSize.y * (100.0/100))-45;
                layer = -3.0000000000000003E-4;
                outlined = true;
                break;
            case 212:
                xOffset = int(guiSize.x * (-0.0/100))-28;
                yOffset = int(guiSize.y * (100.0/100))-42;
                layer = -3.0000000000000003E-4;
                outlined = true;
                break;
            case 213:
                xOffset = int(guiSize.x * (-0.0/100))-27;
                yOffset = int(guiSize.y * (100.0/100))-31;
                layer = -2.0E-4;
                break;
            case 214:
                xOffset = int(guiSize.x * (-0.0/100))-28;
                yOffset = int(guiSize.y * (100.0/100))-21;
                layer = -1.0E-4;
                outlined = true;
                break;
            case 215:
                xOffset = int(guiSize.x * (-0.0/100))-28;
                yOffset = int(guiSize.y * (100.0/100))-18;
                layer = -1.0E-4;
                outlined = true;
                break;
            case 216:
                xOffset = int(guiSize.x * (-50.0/100))-11;
                yOffset = int(guiSize.y * (0.0/100))+50;
                layer = -3.0000000000000003E-4;
                break;
            case 217:
                xOffset = int(guiSize.x * (-50.0/100))-12;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -2.0E-4;
                break;
            case 218:
                xOffset = int(guiSize.x * (-50.0/100))-1;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -1.0E-4;
                break;
            case 219:
                xOffset = int(guiSize.x * (-50.0/100))+91;
                yOffset = int(guiSize.y * (0.0/100))+39;
                layer = -5.0E-4;
                break;
            case 220:
                xOffset = int(guiSize.x * (-50.0/100))+90;
                yOffset = int(guiSize.y * (0.0/100))+38;
                layer = -4.0E-4;
                break;
            case 221:
                xOffset = int(guiSize.x * (-50.0/100))+90;
                yOffset = int(guiSize.y * (0.0/100))+38;
                layer = -3.0000000000000003E-4;
                break;
            case 222:
                xOffset = int(guiSize.x * (-50.0/100))+70;
                yOffset = int(guiSize.y * (0.0/100))+37;
                layer = -2.0E-4;
                break;
            case 223:
                xOffset = int(guiSize.x * (-50.0/100))+70;
                yOffset = int(guiSize.y * (0.0/100))+40;
                layer = -2.0E-4;
                break;
            case 224:
                xOffset = int(guiSize.x * (-50.0/100))+101;
                yOffset = int(guiSize.y * (0.0/100))+38;
                layer = -1.0E-4;
                break;
            case 225:
                xOffset = int(guiSize.x * (-50.0/100))-11;
                yOffset = int(guiSize.y * (0.0/100))+39;
                layer = -3.0000000000000003E-4;
                break;
            case 226:
                xOffset = int(guiSize.x * (-50.0/100))-12;
                yOffset = int(guiSize.y * (0.0/100))+38;
                layer = -2.0E-4;
                break;
            case 227:
                xOffset = int(guiSize.x * (-50.0/100))-1;
                yOffset = int(guiSize.y * (0.0/100))+38;
                layer = -1.0E-4;
                break;
            case 228:
                xOffset = int(guiSize.x * (-50.0/100))+91;
                yOffset = int(guiSize.y * (0.0/100))+50;
                layer = -3.0000000000000003E-4;
                break;
            case 229:
                xOffset = int(guiSize.x * (-50.0/100))+90;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -2.0E-4;
                break;
            case 230:
                xOffset = int(guiSize.x * (-50.0/100))+101;
                yOffset = int(guiSize.y * (0.0/100))+49;
                layer = -1.0E-4;
                break;
            case 231:
                xOffset = int(guiSize.x * (-50.0/100));
                yOffset = int(guiSize.y * (50.0/100))-10;
                layer = -1.0E-4;
                outlined = true;
                break;
            case 232:
                xOffset = int(guiSize.x * (-50.0/100));
                yOffset = int(guiSize.y * (50.0/100))-7;
                layer = -1.0E-4;
                outlined = true;
                break;
            case 233:
                xOffset = int(guiSize.x * (-50.0/100));
                yOffset = int(guiSize.y * (50.0/100))-20;
                layer = -1.0E-4;
                outlined = true;
                break;
            case 234:
                xOffset = int(guiSize.x * (-50.0/100));
                yOffset = int(guiSize.y * (50.0/100))-17;
                layer = -1.0E-4;
                outlined = true;
                break;
            case 235:
                xOffset = int(guiSize.x * (-50.0/100));
                yOffset = int(guiSize.y * (50.0/100))-30;
                layer = -1.0E-4;
                outlined = true;
                break;
            case 236:
                xOffset = int(guiSize.x * (-50.0/100));
                yOffset = int(guiSize.y * (50.0/100))-27;
                layer = -1.0E-4;
                outlined = true;
                break;
            case 237:
                xOffset = int(guiSize.x * (-100.0/100))+20;
                yOffset = int(guiSize.y * (100.0/100))-20;
                layer = -4.0E-4;
                break;
            case 238:
                xOffset = int(guiSize.x * (-100.0/100))-80;
                yOffset = int(guiSize.y * (100.0/100))-22;
                layer = -3.0000000000000003E-4;
                outlined = true;
                break;
            case 239:
                xOffset = int(guiSize.x * (-100.0/100))-80;
                yOffset = int(guiSize.y * (100.0/100))-19;
                layer = -3.0000000000000003E-4;
                outlined = true;
                break;
            case 240:
                xOffset = int(guiSize.x * (-100.0/100))-60;
                yOffset = int(guiSize.y * (100.0/100))-22;
                layer = -2.0E-4;
                outlined = true;
                break;
            case 241:
                xOffset = int(guiSize.x * (-100.0/100))-60;
                yOffset = int(guiSize.y * (100.0/100))-19;
                layer = -2.0E-4;
                outlined = true;
                break;
            case 242:
                xOffset = int(guiSize.x * (-100.0/100))-66;
                yOffset = int(guiSize.y * (100.0/100))-22;
                layer = -1.0E-4;
                break;
            case 243:
                xOffset = int(guiSize.x * (-100.0/100))+20;
                yOffset = int(guiSize.y * (100.0/100))-40;
                layer = -4.0E-4;
                break;
            case 244:
                xOffset = int(guiSize.x * (-100.0/100))-80;
                yOffset = int(guiSize.y * (100.0/100))-42;
                layer = -3.0000000000000003E-4;
                outlined = true;
                break;
            case 245:
                xOffset = int(guiSize.x * (-100.0/100))-80;
                yOffset = int(guiSize.y * (100.0/100))-39;
                layer = -3.0000000000000003E-4;
                outlined = true;
                break;
            case 246:
                xOffset = int(guiSize.x * (-100.0/100))-60;
                yOffset = int(guiSize.y * (100.0/100))-42;
                layer = -2.0E-4;
                outlined = true;
                break;
            case 247:
                xOffset = int(guiSize.x * (-100.0/100))-60;
                yOffset = int(guiSize.y * (100.0/100))-39;
                layer = -2.0E-4;
                outlined = true;
                break;
            case 248:
                xOffset = int(guiSize.x * (-100.0/100))-66;
                yOffset = int(guiSize.y * (100.0/100))-42;
                layer = -1.0E-4;
                break;
            case 249:
                xOffset = int(guiSize.x * (-100.0/100))+20;
                yOffset = int(guiSize.y * (100.0/100))-60;
                layer = -4.0E-4;
                break;
            case 250:
                xOffset = int(guiSize.x * (-100.0/100))-80;
                yOffset = int(guiSize.y * (100.0/100))-62;
                layer = -3.0000000000000003E-4;
                outlined = true;
                break;
            case 251:
                xOffset = int(guiSize.x * (-100.0/100))-80;
                yOffset = int(guiSize.y * (100.0/100))-59;
                layer = -3.0000000000000003E-4;
                outlined = true;
                break;
            case 252:
                xOffset = int(guiSize.x * (-100.0/100))-60;
                yOffset = int(guiSize.y * (100.0/100))-62;
                layer = -2.0E-4;
                outlined = true;
                break;
            case 253:
                xOffset = int(guiSize.x * (-100.0/100))-60;
                yOffset = int(guiSize.y * (100.0/100))-59;
                layer = -2.0E-4;
                outlined = true;
                break;
            case 254:
                xOffset = int(guiSize.x * (-100.0/100))-66;
                yOffset = int(guiSize.y * (100.0/100))-62;
                layer = -1.0E-4;
                break;
            case 255:
                xOffset = int(guiSize.x * (-100.0/100))+20;
                yOffset = int(guiSize.y * (100.0/100))-80;
                layer = -4.0E-4;
                break;
            case 256:
                xOffset = int(guiSize.x * (-100.0/100))-80;
                yOffset = int(guiSize.y * (100.0/100))-82;
                layer = -3.0000000000000003E-4;
                outlined = true;
                break;
            case 257:
                xOffset = int(guiSize.x * (-100.0/100))-80;
                yOffset = int(guiSize.y * (100.0/100))-79;
                layer = -3.0000000000000003E-4;
                outlined = true;
                break;
            case 258:
                xOffset = int(guiSize.x * (-100.0/100))-60;
                yOffset = int(guiSize.y * (100.0/100))-82;
                layer = -2.0E-4;
                outlined = true;
                break;
            case 259:
                xOffset = int(guiSize.x * (-100.0/100))-60;
                yOffset = int(guiSize.y * (100.0/100))-79;
                layer = -2.0E-4;
                outlined = true;
                break;
            case 260:
                xOffset = int(guiSize.x * (-100.0/100))-66;
                yOffset = int(guiSize.y * (100.0/100))-82;
                layer = -1.0E-4;
                break;
            case 261:
                xOffset = int(guiSize.x * (-100.0/100))+20;
                yOffset = int(guiSize.y * (100.0/100))-100;
                layer = -4.0E-4;
                break;
            case 262:
                xOffset = int(guiSize.x * (-100.0/100))-80;
                yOffset = int(guiSize.y * (100.0/100))-102;
                layer = -3.0000000000000003E-4;
                outlined = true;
                break;
            case 263:
                xOffset = int(guiSize.x * (-100.0/100))-80;
                yOffset = int(guiSize.y * (100.0/100))-99;
                layer = -3.0000000000000003E-4;
                outlined = true;
                break;
            case 264:
                xOffset = int(guiSize.x * (-100.0/100))-60;
                yOffset = int(guiSize.y * (100.0/100))-102;
                layer = -2.0E-4;
                outlined = true;
                break;
            case 265:
                xOffset = int(guiSize.x * (-100.0/100))-60;
                yOffset = int(guiSize.y * (100.0/100))-99;
                layer = -2.0E-4;
                outlined = true;
                break;
            case 266:
                xOffset = int(guiSize.x * (-100.0/100))-66;
                yOffset = int(guiSize.y * (100.0/100))-102;
                layer = -1.0E-4;
                break;
        }

        // -90.0 is required for forge comp
        if ((Position.z != 0.0 && Position.z != -90.0) || outlined) {
            pos.y -= (id*1000) + 500 + HH_OFFSET;
            pos.x -= (guiSize.x * 0.5);

            pos.x *= scale.x;
            pos.y *= scale.y;

            pos.y += guiSize.y;
            // force align guiScale 3
            if (guiScale == 3) {
                pos.x += 1.45;
            }

            pos -= vec3(xOffset, yOffset, 0.0);
            pos.z += layer;
        }
    } 	

    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1);
}
