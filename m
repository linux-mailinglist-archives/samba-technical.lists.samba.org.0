Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D84298D10
	for <lists+samba-technical@lfdr.de>; Mon, 26 Oct 2020 13:48:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=aUPNFY8uOHmD/g6R2SCeB9YGc0R2CRsLZEP9ttpVw/g=; b=F/5PPdlIruMfpdXOguJ4qjl0xx
	YhQhqvd+gix0ZJFus5h/UjAXMh21fJXhSsjKDVd0Vw8dJqdqF9YW/t4+wxujoUYa+VEJNE2QB4fh1
	5RROmnazayWt8KN1lWOJ3r1bLPe3KtjH8zP9gCzXdDWE5UH1eK9X13CL/WDQwsEaxzQrBp61K6QQQ
	mrokGWs7qJsv6Q4sYX74oJmCXIWUzk3bbXaMlCv7CKUGC/YONNd5F0uwXqNpFT+9DnY/ha6oThJQy
	9un2K7+8HwsQZcJV8j4mgggYCNRSf8qEaLfZ996Yp7InLrz3xKMzqriFsu5sctwyZigud2E0BdJ57
	1eA8zNEw==;
Received: from ip6-localhost ([::1]:22386 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kX1uC-00DmXt-7U; Mon, 26 Oct 2020 12:47:20 +0000
Received: from a50-60.smtp-out.eu-west-1.amazonses.com ([54.240.50.60]:33089) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1kX1u8-00DmXm-0d
 for samba-technical@lists.samba.org; Mon, 26 Oct 2020 12:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gtiefq4aqa7w67wwqysvtccq4xrjnbj5; d=aaton.com; t=1603716431;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
 bh=aUPNFY8uOHmD/g6R2SCeB9YGc0R2CRsLZEP9ttpVw/g=;
 b=BDqucqqwSGnigf5KFJVhuiA5F1LnXitQfMeNZr2bFRRlwZrZcJ+sV5BvaaMezVOY
 dPD/0gthjKajB5tmmgRKwDEIyvVrAJBqVhR7WcBwQqDjPPpQYJ7qn+VfebdnGFelCrP
 vqsVWbZR85EMMevw3JVH2IZ0LqZRFkhC5JgGvzu4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=shh3fegwg5fppqsuzphvschd53n6ihuv; d=amazonses.com; t=1603716431;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
 bh=aUPNFY8uOHmD/g6R2SCeB9YGc0R2CRsLZEP9ttpVw/g=;
 b=Rcdz9yqNyupjE0ro+8A0gmCh/25vNCJqGXzLKaIdPxFCcfJNlNWresQe7E5+XFRp
 XkmU39P/YWB7uw4+omE1yKwAxad1WXg18ovVYy9m3F5RVRgExU8rwWEMc8rXAXxDAgD
 ZDT9aerKIktA6ebnZlIfcI+u4ILU19cBbdRbOk/c=
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
To: =?UTF-8?Q?samba-technical=40lists=2Esamba=2Eorg?=
 <samba-technical@lists.samba.org>
Date: Mon, 26 Oct 2020 12:47:11 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200902095042.GA800820@sernet.de>
References: <20200710194428.GA1596727@sernet.de> 
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org> 
 <20200720170142.1583649f@samba.org> 
 <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org> 
 <20200812115841.GD272474@sernet.de> 
 <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org> 
 <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org> 
 <aa86e306-0c2e-763c-bb4c-3ba9fc4a9d52@samba.org> 
 <20200901104311.GB760902@sernet.de> <20200902112132.1f7f4c79@samba.org> 
 <20200902095042.GA800820@sernet.de> 
 <ca9ace0a-c543-afa8-76a1-6c8d09324b95@aaton.com>
X-Mailer: Amazon WorkMail
Thread-Index: =?us-ascii?Q?AQHWVqpif3HTj/q4QJyEdMEypONBfgAAhJJ+AAFO6KoAD4W?=
 =?us-ascii?Q?3aQASESvbAKLPOF4B/xqnfQIQqElXBn1qGaIKM/7EfAo0iXLjCjrcVtcKaJz?=
 =?us-ascii?Q?mrQqYDdYtCpkNMZAVOu8j4Q=3D=3D?=
Thread-Topic: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
X-Wm-Sent-Timestamp: 1603716430
Message-ID: <0102017564f2bdba-e1f4056f-3d82-4a19-80a1-821e5820b7c4-000000@eu-west-1.amazonses.com>
X-SES-Outgoing: 2020.10.26-54.240.50.60
Feedback-ID: 1.eu-west-1.b24dn6frgCi6dh20skzbuMRr7UL8M6Soir/3ogtEjHQ=:AmazonSES
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
From: Nicolas Pinault via samba-technical <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Nicolas_Pinault?= <nicolasp@aaton.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,=0D=0A=0D=0AI tried to cross-compile Samba 4.13.0 today.=0D=0AI got th=
e following error message :=0D=0Avfs_snapper is enabled but prerequisite =
dbus-1 package not found. Use=20=0D=0A--with-shared-modules=3D!vfs_snappe=
r to disable vfs_snapper support.=0D=0A=0D=0AUsing --with-shared-modules=3D=
!vfs_snapper I get "bash: !vfs_snapper:=20=0D=0Aevent not found"=0D=0AUsi=
ng --with-shared-modules=3D'!vfs_snapper' has no effect (same error as=20=
=0D=0Awith no option is output).=0D=0AUsing --disable-snapper I get "waf:=
 error: no such option:=20=0D=0A--disable-snapper"=0D=0A=0D=0AOne workaro=
und I found is to remove lines 1945 and 1946 in source3/wscript :=0D=0A =C2=
=A0=C2=A0=C2=A0 if host_os.rfind('linux') > -1:=0D=0A =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 default_shared_modules.extend(['vfs_snapper'])=0D=0A=
=0D=0ANicolas=0D=0A

