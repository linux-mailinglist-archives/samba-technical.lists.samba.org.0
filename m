Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD8A19FA3
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jan 2025 09:12:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=faPliIpsxavpB7VKFom/m4Pgh/uYa3hbQRnDOhH95F0=; b=56c7OghbQgNxHz2oavNQ13z2PM
	ziRAWf27Sw1A7eOqXBT5+r4sB8velU0M9PBeyOMHnndIAntwZ7Ir65tdPNe3f7/umqFPuDdGLGPaY
	Pvkb9oj/fljC7fwfl3rQyGBuxfJZBqm0p3l0Ly9GrAq25rYkQgcXUpq9J/Qdpbl9CB1gGN1HRL7+U
	UMlzrVlenVt3MsQNBZJ82ygLVQO6C2rsxuLqAja8xLhSXN0d1qpLZ/e/CJcGCFJvCBt+6qnOGZRyZ
	tu/T7NXwukpTS8qLKbEfj/zcm205ZNc0sXR1LpI/IxEzHGlLi7mfEO7+apEIF8PPvGBVrEU4Wa83/
	KiD/MruQ==;
Received: from ip6-localhost ([::1]:58326 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tasJd-009IaI-K7; Thu, 23 Jan 2025 08:11:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46978) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tasJY-009Ia9-HM
 for samba-technical@lists.samba.org; Thu, 23 Jan 2025 08:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=faPliIpsxavpB7VKFom/m4Pgh/uYa3hbQRnDOhH95F0=; b=c+7/VrdNZyF8sBtnuTx2/UJSGv
 oDZ+PLpu45wjBJ6LyW46GTOeeGdOb5x916dXLwpFRgR2tWq7+zxMEt1Awo/PY+cO0GLlc4UHAgm7T
 6KjdBB0pvV6PzAfdveQCa0T5ZoN+IbUbPpr/OIqJ7yA+EAKHw45pQSE6gUsetfni7RhqcW2rB1ME1
 qrj/BAaszSnFfcw2LavMlwok2IiX7yjR3b3/iW7HGLNhPERkmKaZ5pHqA4b9uLHqewRzaZRLiHRk4
 /fhFWBcUXTpEmGWlisY193wv80tKvOHUzbZrf5cifyUvWZcmzYL3TlMW4/aIWn3EvULZy6UbETNPW
 7yZm05EgOBFRvrMmxn328NkjANuvchJJZZJT7or0J4l0gGqlBUaF+DBVBQA/vjNyyxIMSGB2QAmVG
 JcSR0PoOrV/4t1yxfPtj47WMc2Pe5qg7g0Cq//bAKBqXtuPobHcjSrHR+uLLLceeJ+UUQJ+xnV1jE
 V9kV+v4usLvLYVn0lnf991BP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tasJX-001bhd-0q; Thu, 23 Jan 2025 08:11:47 +0000
To: Alexander Bokovoy <ab@samba.org>, Steve French <smfrench@gmail.com>
Subject: Re: Local KDC and Samba
Date: Thu, 23 Jan 2025 09:11:45 +0100
Message-ID: <4952102.OV4Wx5bFTl@magrathea>
In-Reply-To: <CAH2r5mvPQu8B05pbgnAqjdyFNO48pAgZAeYtXKWhvz2g+WjR2w@mail.gmail.com>
References: <CAH2r5mvZkLmkmR+faL2gepGkhMg1tGgW1wt+tFr9NvW2ihK+3Q@mail.gmail.com>
 <Z5CbjKR8Fl5dgx6e@toolbox>
 <CAH2r5mvPQu8B05pbgnAqjdyFNO48pAgZAeYtXKWhvz2g+WjR2w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 23 January 2025 04:14:13 CET Steve French wrote:
> > There is incomplete SELinux policy yet. Please run in permissive for
> > time being, we need to fix the policy.
>=20
> Disabling selinux did help and fixed the localkdc-setup setup
>=20
> The last step of his instructions says to do kinit, but kinit is not
> installed in his image,
> or as a dependency of "dnf install localkdc" so I had to reboot the
> workstation and
> then do "dnf install krb5-workstation" (hopefully doesn't need a
> special version of kinit?!)

If you use the copr repo it is:

root@krikkit:~# rpm -q krb5-workstation
krb5-workstation-1.21.3-121.fc41.x86_64
root@krikkit:~# rpm -q krb5-server
krb5-server-1.21.3-121.fc41.x86_64

> After rebooting the localkdc was not available so couldn't do kinit.  How=
 do
> you restart it?   What I tried is below:
>=20
> root@fedora:/home/smfrench# systemctl start localkdc
> Job for localkdc.service failed because the control process exited
> with error code.
> See "systemctl status localkdc.service" and "journalctl -xeu
> localkdc.service" for details.
> root@fedora:/home/smfrench# systemctl status localkdc.service
> =C3=97 localkdc.service - Local Kerberos KDC
>      Loaded: loaded (/usr/lib/systemd/system/localkdc.service; static)
>     Drop-In: /usr/lib/systemd/system/service.d
>              =E2=94=94=E2=94=8010-timeout-abort.conf, 50-keep-warm.conf
>      Active: failed (Result: exit-code) since Wed 2025-01-22 19:09:26
> PST; 13s ago
>  Invocation: 1996ca595fe74329882d55bc94779265
> TriggeredBy: =E2=97=8F localkdc.socket
>     Process: 5066 ExecStart=3D/usr/sbin/krb5kdc -P /run/localkdc/kdc.pid
> -w 1 (code=3Dexited, status=3D1/FAILURE)
>    Mem peak: 9.3M
>         CPU: 23ms

This should do it.

> Jan 22 19:09:26 fedora.local systemd[1]: Starting localkdc.service -
> Local Kerberos KDC...
> Jan 22 19:09:26 fedora.local krb5kdc[5066]: krb5kdc: cannot initialize
> realm FEDORA.LOCALKDC.SITE - see log file >
> Jan 22 19:09:26 fedora.local systemd[1]: localkdc.service: Control
> process exited, code=3Dexited, status=3D1/FAILURE
> Jan 22 19:09:26 fedora.local systemd[1]: localkdc.service: Failed with
> result 'exit-code'.
> Jan 22 19:09:26 fedora.local systemd[1]: Failed to start
> localkdc.service - Local Kerberos KDC.
> root@fedora:/home/smfrench# exit
> exit

What is in the kdc log (/var/log/localkdc.log)?
=20
>=20
> smfrench@fedora:~$ kinit asn@SAMBAKDC.LOCALKDC.SITE
> kinit: Cannot find KDC for realm "SAMBAKDC.LOCALKDC.SITE" while
> getting initial credentials

Well, your machine is named fedora, so your realm is: FEDORA.LOCALKDC.SITE!

You've created a user named asn with localkdc-kadmin? I guess you want a lo=
cal=20
user sfrench and a then add a principal:

root@sambakdc:~# localkdc-kadmin=20
Authenticating as principal [root/admin@FEDORA.LOCALKDC.SITE](mailto:root/
admin@FEDORA.LOCALKDC.SITE) with password.
kadmin.local:  add_principal sfrench

quit

systemctl restart localkdc.service

then you can do: kinit sfrench@FEDORA.LOCALKDC.SITE
=20


	Andreas

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



