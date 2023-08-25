Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0B9788CEA
	for <lists+samba-technical@lfdr.de>; Fri, 25 Aug 2023 18:06:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Uw8J3SN4sNqJOKHw8sm9BUZBkrDUb3vnzUNXgJ5keRw=; b=Qh+dZ0SZ3DDWssdc2LYLOkdhWs
	VSHAen3VN49Mn6E/rBUlcmmCQJsgjIECYwv0T3bEsT+2KELgoXxY8/zz+puud21c3qaaesK6K8/eX
	kVcs7sYct1a4EkoW7LMjZ6tBri9SIcFEzPQlERkHh7EO4ruLnGWsRXqM2zH11mRtCfZNskyJ2tWgf
	bkJdedZ+k1zCB4QLvd3x6U7GcPP1H2HES/cHI30x4ZugAyo6t8Gy7MBDYeyWqMb7sc/9Oyupoxqj5
	/5aUx0UQnctDzZ0x0NYFJnb5V50yHd+tKPdacWqWcb0DxfkzgqrVZKZjndoGNpiizmRpRAiEfkc5+
	c8pw8IwA==;
Received: from ip6-localhost ([::1]:61682 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qZZK4-00ETLc-Nw; Fri, 25 Aug 2023 16:06:08 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:62860) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qZZJx-00ETLT-W6
 for samba-technical@lists.samba.org; Fri, 25 Aug 2023 16:06:06 +0000
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-410ad0ae052so9879391cf.1
 for <samba-technical@lists.samba.org>; Fri, 25 Aug 2023 09:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692979559; x=1693584359;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uw8J3SN4sNqJOKHw8sm9BUZBkrDUb3vnzUNXgJ5keRw=;
 b=KzmiOZdt8CP5w/U+qgXKEuGZKIznTmUtzO3+Svg5eGBtcO+gfgJjU3EaV3H3fh0Phd
 +NAlHh/dWafGf5w0NeS3khJ+xb3d0RYhuSRVfHmhNH00Rp5AKz2wxRqDWNlyEUi4Ysgg
 XsBysVt9u5Teh7y/AAWdCXJ/mQkBQ7In14FX1pfvomu93QZ47mqpMy2Mn0OsEN6rEJla
 f9TOExElIvgl6dERb3ddg1w119BNLESyN9Ke1BYV0hnzoB2x+lcmOGeu9lMwKIu0g2nG
 7a4CZafD4AlvVLKD/BmxkowwzhMxky6a3G3YovBxq2c5xVf+NGRvRAtphyrueE6zyqFy
 AFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692979559; x=1693584359;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uw8J3SN4sNqJOKHw8sm9BUZBkrDUb3vnzUNXgJ5keRw=;
 b=fEIThmoY9vhsHgUfc/ea6gw33YDgoyqzqwzzUWYo01ImfYid1qpTl2JnHUeERgcJtl
 ws4IDhCs1X3AT/MoZ+6EsDatvmUDtTO+myMGdNjLWwOv/8s7zp46sAiKXhwfFBeaHP3H
 22HyGpeWriICibfRRU5CsqvYX+XS1winDNxpz2r/FDovX5GGEy/eHa6uYVLwjThXBEiq
 +9AUmViJf4UgBko8YBL3Q+c879uNirLLDpCc/T5FY6iCyt1NGK9y+IHNVZqSMRvX5Hmk
 sVfG1zllXklaL6iR57dIEmUxyMiMAk0HHbzLdXXflvl3PcpAt5lj1mfkjLzAF/y0qq3C
 XSwA==
X-Gm-Message-State: AOJu0YzoCQmYPBLqK+80VrZUPRxJW4izlbZyoDZXhoOAwAlU4kCmlacu
 aBnznGC3DO8tihuWq06ZJ138uYDApWhN1YOa/5t8ILmpdZI=
X-Google-Smtp-Source: AGHT+IGhEkOpNypAjzkoSyU1TxjsXIYrKpMzV1qJSa84pOxyy88niLyLJM2U02h6MeABjssCZDt2ak2yoVehHw3JXs8=
X-Received: by 2002:a0c:f10d:0:b0:649:1690:57ae with SMTP id
 i13-20020a0cf10d000000b00649169057aemr28461309qvl.16.1692979559640; Fri, 25
 Aug 2023 09:05:59 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 25 Aug 2023 09:02:43 -0700
Message-ID: <CACyXjPw-ew8=qG_oAv7AY9nyMTM2On3acLdzAuh9XcFMUYVpQA@mail.gmail.com>
Subject: Error injection in the MSRPC code in Samba as an AD
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

Hi folks (and Jeremy :-),

We have seen a bunch of issues around winbindd and issues caused by
errors from Windows domain controllers or delays because the DCs are
far away or slow.

To try to create more robust code I have embarked on a project to
allow the injection of errors into the Samba AD code when handling
MSRPC requests.

We tried other approaches, like using the Linux networking code to
randomly drop packets or inject delays, but this was not very useful.
We also tried adding error injection into the winbind code when
handling responses, but that creates issues around packaging. So, it
seemed like it would be easier to add it to the AD code and then
provision test systems with the correct setups.

The changes occur in a couple of areas:

1. In PIDL I have modified the generated code to parse an smb.conf
parameter to do error injection during the RPC library setup and then
to handle the specific requests when functions are called (see below
for more details of the smb.conf params.)

2. In librpc/rpc/dcesrv_core.c et al, allow delays to be inserted into
RPC responses by using some tevent magic.

The sort of smb.conf parameters I am thinking of are:

lsarpc error inject =3D lsa_LookupSids error NT_STATUS_RPC_CALL_FAILED 10

which says to inject the specified error into lsa_LookupSids every
tenth call, or

lsarpc error inject =3D lsa_LookupSids delay 30000 10

inject a delay of 30,000 milliseconds into every tenth call.

Having said all that, there seems to be willingness among my managers
to try to upstream this code.

So, is this of interest to anyone?

Should I post examples of the changes (to 4.19.0rc1 but they seem to
apply to master).

Is anyone interested in providing feedback?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

