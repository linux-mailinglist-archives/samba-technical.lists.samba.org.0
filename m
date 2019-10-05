Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 793DFCCAB0
	for <lists+samba-technical@lfdr.de>; Sat,  5 Oct 2019 17:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=/wy69H7aXTsT8NrD4Jql44tATGvsxk/ogOk+nKv5r4Q=; b=TLJiVUZGrOLuLwjsZy134bmGl1
	9xJOncGR+Oa0QmdVf6QeRTrPSLLecTqyG98reYJmyUcGhBiIHhDG04Kmo7zNrNgRpK+wzZ/yuQBvI
	LyG7yMrFvA4tC1R7JIyn3qB0rxsIt2RnhyBy7DYuxedSMpsgqDMOeQEn1eVjGrqHxv7mym1C39KE+
	0NcustYqmSwIcKPyANLjXWbSm4fk5k9EYGQhSFQ6MrsuI9aHt067NBT0cFKGI9qED9wpNPu3Tkinr
	JiGoT4KF8y4BpZChOKh/qu1FJDwKzb24oHhrBkJs9C1iAJAyBh1/m45t9Sy0wjMC+tL4HGkdil1wp
	yEVSSHrA==;
Received: from localhost ([::1]:36400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGlZt-001Rem-G6; Sat, 05 Oct 2019 15:02:37 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36010) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGlZp-001Rec-AF
 for samba-technical@lists.samba.org; Sat, 05 Oct 2019 15:02:35 +0000
Received: by mail-wm1-x344.google.com with SMTP id m18so8447857wmc.1
 for <samba-technical@lists.samba.org>; Sat, 05 Oct 2019 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=PTykQANQWkY++naC9Qy6DKoZvYoNPeUIYN2DXErCpaU=;
 b=rRR2Erm91AJxk7ahJfIS6iIHBZ0oQrSyGbGukBGYxf1k8ztZWlNY5+HhLIWf+qNixt
 Kw8MqLAaaXRmmcHbAo8RZjvPqp7uOGrKA2DLZwlb3VVtMpS4RUODCyID73Rjf5uWvPTw
 lCNUOsz9H2b082mscseeyBbBSt+jNBLgYOg34AQWfBlrD1jAi8bBADA+nsOLjtU6Wvtn
 AB9vJ4zUFZO1Pdnv+RjI8/1sMuiinGk19CN5kuew+Ar6Crk3ysZ6onRhiFo5GbCHS/Da
 KaYN/0W2T2W1C8WIFQtietckoQv3dS/IaaO2qfLaQsCaD7XfvAJ3KCa+RDhNcb4R1nYQ
 4lNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PTykQANQWkY++naC9Qy6DKoZvYoNPeUIYN2DXErCpaU=;
 b=B4UN3PEKxvAxfO8EALiJDPttAlE4YzJ29AVZnAscEYrToP51gYo/x/leGlARKW1PPm
 L/eOP0EuEeJDAwMsfGVJBcEz+BDp96zWXonPPMq9IJpM8CLiEEz7fydX363c5TtQZk4c
 tza92PCRtLUU1DaEPV1Ij5frOvu4NRR8qtK6NxczBKVerGuClmyoj5P3K9r3xJgYSlNk
 MYnTWNmE2PF+giMpTPTuLf0oPrrqY6lghXdPZ4NNw8GDzalksEZZcvcRZM+45QyfJ45+
 Br/GDwyP+lZWq9F+gpwSLxBPTZbINW2Re2/eKo56MC8lV3hMxxiWOh0IkTpq++0wBJYj
 bpTg==
X-Gm-Message-State: APjAAAV8ZbImAyks+4wilrzejpLfX6uLvM7ma8arx/TTUgsXfjDXdd9q
 gikk9PNMyLQ5/atCsXkfbE0u8BCsXmaWh3tTpwJxPNXe
X-Google-Smtp-Source: APXvYqw0eOrAcg/rttaP6Rm+cUZav81qVu8IcYgRgUdouiOGCsBg+qGhTIeEJ0XWx4BApFjNBkNjgGuFjiTeVWpUX6w=
X-Received: by 2002:a7b:caaa:: with SMTP id r10mr288841wml.100.1570287752269; 
 Sat, 05 Oct 2019 08:02:32 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 5 Oct 2019 23:02:21 +0800
Message-ID: <CADvhK2uJgKcNsxJwT4eGHV=4pH_qJZm0u_GkFMAwQ87vBsSpMw@mail.gmail.com>
Subject: How to turn on SMB3 POSIX extensions in Samba server?
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
From: Chris Han via samba-technical <samba-technical@lists.samba.org>
Reply-To: Chris Han <chrishan308@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi, I want to use the SMB3 POSIX extensions in the latest Samba (with
SMB3.1.1, vers=3D3.1.1). By following the user manual, I have added the
"posix" mount option when mounting, but it shows the following error
messages.

Error messages:
[xxxxx] CIFS VFS: Server does not support mounting with posix SMB3.11
extensions.
[xxxxx] CIFS VFS: cifs_mount failed w/return code =3D -95

Mount option:
https://www.mankier.com/8/mount.cifs#posix%7Cunix%7Clinux
https://wiki.samba.org/index.php/SMB3-Linux

Mount commands:
mount =E2=80=93t cifs -o username=3D<user>,vers=3D3.1.1,posix //<address>/s=
hare
/mnt/share
mount =E2=80=93t cifs -o username=3D<user>,vers=3D3.1.1,posix,mfsymlinks
//<address>/share /mnt/share

Software and kernel version:
1. Ubuntu 19.04, Kernel 5.0, Samba 4.10
2. Ubuntu 18.04.3, Kernel 5.0, Samba 4.7

Example of using the "vers=3D3.1.1,posix" mount option: (Page 46)
https://www.snia.org/sites/default/files/SDC/2018/presentations/SMB/Steve_F=
rench_SMB311.pdf

How to turn on SMB3 POSIX extensions in Samba server?

Thanks.
