Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9361490BC
	for <lists+samba-technical@lfdr.de>; Fri, 24 Jan 2020 23:12:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=/ceU96q3qGQlNuXBuGpQ+o+zIP4nKm+q0CHAG49ZxSk=; b=4rK7/PGd0up/HZkvjCdGyqJwkH
	cwmKRf/M8qJ68E+3sGMxCz4bXFo1qP6im/8DVuGelsY+E6LaqeK63vK0dwfun7opWaL9dvJyjk4+F
	x4lCC/x5xKpBlFYUebFtDivdRRgSCOdjK6ncx1JiQuZv82UaU8L54SiHsTm5kYKwZRjB44Ew0etLN
	jEuRqcX093V/2kKKhI/YgGHZgBndE2rUMvtWD2aVc6kPPkXNzW4Zjvfzf8KhOsI/38SiXOK3cHtDe
	4l2Tza1xaMf5LX0qZFS+8ArD9w6clFMKkvR3T51wEzQy9j1yqHD60hSSwXsjsC1UZWO7DryFxVgHa
	twAekx8w==;
Received: from localhost ([::1]:58982 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iv7Af-004eYH-SK; Fri, 24 Jan 2020 22:11:21 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:55466) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iv7Ab-004eYA-JN
 for samba-technical@lists.samba.org; Fri, 24 Jan 2020 22:11:20 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id DFD3ED61CB48B;
 Sat, 25 Jan 2020 01:11:13 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zW29zmc9g0WM; Sat, 25 Jan 2020 01:11:13 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 31ECED61CB4AD;
 Sat, 25 Jan 2020 01:11:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 31ECED61CB4AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1579903873;
 bh=/ceU96q3qGQlNuXBuGpQ+o+zIP4nKm+q0CHAG49ZxSk=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=SNPDlksfs8l8OsFMogcMHsnMZjG+ja32UIri4tlnA/Ec3HzBEz4WA6qHx7yYH/L5I
 VnaWlPU4XPrMyszxvj36jgvhcEWnH8J2AXlX5A9wQHWADzsKO2HnKeyss6Rby2RKz4
 QPpuiQhAA47qObB8fNZyjP4+m6Mcq+JCywgweoInflkCRCeQbJopQweDYVBk3903Dy
 M8E5DqHEUdmewiyrmQ8oHhmYsvLBGubUtDoAnZkdcBXYU+uEihNouGdeL0rLZ3/Lzg
 bjVBXMYztS8G2jSw49Mh1QJB5xhDcKWdEQxRhJShQQPs1Zbft4rBdjFRqy0ZSEs0aK
 6vPU+msVDbjNg==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6DNwgaWYEoL8; Sat, 25 Jan 2020 01:11:13 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-71-217.ip.moscow.rt.ru
 [90.154.71.217])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id F3DDFD61CB48B;
 Sat, 25 Jan 2020 01:11:12 +0300 (MSK)
To: samba-technical@lists.samba.org, Pavel Shilovsky <pshilov@microsoft.com>
Subject: [PATH 1/2] cifs-utils: Respect DESTDIR when installing smb3 stuff
Message-ID: <92faad42-2c69-a906-8da9-14a9f6404b83@rosalinux.ru>
Date: Sat, 25 Jan 2020 01:11:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: ru-RU
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

When make install is run during package building, DESTDIR parameter is pa=
ssed, e.g.:
$ rpm --eval %makeinstall_std
make DESTDIR=3D/root/rpmbuild/BUILDROOT/%{name}-%{version}-%{release}-ros=
a2016.1.x86_64-buildroot install

Without DESTDIR build scripts tried to create symlinks outside of the bui=
ld root:
make[3]: Entering directory '/tmp/abf/rpmbuild/BUILD/cifs-utils-6.10'
(cd /sbin && ln -sf mount.cifs mount.smb3)
ln: failed to create symbolic link 'mount.smb3': Permission denied

The same fix was introduced in Arch Linux package when updating from 6.9 =
to 6.10:
https://git.archlinux.org/svntogit/packages.git/commit/trunk/PKGBUILD?h=3D=
packages/cifs-utils&id=3Dc75b246a762ea9b90db404dfebc6d35d5b16972f
---
=C2=A0Makefile.am | 8 ++++----
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index fe9cd34..09ef293 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -119,11 +119,11 @@ endif
=C2=A0SUBDIRS =3D contrib
=C2=A0
=C2=A0install-exec-hook:
-=C2=A0=C2=A0 =C2=A0(cd $(ROOTSBINDIR) && ln -sf mount.cifs mount.smb3)
+=C2=A0=C2=A0 =C2=A0(cd $(DESTDIR)$(ROOTSBINDIR) && ln -sf mount.cifs mou=
nt.smb3)
=C2=A0
=C2=A0install-data-hook:
-=C2=A0=C2=A0 =C2=A0(cd $(man8dir) && ln -sf mount.cifs.8 mount.smb3.8)
+=C2=A0=C2=A0 =C2=A0(cd $(DESTDIR)$(man8dir) && ln -sf mount.cifs.8 mount=
.smb3.8)
=C2=A0
=C2=A0uninstall-hook:
-=C2=A0=C2=A0 =C2=A0(cd $(ROOTSBINDIR) && rm -f $(ROOTSBINDIR)/mount.smb3=
)
-=C2=A0=C2=A0 =C2=A0(cd $(man8dir) && rm -f $(man8dir)/mount.smb3.8)
+=C2=A0=C2=A0 =C2=A0(cd $(DESTDIR)$(ROOTSBINDIR) && rm -f $(ROOTSBINDIR)/=
mount.smb3)
+=C2=A0=C2=A0 =C2=A0(cd $(DESTDIR)$(man8dir) && rm -f $(DESTDIR)$(man8dir=
)/mount.smb3.8)


