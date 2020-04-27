Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6377C1B952E
	for <lists+samba-technical@lfdr.de>; Mon, 27 Apr 2020 04:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6areO0hRZKPHCG/vIEUys65Eg1IGVoIsPcw+jm2s1Eo=; b=DLN7zsduMJsmY9M6oID2L9fgcp
	3QhE4MLQKOIVyk/IF36/fVwVxth/zQVFcIIxZxv91ZDy6qB3i4zU/NbcjVK8gHIL3GfS7kizGai00
	tcoERQyd5dM8PPlDDSS0iQ8QbA2QdTpTyP3BA3szpMN28dmyJH7+wBNkqCYeoUNOdzRZYoT7aHhY9
	wZSvI2jCUtnbLE5isO9fyd89T9mgwa6pmrf9Jy5V0Um0mkk3g9htY9qKEXsPx2PTO5cgtlW4oIkKf
	j/0+9C6DKCrlnom2wYipgdbCHN1cNyu9EAZDPhVyvvlDLAUUYrvcNO8VkyXa9lzUXgGQmXN55YOrP
	5Iw7u2Pw==;
Received: from localhost ([::1]:31134 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jStqJ-0028jm-BL; Mon, 27 Apr 2020 02:49:59 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:36499) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jStqC-0028jf-MN
 for samba-technical@lists.samba.org; Mon, 27 Apr 2020 02:49:55 +0000
Received: by mail-qt1-x844.google.com with SMTP id w29so13177651qtv.3
 for <samba-technical@lists.samba.org>; Sun, 26 Apr 2020 19:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6areO0hRZKPHCG/vIEUys65Eg1IGVoIsPcw+jm2s1Eo=;
 b=C3QNF5GRtCMBC9Mlzcyc0ZPVn65I5g4rtLpBV+Fw5bTSS99nrnEakAyvu9IHv4v3SB
 agUXhz9plbouXJ1p25TCAhkKfrSc2Yf+WTXtE8juiZuYDzyUOfY/VrvFf6gouGusuGJq
 OkG4fNCI+X1sqND0HAfLNDTwZtOGYSOJvvchU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6areO0hRZKPHCG/vIEUys65Eg1IGVoIsPcw+jm2s1Eo=;
 b=W3UsNlj+kb98Lucz3MQZb+pz7Iv20pm2SUeVOBRsiu1ADxLeojtydI+KrY1il2jl3r
 H5Z8sxEzXN57e2J6xAXumUS8tuqZiLN307AlM3iIyPlQuKBONCKiTI8RfU6D5b6oLizQ
 9p7xQVM5IhuaFJ5E6L/36d9iFr42Yv1lENzhLdvwcVpJ70O1TaoUoii8kkpOk9NunpbI
 ruMmVlKP8wbqrlStWGP/j5vJx/zFDmLYtn4M30+XluHI6cYhpexACTigY5UEcFpdYlWs
 3Vfw3c0qsQQTVDbyETIAKlig1+XN0CkkiGBQeXXV8jqAqu0ks8SlNOjKeM7fqNVPdzRd
 f7tw==
X-Gm-Message-State: AGi0Pub7/Q4WuIGp33mYQKLOCv+DB7dfmnUrPoAPOq8W/aBHHLA8jEhh
 IhgBBKzmO10k0urcmm1alL0ljcL/y7R/I4C2TG8GRg==
X-Google-Smtp-Source: APiQypL+Ou0nwruybxOTadtizGm5FwrO38szTf0UC8p0JC54KyEZSynuB0IuOFUBzsoAhdUxu31+0nxRlsmmPLBcgXo=
X-Received: by 2002:ac8:4650:: with SMTP id f16mr20992760qto.168.1587955789812; 
 Sun, 26 Apr 2020 19:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUGjKiLPQP9wp0AgLUvHgKBOe9We2a-RQaZ7cd7CvhnarwWiw@mail.gmail.com>
 <CAKywueT0Q9WkANNsg8cEDwGZSMaaE5c4LHuEeMhVDzJAzycroQ@mail.gmail.com>
 <CAEUGjKhSBNQboKOMFMgos9OQfxcLQZsXp8aBrUSFcaSe1saH2Q@mail.gmail.com>
 <CAH2r5mt1k5t8rSH1KizeSrcLaN1Fn3GWeMvDPwT2Kfq43UAWaQ@mail.gmail.com>
 <CAEUGjKhpgmhj9RzcGQXPuFUyoqsUnk2d3oCpOYBdR=EwCO21YQ@mail.gmail.com>
In-Reply-To: <CAEUGjKhpgmhj9RzcGQXPuFUyoqsUnk2d3oCpOYBdR=EwCO21YQ@mail.gmail.com>
Date: Mon, 27 Apr 2020 10:49:37 +0800
Message-ID: <CAEUGjKh--8qs_pn1OjuQk3DmtVuqLo9m5ecL-Lwb08Hk2oZTUg@mail.gmail.com>
Subject: Re: [PATCH] cifs: improve read performance for page size 64KB &
 cache=strict & vers=2.1+
To: linux-cifs <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Jones Syue via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jones Syue <jonessyue@qnap.com>
Cc: Steve French <smfrench@gmail.com>,
 Samba Technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> > And if anyone figures out how to configure an x86_64 Linux to use
> > PAGE_SIZE of 64K or larger let me know...
> I am using physical platform with arm cpu and aarch64 toolchain,
> perhaps try qemu-system-aarch64 later.

For reference using qemu-system-aarch64 + linux-5.6.4 + 64KB page to test
cifs read, this patch can improve cifs read performance:
with patch: read throughput 39 MB/s, SMB read IO size 4MB
/ # dd if=3D/mnt/cifs/1G.img of=3D/dev/null bs=3D4M count=3D256
256+0 records in
256+0 records out
1073741824 bytes (1.0GB) copied, 25.982352 seconds, 39.4MB/s
[~] # strace -p 23934
sendfile(38, 32, [297795584] =3D> [301989888], 4194304) =3D 4194304

without patch: read throughput 18 MB/s, SMB read IO size 16KB
/ # dd if=3D/mnt/cifs/1G.img of=3D/dev/null bs=3D4M count=3D256G
256+0 records in
256+0 records out
1073741824 bytes (1.0GB) copied, 54.367686 seconds, 18.8MB/s
[~] <0> strace -p 15786
sendfile(38, 32, [452984832] =3D> [453001216], 16384) =3D 16384

This link is a easy way to compile aarch64 linux kernel with page size 64KB
, a simple rootfs with busybox, and run it on qemu-system-aarch64:
https://docs.google.com/document/d/1NSVd-dib_asugCZHmZgohLZXHxV25ftzYtUDSpp=
Y3hA/edit?usp=3Dsharing

--
Regards,
Jones Syue | =E8=96=9B=E6=87=B7=E5=AE=97
QNAP Systems, Inc.

