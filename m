Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 76608CD969
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2019 00:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=VrRuTJdl+pPqb59QFe1A9rc0TPmJF+powwworVLBDTw=; b=sRwktZTGifo9/ceusMqWF9Wvnc
	XB2JU+SLXMBS/M2ihfytN7dDY0E8KDlIPU/N49RUXeeN8HGCDKZTtxDTFdAOSeSUf3qjrv1MT8JuS
	chZouDiElHU8cR6kyqCnh9Qxqrx6TXsrJW2T1TxzW2jLOPEegP88G1SbMWNbGCoBoPWZr5T1znxt0
	IiYnQPQj5SvYmRggUBMgRkkdHSlqXtqxGh1QM0M6+AViS0sZfNCwbUPxnv6DYeDMlOIB9QDzl1a54
	TApCnrf5LBsYTs9Hxodt6SU2lCaSbES6PobB5hharVcxHhNw3R1KiOyr3KBooukpqzssGvhGRlLWh
	UcEoNxqQ==;
Received: from localhost ([::1]:64156 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHEo8-001fIF-Vt; Sun, 06 Oct 2019 22:15:17 +0000
Received: from [185.16.48.59] (port=55148 helo=smtp.tranquil.it) 
 by hr1.samba.org with esmtp (Exim) id 1iHEo2-001fI7-6c
 for samba-technical@lists.samba.org; Sun, 06 Oct 2019 22:15:12 +0000
Received: from mail.tranquil.it (mail.tranquil.it [185.16.48.58])
 by smtp.tranquil.it (Postfix) with ESMTPS id 3F82540263
 for <samba-technical@lists.samba.org>; Sun,  6 Oct 2019 23:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tranquil.it; s=mail;
 t=1570399185; bh=VrRuTJdl+pPqb59QFe1A9rc0TPmJF+powwworVLBDTw=;
 h=To:From:Subject:Date;
 b=rnOWg8a65neJ1LzewlnXTmQU93nfW4SQIX9oyrzzHIevnCUvn3XGp5L+YI0b2ycAr
 ixztmN12kJp8q3FFpMhq+8RmarEVWqqGdED2cdyEd2R3KOZTwk7UoKFp3qn8M+rhOD
 wNA0MDuFcLECfQ2B2qiCEoBnkxq+bjx4++hTzzWs=
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id 37B98141
 for <samba-technical@lists.samba.org>; Sun,  6 Oct 2019 23:59:49 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AhpCWBhvQMdJ; Sun,  6 Oct 2019 23:59:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id C2F2315B;
 Sun,  6 Oct 2019 23:59:48 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6CQk_4R7kPC9; Sun,  6 Oct 2019 23:59:48 +0200 (CEST)
Received: from srvlts1.ad.tranquil.it (bureau-sdsl.tranquil.it [185.16.50.4])
 by mail.tranquil.it (Postfix) with ESMTPSA id 9779A141;
 Sun,  6 Oct 2019 23:59:48 +0200 (CEST)
To: samba-technical@lists.samba.org
Subject: samba 4.11 rpmbuild on CentOS7
Message-ID: <dcc2c49e-08cd-e077-6506-53020b3ffc58@tranquil.it>
Date: Sun, 6 Oct 2019 23:59:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
From: Denis Cardon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Denis Cardon <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi everyone,

I have given a look tonight at building rpm of Samba 4.11 for=20
CentOS7[1]. The need for gnutls >=3D 3.4.7 makes it quite challenging!

Taking on the work of Sergiomb[2] and Nico Kadel Garcias[3], I compiled=20
nettle and gnutls and then went on building the other stuff (which was=20
more business as usual).

I have a few question about packaging:

* is it ok to use the latest gnutls 3.6.10? It seems the 3.4 serie is=20
not maintained since late 2016. What would be the recommended version?

* I had some library file conflict between stock CentOS7 and custom=20
packages when compiling gnutls-dane, gnutls-guile and gnutls-c++. As=20
there are no dependencies on them, I didn't build support for them ad I=20
guess it was safe to side-step them as far as Samba is concerned.

* EPEL lmdb version is 0.9.22 while upstream is 0.9.24. As I have had=20
some issues with lmdb backend in the last year, I was wondering if=20
testing was done against the latest 0.9.24 or 0.9.22 should be enough?

* when doing some samba-tool command, the logger is configured to be=20
very talkative, like "INFO 2019-10-06 23:46:09,446 pid:23294=20
/usr/lib64/python3.6/site-packages/samba/netcmd/domain.py #453:=20
Administrator password will be set randomly!", and looking at the=20
get_logger() inherited methods or other eventual configuration, I have=20
not found where the talkative pattern is set... (perhaps it is too late=20
and I should go to sleep!).

Cheers,

Denis

[1] https://samba.tranquil.it/centos7/samba-4.11.0/
https://samba.tranquil.it/centos7/samba-4.11.0-srcrpm/
[2] https://github.com/sergiomb2/SambaAD
[3] https://github.com/nkadel/compat-gnutls34-3.x-srpm


--=20
Denis Cardon
Tranquil IT
12 avenue Jules Verne (Bat. A)
44230 Saint S=C3=A9bastien sur Loire (FRANCE)
tel : +33 (0) 240 975 755
http://www.tranquil.it

Tranquil IT recrute! https://www.tranquil.it/nous-rejoindre/
Samba install wiki for Frenchies : https://dev.tranquil.it
WAPT, software deployment made easy : https://wapt.fr

