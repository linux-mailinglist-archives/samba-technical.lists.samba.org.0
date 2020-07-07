Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B7D2179C4
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jul 2020 22:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Bd7UFOBfrzjeXGmVJLvqdNk0ffmjOu0NwzASoNgUo9E=; b=uiLnT0boCJTdM8UEi24DhU9T1N
	oHTmIIAa7bNhP0g38fC0tM7b+waMNDL1187DwSy/9kkI6tMEaQrgf+5zsJwx48V8CmuF9M4OxuCLs
	u4341a4PYcXYAT48SAgAnCNb0G+JqrCiDyO1WyUPJiwhRFAHJN+mKwfNpesoKUnwx9lKSnddxtNDr
	BFin5KvvFupiaSY6YeOLpGZjNgee8hOuy+8yB07noPW/Mq3Iy4Pe22J3cRu98y/m/n40YC6xlPy73
	dpV0rN1Oqo39dd5iOXfFrrSFFgcZy7xzopNW6qOhBFAlwa993Dyemm425byuhUCiUzRD88LQ6Wncf
	qZaFhWfQ==;
Received: from localhost ([::1]:34646 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jsubG-005z5M-My; Tue, 07 Jul 2020 20:53:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39137) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jsub9-005z5F-O3
 for samba-technical@lists.samba.org; Tue, 07 Jul 2020 20:53:54 +0000
Received: by mail-wm1-x32e.google.com with SMTP id w3so586491wmi.4
 for <samba-technical@lists.samba.org>; Tue, 07 Jul 2020 13:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Bd7UFOBfrzjeXGmVJLvqdNk0ffmjOu0NwzASoNgUo9E=;
 b=E1l7npr4D5w5sOByJmn0eDiXwjnHt2yFjOiz/G3S0wwFvfbfHNj/p93sZeqltot8th
 M4oJ9xeGd4CGKeRvsarc7f7gfMnLMBh2CTJWCDRpCppEsEL098ympSpKyEkaydK8Zg/3
 XkIHckEIr1gtwuXusaL+rs8NvRIIPeufsRE8WmOT2bqlWh45lAYkrXLJ3zU6O3Xy4J9d
 Qb86dxOYnT7QbdeEEhVIl3JhSVDbWuocwMhTwpE2N6lQWwMQWNy2y5Ye7YxmSrtAQjrA
 MqCmhmFOCS8wjabuEnN4DJfOWbs+gWYZcIjoKyokWL5JlaFNUeSgI/1evoXZVV2KPt3Y
 fpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Bd7UFOBfrzjeXGmVJLvqdNk0ffmjOu0NwzASoNgUo9E=;
 b=Gr/KtzuC5Pxy5aVgPMGrNSQQpGvFLMpylpsLoK4EHo/rA6toE0hBZyQX9bmXip6VOw
 EUnFxaJbo8Ma8CGoFLgJUJWIXCEq8ZvCuPnOQZReYkTdYtoe5JCH6K2vmsY+CrZZkL5F
 MgSwlFW2NGK9/pq/oI9bXNYqAp9KIcAGpGx0/9844+we1YaNzITJt5KFhmQmhzHeWYrN
 hfhUHvYmMSf8hzzHIevdAWMQ3VA4A0NCj2P8YB3rrLAdsFWsAaBfe8UShjsFNw3LfT0F
 ZcM1we/2oOjo8eRWEgqTPJILqiXlrwuxtpcarO48buL8q7X/zkxi4mxOHypN0qMa6koC
 zY0w==
X-Gm-Message-State: AOAM532dMSYQm94r+H3getbTv+J+9atHaeTf9UPAFDJPG0D3PVI102Zf
 ND9fN5hHC/+ET4UyhYdYPIw85nQe/UzjgHkfkXGSLcqU
X-Google-Smtp-Source: ABdhPJxb5rY63Hel3ohLJCT1NIwE6glV9TMq4Vtx2tSVI+YXeyUoGN3OHtgSjB8Ynir+F3B5FuiQRyZttdX4NB6ccBI=
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr5755838wmi.19.1594155229740; 
 Tue, 07 Jul 2020 13:53:49 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 7 Jul 2020 13:47:38 -0700
Message-ID: <CACyXjPxNC70bw9WUiAyQqq7T-8rYpOBaHLU_PBSw50toTW=Bug@mail.gmail.com>
Subject: MIT Kerberos does not like the negTokenTarg returned by NetApp filers
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

We ran into a problem recently when dealing with NetApp filers (both
7-Mode and C-Mode).

The KRB5 gss_init_sec_context call does not like the token returned
during SESSION SETUP requests because the encoding of the
supportedMech is not DER-encoded and it is assumed the length of the
supportedMech OID will never be larger than 127.

As a result it screws up the parsing of the negTokenTarg.

Windows, however, is fine with what NetApp servers return.

The following little patch, which the fine fellows at MIT are unhappy
with, fixes the problem:

--- src/lib/gssapi/spnego/spnego_mech.c.orig    2017-03-02
22:06:02.000000000 +0000
+++ src/lib/gssapi/spnego/spnego_mech.c 2020-06-29 21:07:05.749062072 +0000
@@ -3256,6 +3256,7 @@
        gss_OID_desc    toid;
        gss_OID         mech_out =3D NULL;
        unsigned char           *start, *end;
+       unsigned int    bytes;

        if (length < 1 || **buff_in !=3D MECH_OID)
                return (NULL);
@@ -3264,9 +3265,11 @@
        end =3D start + length;

        (*buff_in)++;
-       toid.length =3D *(*buff_in)++;

-       if ((*buff_in + toid.length) > end)
+       /* Get the length in a way that allows more impls to work */
+       toid.length =3D gssint_get_der_length(buff_in, length - 1, &bytes);
+
+       if (toid.length < 0 || (*buff_in + toid.length) > end)
                return (NULL);

        toid.elements =3D *buff_in;
------------------------------------

As Ronnie Sahlberg points out, there is at least one more place in the
SPNEGO code where they assume that an OID length will never be greater
than 127.

Perhaps this will help someone some time.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

