//fs.shader
//fs.shader
#version 460

in vec3 position_eye, normal_eye;
uniform mat4 view_mat_shader;

in vec4 fragment_color;
out vec4 out_color;

// Các biến uniform để bật/tắt từng nguồn sáng
uniform bool enable_light_1; // Bật/tắt nguồn sáng 1
uniform bool enable_light_2; // Bật/tắt nguồn sáng 2

void main() {
    vec3 final_color = vec3(0);

    //-----------Nguồn sáng 1-------------
    if (enable_light_1) {
        vec3 light_position_world_1 = vec3(0.0, 2.27, -3.0);
        vec3 light_position_eye_1 = vec3(view_mat_shader * vec4(light_position_world_1, 1.0));
        vec3 position_viewer = vec3(0.0, 0.0, 0.0);
        vec3 n_eye = normalize(normal_eye);

        vec3 distance_to_light_eye_1 = light_position_eye_1 - position_eye;
        vec3 direction_to_light_eye_1 = normalize(distance_to_light_eye_1);
        vec3 surface_to_viewer_eye_1 = normalize(position_viewer - position_eye);

        float dot_prod_1 = max(dot(direction_to_light_eye_1, n_eye), 0.0);
        vec3 Ld_1 = vec3(0.7, 0.7, 0.7);
        vec3 Kd_1 = vec3(1.0, 1.0, 1.0);
        vec3 Id_1 = Ld_1 * Kd_1 * dot_prod_1;

        vec3 half_way_eye_1 = normalize(surface_to_viewer_eye_1 + direction_to_light_eye_1);
        float dot_prod_specular_1 = max(dot(half_way_eye_1, n_eye), 0.0);
        float specular_factor_1 = pow(dot_prod_specular_1, 20.0);
        vec3 Ls_1 = vec3(0.2, 0.2, 0.2);
        vec3 Ks_1 = vec3(1.0, 1.0, 1.0);
        vec3 Is_1 = Ls_1 * Ks_1 * specular_factor_1;

        vec3 La_1 = vec3(0.2, 0.2, 0.2);
        vec3 Ka_1 = vec3(1.0, 1.0, 1.0);
        vec3 Ia_1 = La_1 * Ka_1;

        final_color += (Is_1 + Id_1 + Ia_1);
    }
    else{
        vec3 light_position_world_1 = vec3(0.0, 2.27, 1.0);
        vec3 light_position_eye_1 = vec3(view_mat_shader * vec4(light_position_world_1, 1.0));
        vec3 position_viewer = vec3(0.0, 0.0, 0.0);
        vec3 n_eye = normalize(normal_eye);

        vec3 distance_to_light_eye_1 = light_position_eye_1 - position_eye;
        vec3 direction_to_light_eye_1 = normalize(distance_to_light_eye_1);
        vec3 surface_to_viewer_eye_1 = normalize(position_viewer - position_eye);

        float dot_prod_1 = max(dot(direction_to_light_eye_1, n_eye), 0.0);
        vec3 Ld_1 = vec3(0,0,0);
        vec3 Kd_1 = vec3(0,0,0);
        vec3 Id_1 = Ld_1 * Kd_1 * dot_prod_1;

        vec3 half_way_eye_1 = normalize(surface_to_viewer_eye_1 + direction_to_light_eye_1);
        float dot_prod_specular_1 = max(dot(half_way_eye_1, n_eye), 0.0);
        float specular_factor_1 = pow(dot_prod_specular_1, 20.0);
        vec3 Ls_1 = vec3(0,0,0);
        vec3 Ks_1 = vec3(0,0,0);
        vec3 Is_1 = Ls_1 * Ks_1 * specular_factor_1;

        vec3 La_1 = vec3(0,0,0);
        vec3 Ka_1 = vec3(0,0,0);
        vec3 Ia_1 = La_1 * Ka_1;

        
        final_color += (Is_1 + Id_1 + Ia_1);}

    //-----------Nguồn sáng 2-------------
    if (enable_light_2) {
        vec3 light_position_world_2 = vec3(2.0, 15.0, 2.0);
        vec3 light_position_eye_2 = vec3(view_mat_shader * vec4(light_position_world_2, 1.0));
        vec3 position_viewer = vec3(0.0, 0.0, 0.0);
        vec3 n_eye = normalize(normal_eye);

        vec3 distance_to_light_eye_2 = light_position_eye_2 - position_eye;
        vec3 direction_to_light_eye_2 = normalize(distance_to_light_eye_2);
        vec3 surface_to_viewer_eye_2 = normalize(position_viewer - position_eye);

        float dot_prod_2 = max(dot(direction_to_light_eye_2, n_eye), 0.0);
        vec3 Ld_2 = vec3(0.7, 0.7, 0.7);
        vec3 Kd_2 = vec3(1, 0.5, 0);
        vec3 Id_2 = Ld_2 * Kd_2 * dot_prod_2;

        vec3 half_way_eye_2 = normalize(surface_to_viewer_eye_2 + direction_to_light_eye_2);
        float dot_prod_specular_2 = max(dot(half_way_eye_2, n_eye), 0.0);
        float specular_factor_2 = pow(dot_prod_specular_2, 50.0);
        vec3 Ls_2 = vec3(0.8, 0.8, 1.0);
        vec3 Ks_2 = vec3(0.7, 0.7, 0.7);
        vec3 Is_2 = Ls_2 * Ks_2 * specular_factor_2;

        vec3 La_2 = vec3(0.1, 0.1, 0.3);
        vec3 Ka_2 = vec3(0.5, 0.5, 0.5);
        vec3 Ia_2 = La_2 * Ka_2;

        
        final_color += (Is_2 + Id_2 + Ia_2);
    }else{
        vec3 light_position_world_2 = vec3(2.0, 15.0, 2.0);
        vec3 light_position_eye_2 = vec3(view_mat_shader * vec4(light_position_world_2, 1.0));
        vec3 position_viewer = vec3(0.0, 0.0, 0.0);
        vec3 n_eye = normalize(normal_eye);

        vec3 distance_to_light_eye_2 = light_position_eye_2 - position_eye;
        vec3 direction_to_light_eye_2 = normalize(distance_to_light_eye_2);
        vec3 surface_to_viewer_eye_2 = normalize(position_viewer - position_eye);

        float dot_prod_2 = max(dot(direction_to_light_eye_2, n_eye), 0.0);
        vec3 Ld_2 = vec3(0,0,0);
        vec3 Kd_2 = vec3(0,0,0);
        vec3 Id_2 = Ld_2 * Kd_2 * dot_prod_2;

        vec3 half_way_eye_2 = normalize(surface_to_viewer_eye_2 + direction_to_light_eye_2);
        float dot_prod_specular_2 = max(dot(half_way_eye_2, n_eye), 0.0);
        float specular_factor_2 = pow(dot_prod_specular_2, 50.0);
        vec3 Ls_2 = vec3(0,0,0);
        vec3 Ks_2 = vec3(0,0,0);
        vec3 Is_2 = Ls_2 * Ks_2 * specular_factor_2;

        vec3 La_2 = vec3(0,0,0);
        vec3 Ka_2 = vec3(0,0,0);
        vec3 Ia_2 = La_2 * Ka_2;

        final_color += (Is_2 + Id_2 + Ia_2);}

    // ------------Màu cuối cùng từ các nguồn sáng------------
    out_color = vec4(final_color, 1.0) * fragment_color;
}

/*#version 460

in vec3 position_eye, normal_eye;
uniform mat4 view_mat_shader;

in vec4 fragment_color;
out vec4 out_color;

void main() {
    //-----------chỉ định các vị trí nguồn sáng-------------
    // Nguồn sáng 1
    vec3 light_position_world_1 = vec3(0.0, 2.27, -3);//trong phòng
    vec3 light_position_eye_1 = vec3(view_mat_shader * vec4(light_position_world_1, 1.0));

    // Nguồn sáng 2
    vec3 light_position_world_2 = vec3(2.0, 15.0, 2.0);//mặt trời
    vec3 light_position_eye_2 = vec3(view_mat_shader * vec4(light_position_world_2, 1.0));

    // Vị trí viewer
    vec3 position_viewer = vec3(0.0, 0.0, 0.0);

    // Chuẩn hóa normal_eye
    vec3 n_eye = normalize(normal_eye);

    // --------------Ánh sáng từ nguồn 1---------------------
    vec3 distance_to_light_eye_1 = light_position_eye_1 - position_eye;
    vec3 direction_to_light_eye_1 = normalize(distance_to_light_eye_1);
    vec3 surface_to_viewer_eye_1 = normalize(position_viewer - position_eye);

    float dot_prod_1 = max(dot(direction_to_light_eye_1, n_eye), 0.0);
    vec3 Ld_1 = vec3(0.7, 0.7, 0.7); // Ánh sáng khuếch tán từ nguồn 1
    vec3 Kd_1 = vec3(1.0, 0.5, 0.0); // Hệ số phản xạ khuếch tán từ nguồn 1
    vec3 Id_1 = Ld_1 * Kd_1 * dot_prod_1;

    vec3 half_way_eye_1 = normalize(surface_to_viewer_eye_1 + direction_to_light_eye_1);
    float dot_prod_specular_1 = max(dot(half_way_eye_1, n_eye), 0.0);
    float specular_factor_1 = pow(dot_prod_specular_1, 100.0); // Hệ số sáng bóng từ nguồn 1
    vec3 Ls_1 = vec3(0.2, 0.2, 0.2);
    vec3 Ks_1 = vec3(1.0, 1.0, 1.0);
    vec3 Is_1 = Ls_1 * Ks_1 * specular_factor_1;

    vec3 La_1 = vec3(0.2, 0.2, 0.2);
    vec3 Ka_1 = vec3(1.0, 1.0, 1.0);
    vec3 Ia_1 = La_1 * Ka_1;

    // --------------Ánh sáng từ nguồn 2---------------------
    vec3 distance_to_light_eye_2 = light_position_eye_2 - position_eye;
    vec3 direction_to_light_eye_2 = normalize(distance_to_light_eye_2);
    vec3 surface_to_viewer_eye_2 = normalize(position_viewer - position_eye);

    float dot_prod_2 = max(dot(direction_to_light_eye_2, n_eye), 0.0);
    vec3 Ld_2 = vec3(1.5,1.5,1.5);//vec3 Ld_2 = vec3(0.6, 0.6, 0.8); // Ánh sáng khuếch tán từ nguồn 2
    vec3 Kd_2 = vec3(0.5, 1.0, 0.5); // Hệ số phản xạ khuếch tán từ nguồn 2
    vec3 Id_2 = Ld_2 * Kd_2 * dot_prod_2;

    vec3 half_way_eye_2 = normalize(surface_to_viewer_eye_2 + direction_to_light_eye_2);
    float dot_prod_specular_2 = max(dot(half_way_eye_2, n_eye), 0.0);
    float specular_factor_2 = pow(dot_prod_specular_2, 50.0); // Hệ số sáng bóng từ nguồn 2
    vec3 Ls_2 = vec3(0.8, 0.8, 1.0);
    vec3 Ks_2 = vec3(0.7, 0.7, 0.7);
    vec3 Is_2 = Ls_2 * Ks_2 * specular_factor_2;

    vec3 La_2 = vec3(0.1, 0.1, 0.3);
    vec3 Ka_2 = vec3(0.5, 0.5, 0.5);
    vec3 Ia_2 = La_2 * Ka_2;

    // ------------Màu cuối cùng từ hai nguồn sáng------------
    vec3 final_color = (Is_1 + Id_1 + Ia_1) + (Is_2 + Id_2 + Ia_2);
    out_color = vec4(final_color, 1.0) * fragment_color;
}*/


/*#version 460

in vec3 
	position_eye,
	normal_eye;

uniform mat4 view_mat_shader;

in vec4 fragment_color;
out vec4 out_color; 

void main() {
	
	//-----------chỉ định các vị trí-------------
		// vị trí nguồn sáng trong thế giới
	vec3 light_position_world = vec3(0.0, 2.27, 0.0);
	//vec3 light_position_world = vec3(0.0, 1.0, 0.0);
		// biến đổi vị trí nguồn sáng sang eye space
	vec3 light_position_eye = vec3(view_mat_shader * vec4(light_position_world, 1.0));

		// vị trí viewer
	vec3 postion_viewer = vec3(0.0, 0.0, 0.0);
		
		// chuẩn hóa normal_eye
	vec3 n_eye = normalize(normal_eye);

		// tính vector khoảng cách từ nguồn sáng đến mắt
		// hướng vector hướng từ vertex đến nguồn sáng
		// = vị trí Light - vị trí Vertex
	vec3 distance_to_light_eye = light_position_eye - position_eye;
		// chuẩn hóa vector khoảng cách từ nguồn sáng đến mắt
	vec3 direction_to_light_eye = normalize(distance_to_light_eye);

		// tính vector khoảng cách vị trí viewer và vertex
		// = vị trí viewer - vị trí vertex
	vec3 surface_to_viewer_eye = postion_viewer - position_eye;
		// chuẩn hóa	
	surface_to_viewer_eye = normalize(surface_to_viewer_eye);

	// --------------cường độ ánh sáng khuếch tán-----------------------
		// tính cosin góc giữa vector hướng ánh sáng và vector pháp tuyến: l.n
	float dot_prod = dot(direction_to_light_eye, n_eye);
		// lấy giá trị >=0 để loại bỏ giá trị âm ứng với góc >90 độ
	dot_prod = max(dot_prod, 0.0);

		// cường độ ánh sáng đến
		// màu trắng mờ
	vec3 Ld = vec3(0.7, 0.7, 0.7);
	//vec3 Ld = vec3(1.5, 1.5, 1.5);

		// hệ số phản xạ khuếch tán
		// màu cam
	vec3 Kd = vec3(1.0, 1.0, 1.0);

		// cường độ ánh sáng khuếch tán cuối cùng
	vec3 Id = Ld * Kd * dot_prod;

	// -----------------cường độ ánh sáng phản xạ-------------------
	//vec3 surface_to_viewer_eye = normalize(0.0 - position_eye);

		// tính phản xạ
		// đảo dấu direction_to_light_eye
		// vì đối số thứ 1 của hàm reflect là vector hướng từ nguồn sáng đến vertex
		// mà direction_to_light_eye hiện đang có hướng từ vertex đến nguồn sáng
	vec3 reflection_eye = reflect(-direction_to_light_eye, n_eye);

		// tính cosin góc giữa: v.r
	float dot_prod_specular = dot(surface_to_viewer_eye, reflection_eye);
		// lấy giá trị >=0 để loại bỏ giá trị âm ứng với góc >90 độ
	dot_prod_specular = max(dot_prod_specular, 0.0);

		// hệ số sáng bóng
	float specular_exponent = 100.0;
		// tính mũ với hệ số sáng bóng
	float specular_factor = pow(dot_prod_specular, specular_exponent);

		// ánh sáng phản xạ
		// màu trắng
	vec3 Ls = vec3(1.0, 1.0, 1.0);

		// hệ số phản xạ
		// phản xạ toàn phần, màu trắng
	vec3 Ks = vec3(1.0, 1.0, 1.0);

		// cường độ ánh sáng phản xạ cuối cùng
	vec3 Is = Ls * Ks * specular_factor;

	// --------------cường độ ánh sáng môi trường---------------
		// ánh sáng môi trường
		// màu xám
	vec3 La = vec3(0.2, 0.2, 0.2);

		// hệ số môi trường
		// phản chiếu hoàn toàn
	vec3 Ka = vec3(1.0, 1.0, 1.0);

		// cường độ ánh sáng môi trường cuối cùng
	vec3 Ia = La * Ka;

	// ---------màu cuối cùng------------
	//out_color = fragment_color;
	//out_color = vec4(Is + Id + Ia, 1.0);
	out_color = vec4(Is + Id + Ia, 1.0)* fragment_color;
}*/
