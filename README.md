<p align="center"><a href="https://taufiqalif.github.io" target="_blank"><img src="https://github.com/taufiqalif/Lab8Web/blob/master/img/taufiq.png" width="400"></a></p>

###Table Barang

	CERATE TABLE data_barang (
    		id_barang int(10) auto_increment Primary Key,
    		kategori varchar(30),
    		nama varchar(30),
    		gambar varchar(100),
    		harga_beli decimal(10,0),
    		harga_jual decimal(10,0),
    		stok int(4)
	);

###Table Kategori

	CREATE TABLE kategori (
    		id int auto_increment Primary Key,
    		nama varchar(100)
	);

	ALTER TABLE data_barang add column kategori_id int after kategori;
