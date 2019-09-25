Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 083C4BDC6E
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 12:54:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=i+CcSkZkIhcBJfFFylLmO2KgrijJU3F2Ylh5KMKLYKk=; b=Dm8By338ZJExGeIZVN8cBEOvSG
	ZZFntmub6dYL01CajoVGqiapa2XPGrROgEP5MWzum+QVdX4J74Zq5ttUOcsoRazHauX0iPx4gITaK
	3dUs7cweuMIbmRKf1CzwMgtmL/SDiYEC/4OLrODiIFQKfsrL7xjfdUt56eI2Z2xlNncUNLRtNlek+
	bVva/oIcOHx2Ui13OIZjxxE0x+0SZB9FeDShLUjsoK12i1qW8ZXgHvzx/Tl+mxcZKS8YPSqe9ho0Z
	yG3NiOi0A60WPhZuQjbWPkdLhK/+zKEUIDC2r9UeyTq7+fHi/anmlY8wAvX4f3Mx64zxlXEGEi9kt
	6C6mlDkA==;
Received: from localhost ([::1]:64140 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iD4vo-008TNt-5w; Wed, 25 Sep 2019 10:54:00 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:44636) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iD4vi-008TN5-PB; Wed, 25 Sep 2019 10:53:57 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id f1so858748ybq.11;
 Wed, 25 Sep 2019 03:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ngzzglm8UPFLgdpB9Otz2inlR7tVP5Qz9mA3BS9sjjM=;
 b=KBkRuzvVbh1w3K04zLnFBa/zQ5LsJ+OxzsJzWgtRPmQNLG2vDj73JUBM+t1kbwbLhu
 4oD7FB7FctpEG/uY+12yvaAlEhmcTS47PeOoaShkRWkPCpEttUwe3IAfOBcUegGVpZOf
 iVq4PY5Q9jyWIPiGTEz9IcXRIHsczYrYpeM1Oy495qZHaxEg7yHArkkQdAunau/n0oY1
 7y9P3z6Py/kUhtvGpPOG/V4n/29LwyJLLIknTF3cUzpIVjcc/4u1creOzdwGvnUj3XK0
 iF5BX9HOA9yegfyXgV4jZyVjIMPVm23wuQVBec5CYMDv50U41HhDjkjUVKWWf5U5U1Bi
 3ocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ngzzglm8UPFLgdpB9Otz2inlR7tVP5Qz9mA3BS9sjjM=;
 b=FT6eordxm+dvmeuMpO+Masj2sAB02bIdsdaM9frKwOzLvHguhyRnBj8gcVWQnMVB2+
 aeY0ED+cQ9XkxdV03H0e82yOJslMSk8Ehc6l87hur2Bs1vIzCqMRWP604xc2ekCDiJBp
 m2lPRpwjDnEvUbgwkOfusJIatMWMztLULpmZpYhMDzznNJpCQ7SRn0iKDJgQaECEJAxo
 Bl7NjhE+/pG9fs4EqFCW+7dHdL7B7O029y87T57D2Dg67PT7r1v7tuLqFt03CtbLVjpV
 26PjZ72/34kEbTFtBsvIlDsz8fD8B3VkbYFTww2pQlM6Uq4SHMpzdtWdtRYS0hnWOyo3
 Xj8w==
X-Gm-Message-State: APjAAAVM5VGtL0EjxFKFzrByfmSMbOvdKmlf2WNqY4vnUY/yYur4U5nX
 bIlrveWh8gPrIN7Fc+6hFJuzuheC6JerFd3t8QBvMg35
X-Google-Smtp-Source: APXvYqwWngk/giwh340+whzhUYMNP8Rym/YAvvlqDjY3l5fBSQu8/H5upbnguJxhSYcNuSBefbFEVJVNSD2+wMijIJs=
X-Received: by 2002:a25:a545:: with SMTP id h63mr2411600ybi.257.1569408831543; 
 Wed, 25 Sep 2019 03:53:51 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 25 Sep 2019 16:24:17 +0530
Message-ID: <CAG+HqKQcLgAw9EFHCqTGkVXEO8FbF3oUjGeOhDEoqS5rRk_YCw@mail.gmail.com>
Subject: In mac guest user is not working when AD connected - samba 4.9.3
To: samba-technical <samba-technical@lists.samba.org>,
 Samba Listing <samba@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: VigneshDhanraj G via samba-technical <samba-technical@lists.samba.org>
Reply-To: VigneshDhanraj G <vigneshdhanraj.g@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Team,

I have configured server signing as mandatory in smb.conf. After
configured, guest user is not working when AD is connected.

In mac while connecting to samba if i give register user as vignesh/guest,
guest user is working. But if I click Guest radio button, guest user is not
working.

Please find the below configuration and log for reference.

[Global]
available= yes
restrict anonymous= 0
server string= Test
Workgroup= GNANA
netbios name= px4-400d
realm= GNANA.COM <http://VIGNESH.COM>
password server= 192.168.1.14, *
idmap backend= tdb
idmap uid= 5000-9999999
idmap gid= 5000-9999999
idmap config GNANA : backend= rid
idmap config GNANA : range= 10000000-19999999
security= ADS
name resolve order= wins host bcast lmhosts
client use spnego= yes
dns proxy= no
winbind use default domain= no
winbind nested groups= yes
inherit acls= yes
winbind enum users= yes
winbind enum groups= yes
winbind separator= \\
winbind cache time= 300
winbind offline logon= true
template shell= /bin/sh
kerberos method= secrets and keytab
map to guest= Bad User
host msdfs= yes
strict allocate= no
encrypt passwords= yes
passdb backend= smbpasswd
printcap name= lpstat
printable= no
load printers= yes
ntlm auth= Yes
server signing= mandatory

log
==
[2019/09/25 15:01:46.694089,  4]
../auth/auth_log.c:580(log_successful_authz_event_human_readable)
  Successful AuthZ: [SMB2,NTLMSSP] user [vignesh]\[Guest]  at [Wed, 25 Sep
2019 15:01:46.694013 PDT] Remote host [ipv4:192.168.1.14:60396] local host
[ipv4:192.168.1.14:445]
[2019/09/25 15:01:46.694437,  5]
../source3/lib/username.c:181(Get_Pwnam_alloc)
  Finding user vignesh\guest
[2019/09/25 15:01:46.694541,  5]
../source3/lib/username.c:120(Get_Pwnam_internals)
  Trying _Get_Pwnam(), username as lowercase is vignesh\guest
[2019/09/25 15:01:46.694639,  5]
../source3/lib/username.c:159(Get_Pwnam_internals)
  Get_Pwnam_internals did find user [vignesh\guest]!
[2019/09/25 15:01:46.694715,  3]
../source3/smbd/password.c:133(register_homes_share)
  Adding homes service for user 'vignesh\guest' using home directory:
'/home/vignesh/guest'
[2019/09/25 15:01:46.695056,  5]
../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for
/tmp/samba/smbXsrv_session_global.tdb
[2019/09/25 15:01:46.695371,  5]
../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for
/tmp/samba/smbXsrv_session_global.tdb
[2019/09/25 15:01:46.695622,  5]
../libcli/smb/smb2_signing.c:93(smb2_signing_sign_pdu)
  signed SMB2 message
[2019/09/25 15:01:47.845994,  0]
../libcli/smb/smb2_signing.c:171(smb2_signing_check_pdu)
  Bad SMB2 signature for message
[2019/09/25 15:01:47.846405,  0] ../lib/util/util.c:514(dump_data)
  [0000] 00 00 00 00 00 00 00 00   00 00 00 00 00 00 00 00   ........
........
[2019/09/25 15:01:47.846921,  0] ../lib/util/util.c:514(dump_data)
[2019/09/25 15:01:47.847455,  3]
../source3/smbd/smb2_server.c:3195(smbd_smb2_request_error_ex)
  smbd_smb2_request_error_ex: smbd_smb2_request_error_ex: idx[1]
status[NT_STATUS_ACCESS_DENIED] || at ../source3/smbd/smb2_server.c:2476
[2019/09/25 15:01:47.847807,  5]
../libcli/smb/smb2_signing.c:93(smb2_signing_sign_pdu)
  signed SMB2 message
[2019/09/25 15:01:47.850773,  0]
../libcli/smb/smb2_signing.c:171(smb2_signing_check_pdu)
  Bad SMB2 signature for message
[2019/09/25 15:01:47.850999,  0] ../lib/util/util.c:514(dump_data)
  [0000] 00 00 00 00 00 00 00 00   00 00 00 00 00 00 00 00   ........
........
[2019/09/25 15:01:47.851345,  0] ../lib/util/util.c:514(dump_data)
[2019/09/25 15:01:47.851726,  3]
../source3/smbd/smb2_server.c:3195(smbd_smb2_request_error_ex)
  smbd_smb2_request_error_ex: smbd_smb2_request_error_ex: idx[1]
status[NT_STATUS_ACCESS_DENIED] || at ../source3/smbd/smb2_server.c:2476

Kindly do the needful.

Thanks,
Vignesh.
