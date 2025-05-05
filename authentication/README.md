# Configuración de HTTPS local en Django usando certificado autofirmado

## 🔧 Requisitos previos

- Tener Python y Django instalados.
- Tener el proyecto Django configurado localmente.
- Tener un entorno virtual activado (opcional pero recomendable).

---

## 🧪 Paso a paso para habilitar HTTPS en entorno local

### 1. Instalar dependencias necesarias

Ejecutar:

```bash
pip install django-extensions pyOpenSSL werkzeug
```
---

### 2. Generar un certificado autofirmado

En la raíz del proyecto, ejecutar:

```bash
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
```

Cuando lo solicite:

- **Common Name**: escribir `127.0.0.1`

Esto generará dos archivos: `cert.pem` y `key.pem`.

---

### 3. (Opcional) Convertir el certificado a `.crt` para confiar en él

Para evitar advertencias del navegador, convertir el certificado a `.crt` con:

```bash
openssl x509 -outform der -in cert.pem -out cert.crt
```

Luego:

- En **Windows**, abrir `certmgr.msc`, ir a *Autoridades de certificación raíz de confianza*, hacer clic derecho → *Importar* y seleccionar `cert.crt`.
- Marcar el certificado como **confiable para autenticación de servidor**.

---

### 4. Ejecutar el servidor Django en HTTPS

Desde la raíz del proyecto, ejecutar:

```bash
python manage.py runserver_plus --cert cert.pem --key key.pem
```

Si se desea usar otro puerto (por ejemplo `4443`):

```bash
python manage.py runserver_plus 127.0.0.1:4443 --cert cert.pem --key key.pem
```

---

### 5. Acceder desde el navegador

Abrir:

```
https://127.0.0.1:8000/
```

O si se usó otro puerto:

```
https://127.0.0.1:4443/
```

⚠️ Puede aparecer una advertencia de "sitio no confiable" si no se instaló el certificado. Es seguro continuar si fue generado localmente.

---
