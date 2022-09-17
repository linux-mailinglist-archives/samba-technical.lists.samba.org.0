Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DAE5BB695
	for <lists+samba-technical@lfdr.de>; Sat, 17 Sep 2022 07:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=lx8GNlsWwjBlRGCPj1m269oYpMFY3tiSk3tAz0M7nYo=; b=uJp4hgWV+mut8czdwIU0RPVxU2
	RFuOXf45p6CFlNcTGls75RxEKRIpFglUXh+NVA7+CkcNzmp2y8XYTL9Whk6B9EkQ5+8cpoTnruokB
	e4Y32Knz5QMXC8MEsFoUsAdL7/4cHdnCfbfduXSYEpmQeV6O4w6IzLANJJUtPQC2GmenIW2i3o3vK
	QNOPbvglpduhoVMKdWKiZuD+y3mZ7u+D2CO3LV5xZSHp97IHC+ZMjsVxvjWmUYffoCjKK3ov79v/q
	4O94C3WeCzL5NhO17s8fB/fWNNibELGHKcTJBJ+iJTDI+xADPFdr1huTzQQPboLlxdDa3SFU8dask
	PCpUuJJw==;
Received: from ip6-localhost ([::1]:31676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oZQib-0018CC-HU; Sat, 17 Sep 2022 05:50:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36603) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oZQiM-0018C3-27
 for samba-technical@lists.samba.org; Sat, 17 Sep 2022 05:50:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso1105046wma.1
 for <samba-technical@lists.samba.org>; Fri, 16 Sep 2022 22:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:date:message-id:subject:mime-version:from
 :content-transfer-encoding:from:to:cc:subject:date;
 bh=9jSbPXGChm7V7oF3IKeYmt9xVxoqiSmm8v3dhDjp94o=;
 b=hjAaRzQ53yamLmyRh83VnLqZaRgVYzidqfuvDdFvBQNqqTIjYqkZroS8HJtr42yGlF
 7LC+bmqDPGkMh8iGYLhc7wmUggWyjzzWWCurX5yG8yD32gSRC7arPmOYdOIbUNc359rG
 AtoSm7qc3D1KrY8xU49X6P2D5NSc99N3NKXv+pmmEjShhKi8iW41nt5LiCwoNDc4ZKwV
 q3wrKs+eeizIJkGFr0qzrDDvCGVg/VkQN6hgviRYIEMLWMrOe9pNLlK8qCaA8rvhGB4P
 I+uLS+w0tkWsPwtOpz12Gm3VKa4PoNC2XCQs79dgC3Q7c+bLJSbHwmPhAR6TzLEVoNwq
 pfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:date:message-id:subject:mime-version:from
 :content-transfer-encoding:x-gm-message-state:from:to:cc:subject
 :date;
 bh=9jSbPXGChm7V7oF3IKeYmt9xVxoqiSmm8v3dhDjp94o=;
 b=KYBGSmY5EMdmEiKYhuIlh8GRXkY0AZLhGMWhmwsBfdcE42BAEGxieliraTA4tc6o4k
 9kR6kHf0z0IA47MI4fFWX5eLQOdGYU/hDx33TvWmqM1PiBusHRL1oa2MzwPwjPtMllZd
 B5MTx4IMtMvubeZM45cLpDw/+T35Qri+woyyGIuEShBiWCYAYt+pJtll1SchnVWRVTdx
 aUOKgcxFnbH05exwqSLaH2IvIdS4w8miu4avDIU21Z37qqKv+4C5Jz0qj3XqNKN1WmbT
 66Qf97pqnLyeoIxgJ80YlRkuayQbKgohE44Z8E3Zgl7oW4LhC9nVAMgsJUxT/0iSv6u6
 LOXA==
X-Gm-Message-State: ACrzQf0I0zo6DwHwcXIlLjTEPpd6rTf5MvK7y8/zE90qII78qWIh63a+
 kZ8WyYSbLazDQNeMcD4FQG25TdHE1kM=
X-Google-Smtp-Source: AMsMyM7ZH1SfPLnIBP35fwppc/1PcUhM+XDa1H1sJ3xeId9PR+gdZxmydVe2Em1rIvlFJQIqO1hjqg==
X-Received: by 2002:a05:600c:4e0a:b0:3b4:91fe:80e3 with SMTP id
 b10-20020a05600c4e0a00b003b491fe80e3mr5497744wmq.91.1663393799746; 
 Fri, 16 Sep 2022 22:49:59 -0700 (PDT)
Received: from smtpclient.apple (93-44-81-67.ip96.fastwebnet.it. [93.44.81.67])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c1d9a00b003b47ff307e1sm4761439wms.31.2022.09.16.22.49.58
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 22:49:59 -0700 (PDT)
Mime-Version: 1.0 (1.0)
Subject: Samba and ZFS: Snapshot folder appears empty via SMB share but can
 'cd' into subfolders 
Message-Id: <ABADD348-85FA-4817-AA29-A1EDE55792D9@gmail.com>
Date: Sat, 17 Sep 2022 07:49:58 +0200
To: samba-technical@lists.samba.org
X-Mailer: iPhone Mail (19G82)
Content-Type: text/plain;
	charset=utf-8
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
From: Andrea Mencarelli via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrea Mencarelli <andrea3000@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=EF=BB=BF
Hello,

I'm running the latest version of OpenZFS on Linux (Unraid) with Samba 4.15.=
7.

I have encountered a very annoying issue that I can't seem to be able to res=
olve.
I run hourly snapshots on all my datasets in the ZFS pool, and I can see and=
 access them just fine on the server by browsing to the hidden .zfs/snapshot=
 directory, which contains a directory for each snapshot created for that da=
taset.
I have also set snapdir visibility to visible in ZFS.=20

To be able to access the data on the ZFS pool from the client (MacOS) I use a=
 Samba share that is configured like this:
[global]
vfs objects =3D catia fruit streams_xattr
fruit:aapl =3D yes
fruit:model =3D MacSamba
fruit:metadata =3D stream
fruit:resource =3D xattr
fruit:encoding =3D native
fruit:nfs_aces =3D no
fruit:wipe_intentionally_left_blank_rfork =3D yes
fruit:delete_empty_adfiles =3D yes
ea support =3D yes
map archive =3D no
map hidden =3D no
map system =3D no
store dos attributes =3D no

[ShareTest]
path =3D /zfs/test
comment =3D ShareTest
browseable =3D yes
writeable =3D yes
valid users =3D andrea
write list =3D andrea
guest ok =3D no
create mask =3D 0775
directory mask =3D 0775
vfs objects =3D catia fruit streams_xattr
veto files =3D /.DS_Store/
delete veto files =3D yes

When I connect to the Samba share from the MacOS client (but the same happen=
s from Windows) like this:
smb://[IP address of server]/ShareTest

I can cd to the hidden /ShareTest/.zfs directory.=20
Inside there I can list and cd into the snapshot directory.
However, if I do ls -a inside the snapshot directory I don't see any of the s=
napshots folders.=20
andrea@192 snapshot % pwd
/Volumes/ShareTest/.zfs/snapshot
andrea@192 snapshot % ls -a
.	..=20

However, if I try to cd into any of the snapshot folders by starting to type=
 the name of the directory and pressing tab to autocomplete, the auto-comple=
tion shows all the missing folders and I can cd into any of them.
andrea@192 snapshot % cd 2022-0
2022-08-21_18-00/  2022-08-24_08-00/  2022-08-25_20-00/  2022-08-28_15-00/  2=
022-09-03_22-00/  2022-09-09_23-00/  2022-09-11_10-00/
2022-08-23_22-00/  2022-08-24_23-00/  2022-08-25_21-00/  2022-09-03_12-00/  2=
022-09-03_23-00/  2022-09-10_17-00/=20

As far as I know, when something like this happens is because I don't have r=
ead permission on the snapshots directories. This isn't the case this time, t=
hough.

What's even more odd is that if I do the following:
- Try to (unsuccessfully) list the snapshots folders for a given share
- Restart the Samba service with this command: smbcontrol all reload-config
- Try again to reconnect to the share and list the snapshot folders

It almost always shows all the snapshots this time!!
This only applies to that given share (and not the others) and only until I r=
eboot the server or the client.
For example, if I connect to a different share and I try to list the snapsho=
ts, I get an empty list again and I have to restart the Samba service once m=
ore.

Does anybody know what's causing this issue?
=20
