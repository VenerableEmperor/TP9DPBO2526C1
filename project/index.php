<?php
require_once __DIR__ . '/models/TabelKandidat.php';
require_once __DIR__ . '/views/ViewKandidat.php';
require_once __DIR__ . '/presenters/PresenterKandidat.php';

require_once __DIR__ . '/models/TabelLowongan.php';
require_once __DIR__ . '/views/ViewLowongan.php';
require_once __DIR__ . '/presenters/PresenterLowongan.php';

$page = $_GET['page'] ?? 'kandidat';

if ($page === 'lowongan') {
    $model     = new TabelLowongan('localhost', 'mvp_kandidat_db', 'root', '');
    $view      = new ViewLowongan();
    $presenter = new PresenterLowongan($model, $view);

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $action = $_POST['action'] ?? '';

        if ($action === 'tambah') {
            $judulPosisi = trim($_POST['judulPosisi'] ?? '');
            $departemen  = trim($_POST['departemen'] ?? '');
            $tipeKerja   = trim($_POST['tipeKerja'] ?? 'Full-time');
            $kuota       = (int)($_POST['kuota'] ?? 1);
            $status      = trim($_POST['status'] ?? 'Dibuka');

            $presenter->tambahLowongan($judulPosisi, $departemen, $tipeKerja, $kuota, $status);
        } elseif ($action === 'ubah' && isset($_POST['id'])) {
            $id          = (int)$_POST['id'];
            $judulPosisi = trim($_POST['judulPosisi'] ?? '');
            $departemen  = trim($_POST['departemen'] ?? '');
            $tipeKerja   = trim($_POST['tipeKerja'] ?? 'Full-time');
            $kuota       = (int)($_POST['kuota'] ?? 1);
            $status      = trim($_POST['status'] ?? 'Dibuka');

            $presenter->ubahLowongan($id, $judulPosisi, $departemen, $tipeKerja, $kuota, $status);
        } elseif ($action === 'hapus' && isset($_POST['id'])) {
            $id = (int)$_POST['id'];
            $presenter->hapusLowongan($id);
        }

        header("Location: index.php?page=lowongan");
        exit();
    } else {
        $screen = $_GET['screen'] ?? 'list';
        if ($screen === 'add') {
            echo $presenter->tampilkanFormLowongan();
        } elseif ($screen === 'edit' && isset($_GET['id'])) {
            echo $presenter->tampilkanFormLowongan((int)$_GET['id']);
        } else {
            echo $presenter->tampilkanLowongan();
        }
    }
} else {
    $model     = new TabelKandidat('localhost', 'mvp_kandidat_db', 'root', '');
    $view      = new ViewKandidat();
    $presenter = new PresenterKandidat($model, $view);

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $action = $_POST['action'] ?? '';

        if ($action === 'tambah') {
            $nama            = trim($_POST['nama'] ?? '');
            $posisi          = trim($_POST['posisi'] ?? '');
            $domisili        = trim($_POST['domisili'] ?? '');
            $skorTes         = (int)($_POST['skorTes'] ?? 0);
            $pengalamanTahun = (int)($_POST['pengalamanTahun'] ?? 0);

            $presenter->tambahKandidat($nama, $posisi, $domisili, $skorTes, $pengalamanTahun);
        } elseif ($action === 'ubah' && isset($_POST['id'])) {
            $id              = (int)$_POST['id'];
            $nama            = trim($_POST['nama'] ?? '');
            $posisi          = trim($_POST['posisi'] ?? '');
            $domisili        = trim($_POST['domisili'] ?? '');
            $skorTes         = (int)($_POST['skorTes'] ?? 0);
            $pengalamanTahun = (int)($_POST['pengalamanTahun'] ?? 0);

            $presenter->ubahKandidat($id, $nama, $posisi, $domisili, $skorTes, $pengalamanTahun);
        } elseif ($action === 'hapus' && isset($_POST['id'])) {
            $id = (int)$_POST['id'];
            $presenter->hapusKandidat($id);
        }

        header("Location: index.php");
        exit();
    } else {
        $screen = $_GET['screen'] ?? 'list';
        if ($screen === 'add') {
            echo $presenter->tampilkanFormKandidat();
        } elseif ($screen === 'edit' && isset($_GET['id'])) {
            echo $presenter->tampilkanFormKandidat((int)$_GET['id']);
        } else {
            echo $presenter->tampilkanKandidat();
        }
    }
}
?>