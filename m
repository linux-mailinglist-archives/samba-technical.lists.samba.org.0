Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDAF10757E
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 17:12:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=+XmDb+SdYiP6F5fK30eqBF9S1Stw4yE3H01vLKNFjL8=; b=SY4Gm3yXSUbr2cqitGA3hfkVBc
	9+CpQkxAsJ7ohxOKAsUBgy4kQvmcCKZ/Ca22dVm+JGyVmSBsK9EXnRhBEKaEnFWuZLc3ZUtEvDBn+
	5DYyjXihM+DkmrK9Xt9dSSs6f+eRllMGHOmX8ACjmC5hgm/8AH5WH3u5P6t9xuWQ7x613c7QVvNYa
	QxtWKtVdWmNON1C33gTkOL4IBRS4K9O+OxXg0VSkZj9jGcTfyJd0/do6O+PKu28DUi2xKi/pWapdE
	EpnnzPVuu0ltNgTe5QJxLB44TgSvk+m02KYsmARs7Xaf6CPh6QZyvKzHQwKo5jJ4hSwvOOkZjyZwZ
	TlAT9/OA==;
Received: from localhost ([::1]:41616 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iYBXS-0026mg-Al; Fri, 22 Nov 2019 16:12:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56674) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iYBXK-0026mH-9v; Fri, 22 Nov 2019 16:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=+XmDb+SdYiP6F5fK30eqBF9S1Stw4yE3H01vLKNFjL8=; b=MFVRvi0uh7+C0+O0w5GW9uSRyO
 +As8VAdoke4Gr59ELIPTAMSym2tajHvvPwZV6NDG/ukn3485wBmMC/NQ1dQDpgKKgy/CbuQKehCgo
 Ghwx0ZYcvWlTl5nwOlpMUybkNE2EvVzgpjS4c+iR0s3Iwdw7uxxubHS7e4LRU+VvtigRRL4e5g2AA
 4/uBAnCZM8E+v/cLc6Wwtpkz3tDn26NAJtfUQyixFPc+pIcebzhFW1TvCP/AigyRSeodFSf65kbM5
 A3iOX1T4T2vNbFSeo7vARt5cdD9P7R8cmbTqhD24lwpxi1v/BmpdiYvQuTwtkYbzoGBkqeM+HGbXB
 WUY17HeA+gTrd7S/RQ6woQoloDx/YvQ1WKow6xqr4kHkvhIK4RPQmbGdqNiTRApulXJacv0Zmpva6
 YUMTfQ4uNxb82OuLl2JiYQJ2Tlx5chIGvDiHAd4yvSlR0a01JRrC9qT0rT7FAC/p3zs0e9Vf+Tmgb
 3jHIZdSwi8RayrqPpl/GHJ1B;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iYBXJ-00064x-UH; Fri, 22 Nov 2019 16:11:58 +0000
To: <samba-technical@lists.samba.org>
References: <ce8839fe-733e-7a9f-8e49-f0f57342f85b@openevents.fr>
 <f20d25c7-27e6-cb6f-e516-3b298680f764@openevents.fr>
In-Reply-To: <f20d25c7-27e6-cb6f-e516-3b298680f764@openevents.fr>
Subject: RE: [Samba] Samba4 - Printer Drivers install fails
Date: Fri, 22 Nov 2019 17:11:57 +0100
Message-ID: <A61204F588614AE58D018A1745988FD8@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 11
X-MimeOLE: Produced By Microsoft MimeOLE
Thread-Index: AdWhT5BrqNj/37YcQ0CPNBSe8ocJGQ==
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai guys,=20

Update:=20
I've just tested an upload of this driver with the printer manager in
windows. ( W7-x64 in this case )=20

impxeroxc405=A0=A0=A0 =A0=A0=A0 imprimante Xerox Versalink c405=20
To be exact : VersaLink_C400_5.658.3.0_PCL6_x64=20
https://www.support.xerox.com/support/versalink-c405/file-download/enus.h=
tml
?operatingSystem=3Dwin10x64&fileLanguage=3Den&contentId=3D144414&from=3Dd=
ownloads&vi
ewArchived=3Dfalse
Which are Model 3 drivers as far i can tell. On my now 4.11.2 print =
server,
it also gave an error.=20
Error code in windows : 0x0000023f  Then error, 0x00000578=20

Im Monday in the proces that i must upgrade some of my printer drivers =
due
to a found bug in a kyocera driver.
Which makes a pdf print disapeer .. And not being printed.=20
I'll write notes of the steps i'll do, and i hope we can find fix for =
it.=20

@Samba Devs.=20
i suspect this is something with signed/not signed SMB1/2/3 things.=20

It might be related/looks like:
https://bugzilla.samba.org/show_bug.cgi?id=3D13093=20

In addition to Julien logs below, i found these messages in daemon.log=20

Nov 21 17:08:03 print1 smbd[707]: [2019/11/21 17:08:03.080421,  0]=20
=09
../../source3/printing/nt_printing.c:1462(move_driver_file_to_download_ar=
ea)
Nov 21 17:08:03 print1 smbd[707]:   move_driver_file_to_download_area:
Unable to rename=20
     =
[x64/{004398AB-A497-4700-90FD-59AD7F57D78E}/install_nbomx_xl_noredist]=20
  to [x64/3/Install_NBOMX_XL_NoRedist]: NT_STATUS_OBJECT_NAME_NOT_FOUND

Nov 21 17:08:03 print1 smbd[707]: [2019/11/21 17:08:03.080582,  0]
../../source3/rpc_server/spoolss/srv_spoolss_nt.c:8621(_spoolss_AddPrinte=
rDr
iverEx)
Nov 21 17:08:03 print1 smbd[707]:   _spoolss_AddPrinterDriverEx:
move_driver_to_download_area failed - WERR_APP_INIT_FAILURE

And this links back to :  =
https://bugzilla.samba.org/show_bug.cgi?id=3D13395 =20

Currently, we are unable to upload new drivers with the windows tools.=20
I have not tried the commandline options yet, thats for Monday.=20

So if one has ideas, of patches to test, let me know i'll test them.=20

I also notice that MS had a "Point and Print Compatible driver" changes,
maybe this interfere..=20

The print server settings im using for completeness..

Normal Samba Member, backend AD.=20
SePrivileges checked and set.=20
verified with :
https://wiki.samba.org/index.php/Setting_up_Automatic_Printer_Driver_Down=
loa
ds_for_Windows_Clients=20

##### PRINT SERVER PART #######
    #enable asu support =3D yes

    ## Enabling spoolssd
    rpc_server:spoolss =3D external
    rpc_daemon:spoolssd =3D fork
    spoolss:architecture =3D Windows x64
    spoolssd:prefork_min_children =3D 5           # Minimum number of =
child
processes
    spoolssd:prefork_max_children =3D 25          # Maximum number of =
child
processes
    spoolssd:prefork_spawn_rate =3D 5             # Start (fork) x new =
childs
if one connection comes in (up to prefork_max_children)
    spoolssd:prefork_max_allowed_clients =3D 100  # Number of clients, a =
child
process should be responsible for
    spoolssd:prefork_child_min_life =3D 60        # Minimum lifetime of =
a
child process (60 seconds
                                                # is the minimum, even a
lower value has been configured)
    load printers =3D yes

# Windows clients look for this share name as a source of downloadable
# printer drivers
[print$]
   comment =3D Printer Drivers
   path =3D /home/samba/printing/drivers
   acl_xattr:ignore system acl =3D yes
   browseable =3D yes
   writable =3D yes
   guest ok =3D no
# Uncomment to allow remote administration of Windows print drivers.
# You may need to replace 'lpadmin' with the name of the group your
# admin users are members of.
# Please note that you also need to set appropriate Unix permissions
# to the drivers directory for these users to have write rights in it
   write list =3D root, administrator, @"Domain Admins", @lpadmin, =
@"Print
Operators"

[printers]
   comment =3D All Printers
   path =3D /home/samba/printing/spool
   acl_xattr:ignore system acl =3D yes
   browseable =3D yes
   printable =3D yes
   printing =3D CUPS



WEEKEND... !  :-)=20

Have a great weekend guys..=20

Greetz,=20

Louis






> -----Oorspronkelijk bericht-----
> Van: samba [mailto:samba-bounces@lists.samba.org] Namens=20
> Julien TEHERY via samba
> Verzonden: vrijdag 22 november 2019 15:15
> Aan: samba@lists.samba.org
> Onderwerp: Re: [Samba] Samba4 - Printer Drivers install fails
>=20
>=20
> > FYI,
> >
> > I finally succeeded too upload one of the 3 drivers that=20
> had problems.
> >
> > I didi it with another user (not=A0 with administrator) which=20
> is member=20
> > of domain admins.
> >
> > I deleted it and tried so many times again to upload it anf=20
> it failed=20
> > with the same error.
> >
> > So we're in a process where sometimes it's working=20
> sometimes not and=20
> > you won't know why.
> >
> >
> > I'm still investigating, upgraded loglevel and saw this :
> >
> >
> > 2019/11/22 14:31:04.146325,=A0 1]=20
> >=20
> ../source3/printing/printer_list.c:234(printer_list_get_last_refresh)
> > =A0 Failed to fetch record!
> > [2019/11/22 14:31:25.108720,=A0 2]=20
> > ../source3/printing/spoolssd.c:459(spoolss_handle_client)
> > =A0 Spoolss preforked child 11201 got client connection!
> > [2019/11/22 14:31:25.112839,=A0 3]=20
> > ../source3/rpc_server/srv_pipe.c:748(api_pipe_bind_req)
> > =A0 api_pipe_bind_req: spoolss -> spoolss rpc service
> > [2019/11/22 14:31:25.112897,=A0 3]=20
> > ../source3/rpc_server/srv_pipe.c:356(check_bind_req)
> > =A0 check_bind_req for spoolss context_id=3D0
> > [2019/11/22 14:31:25.112936,=A0 3]=20
> > ../source3/rpc_server/srv_pipe.c:399(check_bind_req)
> > =A0 check_bind_req: spoolss -> spoolss rpc service
> > [2019/11/22 14:31:25.114898,=A0 3]=20
> > ../source3/rpc_server/srv_pipe.c:1528(api_rpcTNP)
> > =A0 api_rpcTNP: rpc command: SPOOLSS_ADDPRINTERDRIVEREX
> > [2019/11/22 14:31:25.115252,=A0 3]=20
> > ../source3/smbd/vfs.c:113(vfs_init_default)
> > =A0 Initialising default vfs hooks
> > [2019/11/22 14:31:25.115302,=A0 3]=20
> > ../source3/smbd/vfs.c:139(vfs_init_custom)
> > =A0 Initialising custom vfs hooks from [/[Default VFS]/]
> > [2019/11/22 14:31:25.115329,=A0 3]=20
> > ../source3/smbd/vfs.c:139(vfs_init_custom)
> > =A0 Initialising custom vfs hooks from [acl_xattr]
> > [2019/11/22 14:31:25.121499,=A0 3]=20
> > ../lib/util/modules.c:167(load_module_absolute_path)
> > =A0 load_module_absolute_path: Module=20
> > '/usr/lib/x86_64-linux-gnu/samba/vfs/acl_xattr.so' loaded
> > [2019/11/22 14:31:25.121567,=A0 2]=20
> > ../source3/modules/vfs_acl_xattr.c:236(connect_acl_xattr)
> > =A0 connect_acl_xattr: setting 'inherit acls =3D true' 'dos filemode =
=3D=20
> > true' and 'force unknown acl user =3D true' for service print$
> > [2019/11/22 14:31:25.121861,=A0 3]=20
> > ../source3/lib/util.c:313(unix_clean_name)
> > =A0 unix_clean_name [x64/3]
> > [2019/11/22 14:31:25.121920,=A0 2]=20
> > ../source3/smbd/open.c:3987(open_directory)
> > =A0 open_directory: unable to create x64/3. Error was=20
> > NT_STATUS_OBJECT_NAME_COLLISION
> > [2019/11/22 14:31:25.121995,=A0 3]=20
> > ../source3/lib/util.c:313(unix_clean_name)
> > =A0 unix_clean_name [x64/3/DriverInstall_Pre_Vista_1]
> > [2019/11/22 14:31:25.122250,=A0 3]=20
> > ../source3/lib/util.c:313(unix_clean_name)
> > =A0 unix_clean_name=20
> >=20
> [x64/{B764A331-6585-4FE6-8C6E-965E027AC30C}/DriverInstall_Pre_Vista_1]
> > [2019/11/22 14:31:25.122414,=A0 0]=20
> >=20
> ../source3/printing/nt_printing.c:1145(move_driver_file_to_dow
> nload_area)
> > =A0 move_driver_file_to_download_area: Unable to rename=20
> >=20
> [x64/{B764A331-6585-4FE6-8C6E-965E027AC30C}/driverinstall_pre_
> vista_1]=20
> > to [x64/3/DriverInstall_Pre_Vista_1]:=20
> NT_STATUS_OBJECT_NAME_NOT_FOUND
> > [2019/11/22 14:31:25.124344,=A0 0]=20
> >=20
> ../source3/rpc_server/spoolss/srv_spoolss_nt.c:8612(_spoolss_A
> ddPrinterDriverEx)
> > =A0 _spoolss_AddPrinterDriverEx: move_driver_to_download_area=20
> failed -=20
> > WERR_ACCESS_DENIED
> > [2019/11/22 14:31:25.126246,=A0 2]=20
> > ../source3/rpc_server/rpc_server.c:534(named_pipe_packet_process)
> > =A0 Fatal error(NT_STATUS_CONNECTION_DISCONNECTED). Terminating=20
> > client(172.17.172.10) connection!
> >
> >
> >
> > It seems that it tries to recreate /var/lib/samba/printers/x64/3=20
> > although it allready exists
>=20
> Doing this in CLI via rpclient does exactly the same thing:
>=20
>=20
>=20
> rpcclient $>=A0 adddriver "Windows x64"=20
> xrxC8030:cupsdrvr.dll:xrxC8030.ppd:cupsui.dll:cups.hlp:NULL:RAW:NULL"
> result was WERR_ACCESS_DENIED
>=20
>=20
> =3D=3D> log.spoolssd.9 <=3D=3D
> [2019/11/22 15:00:55.917157,=A0 3]=20
> ../source3/rpc_server/srv_pipe.c:1528(api_rpcTNP)
>  =A0 api_rpcTNP: rpc command: SPOOLSS_ADDPRINTERDRIVER
> [2019/11/22 15:00:55.917634,=A0 3]=20
> ../source3/smbd/vfs.c:113(vfs_init_default)
>  =A0 Initialising default vfs hooks
> [2019/11/22 15:00:55.917776,=A0 3]=20
> ../source3/smbd/vfs.c:139(vfs_init_custom)
>  =A0 Initialising custom vfs hooks from [/[Default VFS]/]
> [2019/11/22 15:00:55.917960,=A0 3]=20
> ../source3/smbd/vfs.c:139(vfs_init_custom)
>  =A0 Initialising custom vfs hooks from [acl_xattr]
> [2019/11/22 15:00:55.918310,=A0 2]=20
> ../source3/modules/vfs_acl_xattr.c:236(connect_acl_xattr)
>  =A0 connect_acl_xattr: setting 'inherit acls =3D true' 'dos filemode =
=3D=20
> true' and 'force unknown acl user =3D true' for service print$
> [2019/11/22 15:00:55.918743,=A0 3]=20
> ../source3/lib/util.c:313(unix_clean_name)
>  =A0 unix_clean_name [x64/3]
> [2019/11/22 15:00:55.918971,=A0 2]=20
> ../source3/smbd/open.c:3987(open_directory)
>  =A0 open_directory: unable to create x64/3. Error was=20
> NT_STATUS_OBJECT_NAME_COLLISION
> [2019/11/22 15:00:55.919133,=A0 3]=20
> ../source3/lib/util.c:313(unix_clean_name)
>  =A0 unix_clean_name [x64/3/cupsdrvr.dll]
> [2019/11/22 15:00:55.919462,=A0 3]=20
> ../source3/lib/util.c:313(unix_clean_name)
>  =A0 unix_clean_name [x64/cupsdrvr.dll]
> [2019/11/22 15:00:55.919717,=A0 0]=20
> ../source3/printing/nt_printing.c:1145(move_driver_file_to_dow
> nload_area)
>  =A0 move_driver_file_to_download_area: Unable to rename=20
> [x64/cupsdrvr.dll] to [x64/3/cupsdrvr.dll]:=20
> NT_STATUS_OBJECT_NAME_NOT_FOUND
> [2019/11/22 15:00:55.920019,=A0 0]=20
> ../source3/rpc_server/spoolss/srv_spoolss_nt.c:8612(_spoolss_A
> ddPrinterDriverEx)
>  =A0 _spoolss_AddPrinterDriverEx: move_driver_to_download_area failed =
-=20
> WERR_ACCESS_DENIED
>=20
>=20
> It seems you allready=A0 had exactly this problem:=20
> https://lists.samba.org/archive/samba/2019-April/222366.html
>=20
> I thought it would be possible to do it direclyt from CLI/rpcclient
>=20
> Do you know if there is any other way to make those drivers=20
> work even if=20
> we can't upload them through MMC ?
>=20
>=20
>=20
> --=20
> To unsubscribe from this list go to the following URL and read the
> instructions:  https://lists.samba.org/mailman/options/samba
>=20
>=20


