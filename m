Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3D6786732
	for <lists+samba-technical@lfdr.de>; Thu, 24 Aug 2023 07:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=QkcdoFUn4jKzNSRO5UB+OKVKEVDO4MnKdmb68VJ4A7o=; b=STAyuImCEhxJ1E4V6UrL9fC8Wl
	aEAe+iVeAb+/UkA272Gl33mypESqPeQxnXREpVn0XwFT6tpW8C/lOyK08sgIdU5Lvedrz22AFfCyQ
	YcumCET8GwIk6JXg6UWN82xdlImFQPD1RTPqVdShDkR1ZnH/XHMuCBZ5RD6vbx0MShYH2EZ1LhJ+r
	unefaYtsF3JHnF9cfjLv6ysccr8fOI/Oj7UYAEGD6fVHumj70y7hgJSHtmOnqzxfEUtmIm/B6jM5m
	ipVwAqVhEt5woFNBbKDWzs2g8E5lpylJiH1WwhbaoQTNrrjNuKgXwIbCNHSxB++CF/3yFn0fWt+2F
	C4uHH+iw==;
Received: from ip6-localhost ([::1]:54922 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qZ2wJ-00EDDT-Mn; Thu, 24 Aug 2023 05:31:27 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:55536) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qZ2wC-00EDDK-1C
 for samba-technical@lists.samba.org; Thu, 24 Aug 2023 05:31:24 +0000
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-64b3504144cso36389176d6.2
 for <samba-technical@lists.samba.org>; Wed, 23 Aug 2023 22:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692855077; x=1693459877;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QkcdoFUn4jKzNSRO5UB+OKVKEVDO4MnKdmb68VJ4A7o=;
 b=Lg77Eh/fiOU/Faddrr5NIpGUU9NK3pHWaB67LpHR3Nk2JIQowmGrkUIp/Dtf2NrCPC
 DGjE1IsnAlJP4t9NIACQtjtdCZ7r7lONQPjdNS+/eQvWDHIYyVuThFI04wXHNopNCuVW
 S1U270EwyHB4PBJ6XKDsNbp+xC4aDJG/Dh0iHgoo+pVeJdu6YweEgeSpf/0LQY+4HIwb
 4eewPWav4FAkq1jUCY4Re0sMV+msDyAZzVoQhVYwmXxdNRA+M8uac0PPY9NM5ygtW5Go
 ZpO20MG8zDC/zfs1EkNs7lgjuGCM2W9Lk97nqpdeqCAVms8QnyX3UGWwz/VnIQay6GCp
 VwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692855077; x=1693459877;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QkcdoFUn4jKzNSRO5UB+OKVKEVDO4MnKdmb68VJ4A7o=;
 b=Ua+xuAwnwO3PkYbFpQSrOsPgMPWphimJ/LO9hfO/DiuzT+ICaJ2VD75NUGAJ6kcgh0
 QXoIPCaCz8UUj9rT8fAwGhGhb8kv7UW4Tpnl7EOkwiBx+sGUAs0xRiPRjKf7eqNr5M4g
 uoXMtLtxRvO7ujOt7hBckW0jc6CqDFHQmdzjImu+sXpQx/RVGBSnv8QbWDVO7xWuC0wq
 HuQBnFpDROc7Q5r9I/SEH6FgI2jmdzJrbBZxAniPrBqeqjClx5Cpri11DCEuYIa54p93
 wyhkrQG3BQFyJXnmH+oj7mx2NpsZ668LSfULFXU89hCL01gQ4fPqi4wLFgUcIrW2ix8j
 WFvQ==
X-Gm-Message-State: AOJu0Yzh5j/pZSNkmSdM2R4vwe6BsOI3gcy6Xbb8abyUj8u0hH+Ivssy
 6FqhDkRlTQ4mEzkY7moa5HD8uVjm0mTuWXI74vQfneWV
X-Google-Smtp-Source: AGHT+IENXLEhzwI6Izi2R1CT9tePJuRfM0r4FqukLWsMpvstPGVkm5NGooQxJ4HbykvBHo0Zj6Bfwmipiwe/1Mkq5uE=
X-Received: by 2002:a0c:f0c4:0:b0:63d:2a59:e446 with SMTP id
 d4-20020a0cf0c4000000b0063d2a59e446mr15316751qvl.22.1692855076692; Wed, 23
 Aug 2023 22:31:16 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 23 Aug 2023 22:28:02 -0700
Message-ID: <CACyXjPycDO5qNT=ibbS=4Wqvua+tDVtn3dhQ-dw1gJaktMOj6w@mail.gmail.com>
Subject: Does the Samba AD functionality support setting up a Samba server as
 a DC in a subdomain to an existing forest?
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

I want to set up one (or two) Samba DCs in, say test.qa as dc1 and
dc2. There seems to be clear documentation on how to do this.

Then I want to set up another Samba DC in subdom.test.qa as dc1.subdom.test=
.qa.

Is this supported by Samba 4.19 and how would I go about doing it?


--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

