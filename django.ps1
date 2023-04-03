function change_directory($PATH){
    Set-Location $PATH
}

function create_directory($dir_name) {
    return mkdir $dir_name
}

function pip_install($package){
    return pip install $package

}

function create_django_project($app_name){
    return django-admin startproject $app_name
}

function create_dajngo_app($app){
    return python manage.py startapp $app
}

function run_app(){
    return python manage.py runserver
}

function make_migrations(){
    return python manage.py makemigrations
} 

function migrate(){
   return python manage.py migrate
}

function create_virtual_env($env){
    return python -m venv $env
}

function activate_virtaul_env($env){
    return $env + "/Scripts/activate"
}



$global:env_name; 

Write-Output @"
Choose an options to run the projects:
[1] Create Virtaul Environment.
[2] Acativate Virtual Environment.
[3] Python pacakage Installer (pip).
[4] Create Django Project.
[5] Create Django App.
[6] Make Migrations for your Project.
[7] Migrate the data for your project.
[8] Run your App.
[9] Create  Directory.
[10] Change Directory. 
"@
$options = Read-Host "Choose an options within the range."

switch ($options){
    1 {
        $global:env_name = Read-Host "Enter the name of the virtual environment"
        create_virtual_env($env_name)
    }

    2 {
        $global:env_name = Read-Host "Enter the name of the virtual environment"
        activate_virtaul_env($env_name)
    }
    3 {
        $package_name = Read-Host "Enter the name of your package"
        pip_install($package_name)
    }
    4{
        $project_name = Read-Host "Enter the name of the project"
        create_dajngo_app($project_name)
    }
    5{
        $app_name = Read-Host "Enter the app_name"
        create_dajngo_app($app_name)
    }
    6 {
        make_migrations('')
    }
    7{
        migrate('')
    }
    8{
        run_app('')
    }
    9{
        $dir_name = Read-Host "Name of the new Directory"
        create_directory($dir_name)
    }
    10{
        $path = Read-Host "Enter the path"
        change_directory($path)
    }
    DEFAULT {
        Write-Host "Your are out of options."
    }
}
