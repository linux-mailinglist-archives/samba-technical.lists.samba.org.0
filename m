Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ECC7900AA
	for <lists+samba-technical@lfdr.de>; Fri,  1 Sep 2023 18:25:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=RBvEhWAV0Hy7uXnuDBqybGgzWqeJCbvyL0naYyXBlMI=; b=KbaI1SHAFyFkYKvTm0lnjut2L1
	iLS3Ep0QwtYGeTTEsikipexL+qARv8TCRPDW6R/V2h4HmsqTjWJHf9jqn8b3JrQyP2d7fuzHEi4qM
	tc1SecSiqVDbKuRBpDlogtAuAGqYt9popNYKXNiwbMSs9YTYq7XmcW5Yremms5xZzbbIVWl/73OzW
	60IKlqey7CGqvvSzqeJ7ZUCIs7phJL9BTcvZv7I7wGrqR1FXvDTVN/y0dGanGantMGPHMNPiFGo7+
	JRZ1vZDn9zW+u1on6Oln2UdZutfmiGoqcE9M+q3BASGuafEs+R5ZkI5owsGiWkKx1ruFX8tL/ViWm
	wsLyHNtw==;
Received: from ip6-localhost ([::1]:58022 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qc6wl-0009DW-H9; Fri, 01 Sep 2023 16:24:35 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:47423) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qc6we-0009DM-Tu
 for samba-technical@lists.samba.org; Fri, 01 Sep 2023 16:24:32 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-44e8d9e6ca0so858072137.3
 for <samba-technical@lists.samba.org>; Fri, 01 Sep 2023 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693585467; x=1694190267; darn=lists.samba.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RBvEhWAV0Hy7uXnuDBqybGgzWqeJCbvyL0naYyXBlMI=;
 b=eqBeAPwUAHGLko3ovSdDG+LE4fkPbeTF7CAf45hNX/f5sEdVFUfxyF4sY3WvaAdp1G
 UBH+KiKQlU9VZyuo4uf0sX3WeXjG2hR6+jo5Nu6LyVvyYX62S3ry7zCbCze/VneFFMG7
 QQ59xaZg3mnDgLmW0EK5yUPJSqqTwAWQt8K6tePEqB2Uossq4FydoW8j9xGFDI4fbq/U
 GT4YM846GcHgLrGPLd63lZ6XL1xD0+C+2tPv8WIA2iemM90gZbUlWJaog2HfPGf78/vN
 Oo3wFq6XWH+kMId2WtRslEV1VoTsg1Kmd1FF874GfQ8mAUieetyma+oMzZ2W4Th7/uK8
 qsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693585467; x=1694190267;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RBvEhWAV0Hy7uXnuDBqybGgzWqeJCbvyL0naYyXBlMI=;
 b=Ze6bb/bYpk5P/ETjRtfP/Mr14M60ebfh/eT+cIwWeGlmkD5Cfoplo1K0JDACOYSDP4
 m2gEeUEhtymb+Ud3mNj3INxlwJi5/BR1FmBDiy/yK9HC44pJPGsrLf1t95AjIE0R0UTY
 8/u4f8gAUfpa7hNJc1X5jmmXgNLC8+RmXRRCqYOSQvPkZm/TEfUxqRHyEha7jxoxgpqm
 JeaPDkImcojy7hCnuTW1Z9j4yjFoWaKSZGLtGVyEXdaSbKaWopcYM1oImiPt8NvUsJdx
 yTGpT2T2FsR5wzFx0FkinGIrKcmbfFx7jlRfeyH313hfWYWcfMLAICIuqW1yu1jF/C5r
 zhGg==
X-Gm-Message-State: AOJu0Yyd3Yy+9HnIo2l3SOX9uY3NWGO8OhoT/ldtkab0QSxUfr0d4dGf
 p8B9jEgo78ALKuwQXV4noY1obLKWNR03TjfefPRq3kpuwzw=
X-Google-Smtp-Source: AGHT+IG1V6vJcTc4i4/OK8cCEQzcs7PCLCqHrB5u7ujWvZ14kEuDQVNQOIzM3SkiMzlp1Meatyw5W3trGyMMsRapdAg=
X-Received: by 2002:a67:ea5a:0:b0:44d:5053:11ce with SMTP id
 r26-20020a67ea5a000000b0044d505311cemr3351000vso.19.1693585466595; Fri, 01
 Sep 2023 09:24:26 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 1 Sep 2023 09:21:09 -0700
Message-ID: <CACyXjPx2amrwUZRYoMZOu+XGshLCRQtEDGsx_dfVVoLVP=VTbw@mail.gmail.com>
Subject: Stupid users cause weird crashes in the DNS code ...
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

I didn't follow the instructions carefully enough.

I set up resolv.conf to point at 127.0.0.1 and an upstream nameserver
(10.20.1.100).

During provisioning that created an entry of 'dns resolver =3D 127.0.0.1'.

That resulted in the following crash. Looks like a bug.

Provisioning should not use any of the aliases for the current system
as forwarders.

In addition, perhaps the code should not crash if it gets a timeout.

4.19.0rc4.

----------------------------
[2023/09/01 14:12:57.423713, 10, pid=3D24521, effective(0, 0), real(0,
0), class=3Ddns] ../../source4/dns_server/dns_server.c:234(dns_process_done=
)
  dns_process_done: dns_server_process_query_recv(): WERR_SEM_TIMEOUT
[2023/09/01 14:12:57.423754,  5, pid=3D24521, effective(0, 0), real(0,
0), class=3Ddns] ../../source4/dns_server/dnsserver_common.c:72(werr_to_dns=
_err)
  No mapping exists for WERR_SEM_TIMEOUT
[2023/09/01 14:12:57.423781,  5, pid=3D24521, effective(0, 0), real(0,
0), class=3Ddns] ../../source4/dns_server/dns_server.c:260(dns_process_recv=
)
  dns_process_recv: FAILURE: WERR_SEM_TIMEOUT from
tevent_req[0x619001b58100/../../source4/dns_server/dns_server.c:129]:
state[2] error[0 (0x0)]  state[struct dns_process_state
(0x619001b582e0)] timer[(nil)]
finish[../../source4/dns_server/dns_server.c:236]
[2023/09/01 14:12:57.424336, 10, pid=3D24521, effective(0, 0), real(0,
0)] ../../lib/util/util.c:578(dump_data)
  [0000] 2F 42 81 02 00 01 00 00   00 00 00 00 0B 68 61 6D   /B...... .....=
ham
  [0010] 6D 65 72 73 70 61 63 65   0A 63 6F 6D 70 6C 69 61   merspace .comp=
lia
  [0020] 6E 63 65 11 66 6C 65 78   6E 65 74 6F 70 65 72 61   nce.flex netop=
era
  [0030] 74 69 6F 6E 73 03 63 6F   6D 00 00 01 00 01         tions.co m....=
.
  dns_cli_request_udp_done:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[2023/09/01 14:12:57.424720,  0, pid=3D24521, effective(0, 0), real(0,
0)] ../../lib/util/fault.c:185(smb_panic_log)
  INTERNAL ERROR: Signal 11: Segmentation fault in samba (dns[master])
(task[dns] pre-fork master) pid 24521 (4.19.0rc4)
[2023/09/01 14:12:57.424838,  0, pid=3D24521, effective(0, 0), real(0,
0)] ../../lib/util/fault.c:190(smb_panic_log)
  If you are running a recent Samba version, and if you think this
problem is not yet fixed in the latest versions, please consider
reporting this bug, see https://wiki.samba.org/index.php/Bug_Reporting
[2023/09/01 14:12:57.424908,  0, pid=3D24521, effective(0, 0), real(0,
0)] ../../lib/util/fault.c:191(smb_panic_log)
-----------------------------------------------

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

