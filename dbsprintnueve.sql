PGDMP     ,    *                {            sprintnueve    15.3    15.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16800    sprintnueve    DATABASE     ~   CREATE DATABASE sprintnueve WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE sprintnueve;
                postgres    false            �            1259    16812 	   prioridad    TABLE     �   CREATE TABLE public.prioridad (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(50) NOT NULL
);
    DROP TABLE public.prioridad;
       public         heap    postgres    false            �            1259    16811    prioridad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.prioridad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.prioridad_id_seq;
       public          postgres    false    217                       0    0    prioridad_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.prioridad_id_seq OWNED BY public.prioridad.id;
          public          postgres    false    216            �            1259    16819    tarea    TABLE     �   CREATE TABLE public.tarea (
    id integer NOT NULL,
    titulo character varying(50) NOT NULL,
    prioridad_id integer NOT NULL,
    usuario_id integer NOT NULL,
    completado boolean DEFAULT false NOT NULL
);
    DROP TABLE public.tarea;
       public         heap    postgres    false            �            1259    16818    tarea_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tarea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tarea_id_seq;
       public          postgres    false    219                       0    0    tarea_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tarea_id_seq OWNED BY public.tarea.id;
          public          postgres    false    218            �            1259    16802    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    activo boolean DEFAULT false NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    16801    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public          postgres    false    215                       0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public          postgres    false    214            q           2604    16815    prioridad id    DEFAULT     l   ALTER TABLE ONLY public.prioridad ALTER COLUMN id SET DEFAULT nextval('public.prioridad_id_seq'::regclass);
 ;   ALTER TABLE public.prioridad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            r           2604    16822    tarea id    DEFAULT     d   ALTER TABLE ONLY public.tarea ALTER COLUMN id SET DEFAULT nextval('public.tarea_id_seq'::regclass);
 7   ALTER TABLE public.tarea ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            o           2604    16805 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215                      0    16812 	   prioridad 
   TABLE DATA           <   COPY public.prioridad (id, nombre, descripcion) FROM stdin;
    public          postgres    false    217   !                 0    16819    tarea 
   TABLE DATA           Q   COPY public.tarea (id, titulo, prioridad_id, usuario_id, completado) FROM stdin;
    public          postgres    false    219   {                 0    16802    usuario 
   TABLE DATA           4   COPY public.usuario (id, email, activo) FROM stdin;
    public          postgres    false    215   �                  0    0    prioridad_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.prioridad_id_seq', 3, true);
          public          postgres    false    216                       0    0    tarea_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tarea_id_seq', 18, true);
          public          postgres    false    218                       0    0    usuario_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.usuario_id_seq', 3, true);
          public          postgres    false    214            u           2606    16810    usuario email 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT email UNIQUE (email) INCLUDE (email);
 7   ALTER TABLE ONLY public.usuario DROP CONSTRAINT email;
       public            postgres    false    215            y           2606    16817    prioridad id 
   CONSTRAINT     J   ALTER TABLE ONLY public.prioridad
    ADD CONSTRAINT id PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.prioridad DROP CONSTRAINT id;
       public            postgres    false    217            {           2606    16825    tarea tarea_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tarea DROP CONSTRAINT tarea_pkey;
       public            postgres    false    219            w           2606    16808    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    215            |           2606    16826    tarea prioridad_id    FK CONSTRAINT     z   ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT prioridad_id FOREIGN KEY (prioridad_id) REFERENCES public.prioridad(id);
 <   ALTER TABLE ONLY public.tarea DROP CONSTRAINT prioridad_id;
       public          postgres    false    219    3193    217            }           2606    16831    tarea usuario_id    FK CONSTRAINT     t   ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT usuario_id FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);
 :   ALTER TABLE ONLY public.tarea DROP CONSTRAINT usuario_id;
       public          postgres    false    215    3191    219               J   x�3�t�)I�(��/�LILQHr
�r�J�R���8}SS2�����9����%��b���� �?(         \   x�-���0���� �|&`.�*@��V��1�Q$��R0�@�>7,Gr��G�9�D����':��D�\��Y��ь���
S�~���W         .   x�3�L�H�-�I5t�2���s9Ӹ�`F(%\�0	c4�=... I�     