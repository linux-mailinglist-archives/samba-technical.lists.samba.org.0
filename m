Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D05D921798D
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jul 2020 22:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=C9ac8aAs6uXLsepGTsZH75SeRy1WZHSxGlV/Ci2oo5E=; b=DD+BJeSNqodg64Zv2a/8I9nxj2
	LqXEpe3zGAZBvOwYDRwyUYie3kQenFi4bLh7dCdbr7ZWEoKy9ZHzCNDG0mqrBBtU4WJkfifuEwLZn
	qzb2xeXjD5fHCG3WGvRyV1XjZ973dtXZqotJo9jWtawd9prkXSMfvKEoEo6z37xTF3LLnTW38Jjj5
	IPofp2LtrZ5MEXEK5zCO9u2doZqDhhatHp3C8Dv0j+zBbZZmISaxtjbkrW5oKLyVaVnJPp8uEvQ8S
	uFIV1nPBKrc4nRXk8jTyfEWK1V4m8fwvkSq9NiPw895JP6LMGuw9ujgizSDqYUEsXyDN2Ekx8gBRw
	mV+/szgw==;
Received: from localhost ([::1]:33898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jsuMC-005yz1-3x; Tue, 07 Jul 2020 20:38:24 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36718) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jsuM6-005yyu-Bb
 for samba-technical@lists.samba.org; Tue, 07 Jul 2020 20:38:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id k6so46685815wrn.3
 for <samba-technical@lists.samba.org>; Tue, 07 Jul 2020 13:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=C9ac8aAs6uXLsepGTsZH75SeRy1WZHSxGlV/Ci2oo5E=;
 b=gCIbJ711VgNifD/UWKf1aadDmVpnyBIynbZ2Jf3jVoEeEhvKxk+Rjel2tspv97nxlk
 o5IuGPHWhkzzzmjuWEzODJ+M4nW6j3u46cTkQA6guKi4NGaYbwa1/tmwCS8xYf/l92nz
 FJLVLKPw9LPOeJPE+F/OUXOgAU4cEH4ltw8nopeefXi9Cqax1mKORrkC3q6NouW228o7
 zUBmrWEK5K1ejF6U9LIA5Cp9O1BFVnp03HgUdLNQSSZthyjUrPAP8At3ILfzRgq6vorq
 E8vweIIQ+JfluPaLLhv+GYDBTVyiX49YDw2ibDH6zXMhqeCb9LNcm2P4/Nm+cXTQewuX
 oTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=C9ac8aAs6uXLsepGTsZH75SeRy1WZHSxGlV/Ci2oo5E=;
 b=PNwfy/50lR6qtxZjQEjsIByVu+abX96Xfvfzt7TsxvkHWZxFb6ZNvu9/EjqNlR67vu
 pk5hsBMZGuyYFAuZfqAmhUhLs/FQyWoJiEeUU7OVVqSJ5aHd5hac1YNSnja12YkdIOHq
 6TbZ9xOUXE/ZHz6IF118KYeCXvsUJorQXxH7iIqgmmTqRS98mff6FvPxHP9nn8pjmMML
 g47/ztkbeAMCRZouxaqxF2m3CLvRnleEIrFOm18qML1Mrj+5kfJN0naglvjmMQfL0HJQ
 knXyhZmYUTZjyHzCbQYG8GG9KsXXsi08A6pWFFBkGHWNu2OPmhYidlx5J2OWU3MPoRnI
 4B4A==
X-Gm-Message-State: AOAM532EetV1ALfCXUIFgxAmbhy9mmFFXdQdbMtxNfppQqbM2Pbcpnkv
 DZWADGZo4RTlhcIcLX9Bki+pgH1+IKH3f6AUenX0FdG4
X-Google-Smtp-Source: ABdhPJz/bZ1wZ3sOyZoMnh1RT7qa+wFaFKaXFNqp5cV37MOa3OGuCBE/PUpxAVJlbVk5OpTsmCZlLR13aL3DtVN2y2E=
X-Received: by 2002:adf:e908:: with SMTP id f8mr54326172wrm.3.1594154296818;
 Tue, 07 Jul 2020 13:38:16 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 7 Jul 2020 13:32:05 -0700
Message-ID: <CACyXjPwXQe5xPrtzYRNTsfjA0e_P2WBGoAuiKpFypxXtoZg=_A@mail.gmail.com>
Subject: What is the difference between a 64-bit fileid and a 128-bit fileid
 in Windows?
To: samba-technical <samba-technical@lists.samba.org>
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

I have just become aware that Windows has both a 64-bit fileid and a
128-bit fileid.

https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/2d3333=
fe-fc98-4a6f-98a2-4bb805aff407
https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/988604=
16-1caf-4c80-a9ab-8d61e1ccf5a5

Are they always equal if the fileid fits in 64 bits or are they different?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

