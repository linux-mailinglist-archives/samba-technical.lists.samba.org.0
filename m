Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB7ACB275
	for <lists+samba-technical@lfdr.de>; Fri,  4 Oct 2019 01:46:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=KiTQrxibX71atsKXTHUjTix3V2M8APmsIyYghcXoOEc=; b=yzI5Hf47QANhR4JbljXtOU1HeV
	KKtYXjZCUxkxDmsLKHqMW/KCD7YgML4FdQ4q2G2m+kSwpJeM/2SwHCw53KsA6+ZxSOMwC1PEpHjlh
	OD/kkc25SKajlS3bpxpCM07OqBQyicSxLloYQ96MsqmTbhowThT+RsqP3E5kmNZweDYfK25ziW+qM
	62ezkx9MzMyqDeIa7KNYdlFXBAEyrPZMExYymTKx2iAzFBe2pdpoXPA1kjf2EyIZ3dRrSqHoiT8BK
	ZuqyucWOIBlYBmqi/hW9jfnLpBZA+K6H4TxqOy4RtZvqMu0oUaqv/PHzHXS87f10r7D0AZvgqEeVo
	jeZI3gIA==;
Received: from localhost ([::1]:30454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGAmH-000wil-SF; Thu, 03 Oct 2019 23:44:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38732) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGAmD-000wiZ-To
 for samba-technical@lists.samba.org; Thu, 03 Oct 2019 23:44:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id w12so4761721wro.5
 for <samba-technical@lists.samba.org>; Thu, 03 Oct 2019 16:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=KiTQrxibX71atsKXTHUjTix3V2M8APmsIyYghcXoOEc=;
 b=W4yCEE2IXzLmYdjGkFUlSstU70BojshJtHJRb1KPYJJ3ku+eEvbNRO4xsWKlazLgEq
 fyclAroQesodUuxroMvUsH4Gu4lhFVMoQHcmhSspWJA0v1D+E9aW/dQnc9G9X5OVPT5C
 RF6ZsFHrib7rEYQBJaZDNa/Vg/UbHU+ktqxoQNuD0n9kRAZ39oglwe3c/TxLaBcB/T5g
 iD1NngxeVEqL2Ekm/27jWpPoOHSaEhC7/c7/NJDR/VszcwL7GkHi6zHzLZn3Rv51XJHy
 7faysQDkF0/DROi0fcqWeULvSp8EuO2rZWqUkethoNKvKAoLJX8yvgqQMbTuvbv+8JMN
 g9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=KiTQrxibX71atsKXTHUjTix3V2M8APmsIyYghcXoOEc=;
 b=a5sul1Rwyuo3W7nSgkOR3Ei7n0rvZAGyqQJuvp5J4UI1iWrxAEOtR43bS3OZfAjOEL
 UjkKZAdOeFItpeJazOkzxGr7gZOC+wTy+TDbNQNsgXmgwatHToM0bWzcL813O1Z2nCG5
 SurEocg0OkdrptErx1DQnR8i9qUV6CKrCgyATV81dkGYWLWNMIl1mFGU9iDcrLRY1AZs
 Y0C5+7ccRCLdHApUczLxzJJ3yxkPAXxGSD5CL6ng8e+Ed3RBjoyvsuKK65gTPI682Dof
 5gCEPzpI8P2qk01T8CMWGWOHzCZqSa4UInmay9Nl5mJqtD+oAXKGSOLaOHD5VXyYcWOt
 P/jQ==
X-Gm-Message-State: APjAAAX4+1dQyS9lJIjgt7bqY4rWINF/+b3Y5p6y++4y+FQ2gH10dXGD
 URXOYCcH41/t83x6aeNkSAbzOJ7mdSj3KwnEyj8Blsth4iY=
X-Google-Smtp-Source: APXvYqwZ2gZ9pA0ecvQkjh0uDM5UHyND2qCvfa25lkuQfHuH60yr2kqs4Z/3hBl9+pJw106pqs9TZJipIXrAEf4F354=
X-Received: by 2002:adf:dd41:: with SMTP id u1mr9408902wrm.49.1570146291293;
 Thu, 03 Oct 2019 16:44:51 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 3 Oct 2019 16:43:34 -0700
Message-ID: <CACyXjPy5LL=yj6i_T_W0J=DOXHxHB_D=0-ir60opyEV7ftaQ=g@mail.gmail.com>
Subject: Has anyone seen a Windows Server return zero results to a CLDAP query
 for NetLogon servers?
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

I have run into a situation where it seems the Windows DC is
responding to CLDAP request, but returning zero responses.

Samba send:

searchRequest
    baseObject:
    scope: baseObject (0)
    derefAliases: neverDerefAliases (0)
    sizeLimit: 0
    timeLimit: 0
    typesOnly: False
    Filter: (&(&(NtVer=3D0x00000006)(DnsDomain=3DSOME.DOM))(AAC=3D00:00:00:=
00))
        filter: and (0)
            and: (&(&(NtVer=3D0x00000006)(DnsDomain=3DSOME.DOM))(AAC=3D00:0=
0:00:00))
                and: 3 items
                    Filter: (NtVer=3D0x00000006)
                        and item: equalityMatch (3)
                            equalityMatch
                    Filter: (DnsDomain=3DGPJ.LOC)
                        and item: equalityMatch (3)
                            equalityMatch
                    Filter: (AAC=3D00:00:00:00)
                        and item: equalityMatch (3)
                            equalityMatch
    attributes: 1 item
        AttributeDescription: NetLogon

and the server responds:

LDAPMessage searchResDone(3822) success [0 results]
    messageID: 3822
    protocolOp: searchResDone (5)
        searchResDone
            resultCode: success (0)
            matchedDN:
            errorMessage:
    [Response To: 5897]
    [Time: 0.001296000 seconds]

After that Samba seems to declare that DC as a negative connection
entry and cannot find any DCs.

Has anyone seen this? Does anyone know how to configure Windows to do that?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

