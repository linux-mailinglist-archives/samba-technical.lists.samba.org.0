Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D04FE78EE6F
	for <lists+samba-technical@lfdr.de>; Thu, 31 Aug 2023 15:19:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=YwktsFBv/jfpfY7fPImIjgehtG3hEcmn6ipFzo+MHk8=; b=idFzI3xp82l5vWOPfGirurhYS6
	EYtmOIECYPp0s4Kg2siueNMvqNmwOHGkSQmhU+WTzucwaWLi9iGGef8XCKXCVWSCQmbWRM1SPK1s4
	C1+2+/U1j2u7HD5D0pqwSk2IE2TTt0RHEt8h4k1l5vhcvcY+KL9/sFcR3IvY2tBstCLRxMTi/2MUh
	8ifkguYEVL+DXOQmYfyx3hZIibu2G+MatjGl8vu4oxM8ABT2qDdn0HL1RCTJiN+cF8BEITB/WYsHf
	D16LDnTY2F7sUxlFgSFOAuD4AeKjasdBI2h5K8YGVyjUtL1oBZOZaGttJTLjt4BREwZBLEk/fpMg3
	uuNbxClA==;
Received: from ip6-localhost ([::1]:37578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qbhZH-00FhJf-2M; Thu, 31 Aug 2023 13:18:39 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:57699) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qbhZ9-00FhJW-29
 for samba-technical@lists.samba.org; Thu, 31 Aug 2023 13:18:35 +0000
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-64f387094ddso4546166d6.3
 for <samba-technical@lists.samba.org>; Thu, 31 Aug 2023 06:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693487908; x=1694092708; darn=lists.samba.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YwktsFBv/jfpfY7fPImIjgehtG3hEcmn6ipFzo+MHk8=;
 b=IpYZOzDk97tqoKzNc0qVZAtQRQGpXr71tgzRlkpdn2Ap3MHpPZBJoc/Oy+SWDmGvKg
 mfXxWNA+1L8yGQBey4ppeAsx4TQF/CjvqtmX5Gkj0EiFKiY7doqL1i1apcpe7ZdZMbRC
 sgRXzMv11dymnHs8zTQ97Xx0tO4gYTBQuZQIL6hnRAoBKMjLc3XpjGklMu4zQDRReDJI
 frGe/Z3TuNUOC0z2swvaRaCaDqZH2zi2voXKuHMFSQ8pDcJR/aaX2Y0bDR8Nk6fe14rk
 OqFTwseIiQOBtmETYhJFRN7H1JMfnXZMZI5Xe1yHNq0LnMA7wshuQz0LM6y9aVibMe0I
 S/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693487908; x=1694092708;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YwktsFBv/jfpfY7fPImIjgehtG3hEcmn6ipFzo+MHk8=;
 b=fSRLJLGxw7moGWy7tIGjI+fuq+9pjTvYkhTBpIuwW/5P8oKOfBM3W6ooEdzLqE9eiK
 8PDon2TP14ItSkQijF1eYMfI5bGF2U8pmyY49tBceBkp+KSnWvXv3ORlIq47qze4yrUY
 Xbj1THmAGKKRUcGugWgKk5UyMlxbNY84GODxA1zoBhN6XZebEiwMKmht5IBnQuoIRv5D
 3pxiddRcGhoESRlzfvWjXJaDVPHgmeHt6ecoST5YYHeEOE2tXEQnEdPpqqfVmiLfJdlF
 N7aQK8Txovc3/OS8Tj8+vN3oWp2y+n9cVlnbkUrb9BEA2OYRt+gCmfmPD2d8pbT0hXDR
 9l8Q==
X-Gm-Message-State: AOJu0YzU8eev+hB5VIdTLA+V0FyL3sl/+KMkpx1Ol4vENxQx7jWpsMEQ
 rjRQWx4Nj4O5xe9BGEUi1bXxftGu5hSCRkb5ta8tdV85cc0=
X-Google-Smtp-Source: AGHT+IEIz6Jy0UScw/+LpuNjlwo6cSDBsJDEAdf+Ub+JlijjT+v5cnVKf+fSUSdUvuXfkRp2hsn5o5zo094+5vCX6S8=
X-Received: by 2002:a05:6214:4602:b0:64f:3c68:98ea with SMTP id
 oq2-20020a056214460200b0064f3c6898eamr2596804qvb.2.1693487908554; Thu, 31 Aug
 2023 06:18:28 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 31 Aug 2023 06:15:12 -0700
Message-ID: <CACyXjPwWBuAu0PkYz=5XrDH1R087QsSWFt-izTqdiu4YEPaW0w@mail.gmail.com>
Subject: I used --enable-developer and all I got was this lousy build failure
 ...
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

I user --enable-developer on configure and then built and got this:

--------------------
../../third_party/heimdal/lib/hcrypto/rsa-ltm.c: In function
=E2=80=98ltm_rsa_public_decrypt=E2=80=99:
../../third_party/heimdal/lib/hcrypto/rsa-ltm.c:261:9: error: =E2=80=98size=
=E2=80=99
may be used uninitialized in this function
[-Werror=3Dmaybe-uninitialized]
     size--; p++;
     ~~~~^~
../../third_party/heimdal/lib/hcrypto/rsa-ltm.c:262:20: error: =E2=80=98p=
=E2=80=99 may
be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
     while (size && *p =3D=3D 0xff) {
                    ^~
cc1: all warnings being treated as errors

../../third_party/heimdal/lib/hcrypto/bn.c: In function =E2=80=98hc_BN_is_b=
it_set=E2=80=99:
../../third_party/heimdal/lib/hcrypto/bn.c:238:24: warning: cast
discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Wcast=
-qual]
     heim_integer *hi =3D (heim_integer *)bn;
                        ^
../../third_party/heimdal/lib/hcrypto/bn.c: In function =E2=80=98hc_BN_get_=
word=E2=80=99:
../../third_party/heimdal/lib/hcrypto/bn.c:309:24: warning: cast
discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Wcast=
-qual]
     heim_integer *hi =3D (heim_integer *)bn;
-----------------

How do I fix this?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

