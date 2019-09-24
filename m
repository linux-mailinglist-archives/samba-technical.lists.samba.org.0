Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8EDBCB01
	for <lists+samba-technical@lfdr.de>; Tue, 24 Sep 2019 17:19:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XwtCxduiaizIi6QX2xQuk08roAb1261lgMxAYujwlvk=; b=gdxSZNh9YZC7iCzEX8AgZrfcBg
	Q0D/ggpE4BS6wj4F2CEiBCH5eU4zr+n7Lr0SA9tda7mdQqlNs7VoDDPNkLVwwSuIDMxNpP7iYZrWg
	gUSOqn1XKDnQKx0jqxXBmn2TtiVQY344imaGS4Vw0iGa8H2srBVUhP1UCBY1Rhmd1mY3CAJ9iibXU
	CVOndpVsP1SI3GdIZe5C4MZ85s4U0XbdFFB4aTnO/ZQBvf4yTcTnQQ0cYZM3+cQ2B+wQHHwviBUKe
	kBarHyptiBEXDltI7vECD0MC74CgwHoei8IlFjWjqrOKVbOInLsUR4gV+6+kjN9gbflshB1DiQ0lb
	NgxN4V6g==;
Received: from localhost ([::1]:61766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCmam-008FkM-Lu; Tue, 24 Sep 2019 15:19:04 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:43514) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCmai-008FkF-Hf
 for samba-technical@lists.samba.org; Tue, 24 Sep 2019 15:19:02 +0000
Received: by mail-lf1-x135.google.com with SMTP id u3so1706787lfl.10
 for <samba-technical@lists.samba.org>; Tue, 24 Sep 2019 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XwtCxduiaizIi6QX2xQuk08roAb1261lgMxAYujwlvk=;
 b=CJcKb3e1eLxmmiyWUgs3KY2VSLm/xP7+ZORZTXMeJtVezPXb72HGW6v83LE9Td4Ova
 j1I3dhCQQFOKpKRzQhtVImFLO3xIgSnIh4wncvLm1Gt4JKqCM5JLmaVPBmLqLgoaZR5F
 O2TnEdvsFtjB6ostsQ5RgGW3alTIOPqSXErZGO4av+R2v2r9B1lL1eroEvu3GMxVTuz4
 nzYZDWmaHUfBFIm3hMUULp558gL/DeucEZYzcRqEmfwSadaIgBGO84pdhDSE5noPQTh/
 2l67MQRt2nO3pprBpf0/pIUeiqlf2HgV4wAo23DskLf8BtKwIpQRAV/CbEVHE2LkuvxG
 PKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XwtCxduiaizIi6QX2xQuk08roAb1261lgMxAYujwlvk=;
 b=Ta0YfOQvGOG0srqdDTbFMI0GX1NyfenMv1Kh/g3fykUavgJp4u3qTGTOF+qia/MpkT
 Cqsn/C+69cfTvkKM20naAEj77WsPD7Q86ABCPCrJIFMes9YD8s6UQcwJ7TuPfaOL26Q9
 Y6knB09mrNQmFjJQms9Rq87L+tzdWM0Q17q907aelpRhuhwgJwjeFp5QI+wsk8j5Z8I5
 4f+JJlqYPkGWzzhZtBDgOTPY7a5MusiZuec6OiDaWG8vAnE98hgtHQYi2UzKk0vy4pyp
 vCnTvP7h1QDsxiqnXRYNUGun65Px9cqe1byJdLk0xphU5pfjxkoPL6fbNjyAwdu3S7um
 Azdw==
X-Gm-Message-State: APjAAAW6nLfkMByaektWHTBB19Bxo1MVqLvPT7IYDq+Ulf+MRn8Impqs
 ET+Q98O0XH9KB88gAKacir+0ONqN3h9ZfsT76Q==
X-Google-Smtp-Source: APXvYqz3xR04ZEaUDGlftEt8ejCiYNfgkT/PNEOcVLaEDDTrk6n2myIo5qvB44+GJgz33di6Vr/r62VRkAP7Z2Bbvqo=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr2226416lfh.25.1569338339168;
 Tue, 24 Sep 2019 08:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvfb3nkdz8r8sAUXGJkx678XZkt4dn=4xiuq0UD2vxFrw@mail.gmail.com>
In-Reply-To: <CAH2r5mvfb3nkdz8r8sAUXGJkx678XZkt4dn=4xiuq0UD2vxFrw@mail.gmail.com>
Date: Tue, 24 Sep 2019 08:18:47 -0700
Message-ID: <CAKywueQXsnMzS30q2QidWAjvMinCXXWQg0ysUH=62RWLnPW1UQ@mail.gmail.com>
Subject: Re: [PATCH] smbinfo dump encryption keys for using wireshark
To: Steve French <smfrench@gmail.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

+ if (keys_info.cipher_type =3D=3D 1)
+ printf("CCM encryption");
+ else if (keys_info.cipher_type =3D=3D 2)
+ printf("GCM encryption");
+ else if (keys_info.cipher_type =3D=3D 0)
+ printf("SMB3.0 CCM encryption");

Do we need to mention SMB3.0 here? It is the same CCM as cipher_type
1, why don't just extend the 1st IF to

if (keys_info.cipher_type =3D=3D 0 || keys_info.cipher_type =3D=3D 1)

+ else
+ printf("unknown encryption type");

Best regards,
Pavel Shilovskiy

=D0=BF=D0=BD, 23 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3. =D0=B2 21:51, Steve=
 French via samba-technical
<samba-technical@lists.samba.org>:
>
> Updated with feedback from Aurelien and Pavel
>
>
>
> --
> Thanks,
>
> Steve

