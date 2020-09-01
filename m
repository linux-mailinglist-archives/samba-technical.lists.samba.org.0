Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A56258F2B
	for <lists+samba-technical@lfdr.de>; Tue,  1 Sep 2020 15:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=mAHU02gD6f8tk3u6vMxJJzpf3JPmM3BtKfl1jYrGWho=; b=PedRNuLFTF1DJoRN6GsdZlixtl
	nLEhlBCd9TEP9j0jNZGZhp1mBut0MYpbHB8WbmKLZWu/1R68GV1x20Pf1ccqoaHdA8Az+d/mxLJIH
	5soglZEqvhyka1s8NlKoYuUSb7vVnRf9tX28Ghuj0c2kx9dvUXON2gp5bGvSkhotCNEpj0tDbqLIm
	vAJRsUtVzwkZVI1iRujEGDK3JlNvBcoesUreyYmOxj2lTi6eqGug94lChjwN/HU9RieuInDMemkEH
	oyoBShUL/jjWSHiGvkiA/+5OQu83odFDyMUsZd5m+3NZO5XmXoer4YG3pAAK4+gGmFdXjxZExNiAa
	hh0F8FpA==;
Received: from localhost ([::1]:52810 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kD6PD-003HOY-0I; Tue, 01 Sep 2020 13:32:59 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37462) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kD6P8-003HOR-5N
 for samba-technical@lists.samba.org; Tue, 01 Sep 2020 13:32:56 +0000
Received: by mail-ej1-x62a.google.com with SMTP id nw23so1681479ejb.4
 for <samba-technical@lists.samba.org>; Tue, 01 Sep 2020 06:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=z0WJzZccnI/wl/BiFuESO3wsPSc46pD4MlI34WK6gQA=;
 b=Ykl8BvsV1dO/5MI3Vpxishd/iY2fy1oDh0AphMaPL6QQpNZqhc2okS1ZriRjvRvYCl
 1fIKB/LuJ3neqMPvXmOc37599WVi+G3kbCdIr98WGHD1sc6asp6k/WBiPRv0doWsjpai
 w5AwDTjd8p9kmRHsUDvtP20AHcxGnDxgM3ohq8C3QqK9n8CJA6qpCmpKlFysFwJzoSiW
 dQdO4n/MHl4n+CGpDc/rckl2oTsOaNMybSUZFXD75Rnax266EhUF4M+TKl/uAay1c+Go
 TijqxSRrgeyiy5Uco1/DvDdeagSLxo04MiXxGsDGsPsLty/8SNRKJQTQiuLCNBR/8qj/
 sIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=z0WJzZccnI/wl/BiFuESO3wsPSc46pD4MlI34WK6gQA=;
 b=AJX061QUjZywsFixxygbzhnWASfdkHkLKLpEuSnr1AN/30xErmhKcQal6inyKs1qaP
 vaWFEnc5PqhmSAKIDe+j87HyVphc6eSGkUFPktXtGpBjHuDmx3FNgggbEQiM/+pnyZ6f
 LcGAjCSEQg2y9H0OuZP2F01kl0u6ffUG/MPtQq4aUMh9mLx95gAQtsEuVSo4LSPWy6oi
 D6ldkY50T73z4SGfLOa1cAwKIjhZEsF57FkeCyRoXqi19zmDUvvSU0b3fYELUU2vixEx
 XNz+WxH3moDKnRgvuM5mHV3q70YWxYmsFTnP1P3FPE1BEWwpFnbGmrLvFzHJSQYx2FAi
 Wzuw==
X-Gm-Message-State: AOAM533LPmwDKXMlhYy2Xcg9xSkKi13Awa77IiHOk4xrCq84SnummMfl
 ajJ+PVyxrEbzyb+DEMSgBI4TUcljGuCwLeLdORmxDJDqP/JyYg==
X-Google-Smtp-Source: ABdhPJz1JRheCGxOsQC0ApUcrm8HYCXzRvcNeZzvAfLzbIXIIJ/f1xQBgegcCEHuGDfgUGGXTM2vFdh4IiNkwRNdLXQ=
X-Received: by 2002:a17:906:9382:: with SMTP id
 l2mr1420736ejx.513.1598967172878; 
 Tue, 01 Sep 2020 06:32:52 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 1 Sep 2020 08:32:47 -0500
Message-ID: <CAKGR0cv=cGT8TMCfpXM81NstOWdUT=eD9PZXYiO7YsNAK619dA@mail.gmail.com>
Subject: Unable to create subdirectories/files in samba mount when using vfs
 objects = glusterfs
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Mahesh Taluru via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mahesh Taluru <mtaluru87@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Team,



I am trying to setup a samba CTDB cluster to export gluster volme as samba
share. While CTDB cluster works well, I ran into an issue with creating
subdirectories and also creating files/directories within subdictories when
accessing the share from both linux  and windows servers.



Setup details :



We have a three node cluster with nodes snode1, snode2 and snode3. I have a
gluster volume named smbshare32 exported as samba share using vfs objects =
=3D
glusterfs (libgfapi).  When I mount the share on linux, I am able to create
files/directories in the root of the mount point i.e under /smbshare32.



[root@sclient1 /]# df -h /smbshare32

Filesystem                      Size  Used Avail Use% Mounted on

//10.4.0.31/gluster-smbshare32  600G  6.1G  594G   2% /smbshare32

[root@sclient1 /]#



[root@sclient1 /]# cd /smbshare32

[root@sclient1 smbshare32]# ls

[root@sclient1 smbshare32]# mkdir subdir1

[root@sclient1 smbshare32]# touch a

[root@sclient1 smbshare32]# ls

*a*  *subdir1*

[root@sclient1 smbshare32]#



When I switch to subdir1, I cannot create files or directories. Same issue
happens on windows , but I get a different error message it says =E2=80=9Ct=
he file
=E2=80=98 =E2=80=98 is too large for the destination file system.



[root@sclient1 smbshare32]# cd subdir1/

[root@sclient1 subdir1]# touch a

touch: setting times of =E2=80=98a=E2=80=99: Invalid argument

[root@sclient1 subdir1]# mkdir subdir2

mkdir: cannot create directory =E2=80=98subdir2=E2=80=99: Invalid argument

[root@sclient1 subdir1]#



Below two scenarios works well:



If I mount the cifs mount on the client using vers 1.0 , I am able to
create files and directories.



//10.4.0.31/gluster-smbshare32 /smbshare32 cifs
vers=3D1.0,credentials=3D/etc/smbclient.passwd     0       0



[root@sclient1 /]# cd /smbshare32

[root@sclient1 smbshare32]# ls

*a*  *subdir1*

[root@sclient1 smbshare32]# cd subdir1/

[root@sclient1 subdir1]# touch a

[root@sclient1 subdir1]# mkdir test2

[root@sclient1 subdir1]#



Also if I mount the gluster volume using fuse and then export the fuse
mount as samba share, I have no issues creating file/directories.   We
would prefer accessing the gluster volume using vfs_glusterfs and also use
the latest SMB protocol version.



Could you please let me know if I missed some configuration.



I have mounted the gluster volume using fuse and set below ACLs as for the
volume.



[root@snode3 /]# getfacl /share

getfacl: Removing leading '/' from absolute path names

# file: share

# owner: smbtest

# group: smbtest

user::rwx

user:smbtest:rwx

group::r-x

group:smbtest:rwx

mask::rwx

other::r-x

default:user::rwx

default:user:smbtest:rwx

default:group::r-x

default:mask::rwx

default:other::r-x



[root@snode3 /]#





Samba config file.



[global]

       workgroup =3D SAMBA

       security =3D user



       passdb backend =3D tdbsam

       printing =3D cups

       printcap name =3D cups

       load printers =3D yes

       cups options =3D raw

    clustering =3D yes

    min protocol =3D NT1



[homes]

       comment =3D Home Directories

       valid users =3D %S, %D%w%S

       browseable =3D No

       read only =3D No

       inherit acls =3D Yes



[printers]

       comment =3D All Printers

       path =3D /var/tmp

       printable =3D Yes

       create mask =3D 0600

       browseable =3D No



[print$]

       comment =3D Printer Drivers

       path =3D /var/lib/samba/drivers

       write list =3D @printadmin root

       force group =3D @printadmin

       create mask =3D 0664

       directory mask =3D 0775



[gluster-smbshare32]

comment =3D For samba share of volume smbshare32

*vfs objects =3D glusterfs*

glusterfs:volume =3D smbshare32

glusterfs:logfile =3D /var/log/samba/glusterfs-smbshare32.%M.log

glusterfs:loglevel =3D 7

path =3D /

read only =3D no

guest ok =3D yes

kernel share modes =3D no



gluster and samba versions.



[root@snode3 /]# rpm -qa|grep -i gluster

*gluster*fs-client-xlators-6.8-1.el7.x86_64

samba-vfs-*gluster*fs-4.10.4-11.el7_8.x86_64

*gluster*fs-6.8-1.el7.x86_64

*gluster*fs-api-6.8-1.el7.x86_64

*gluster*fs-cli-6.8-1.el7.x86_64

*gluster*fs-server-6.8-1.el7.x86_64

python2-*gluster*-6.8-1.el7.x86_64

*gluster*fs-libs-6.8-1.el7.x86_64

*gluster*fs-fuse-6.8-1.el7.x86_64

*gluster*fs-rdma-6.8-1.el7.x86_64

*gluster*fs-extra-xlators-6.8-1.el7.x86_64

[root@snode3 /]# rpm -qa|grep -i samba

*samba*-libs-4.10.4-11.el7_8.x86_64

*samba*-vfs-glusterfs-4.10.4-11.el7_8.x86_64

*samba*-common-4.10.4-11.el7_8.noarch

*samba*-client-libs-4.10.4-11.el7_8.x86_64

*samba*-common-libs-4.10.4-11.el7_8.x86_64

*samba*-4.10.4-11.el7_8.x86_64

*samba*-common-tools-4.10.4-11.el7_8.x86_64

[root@snode3 /]#



Regards



Mahesh Taluru
