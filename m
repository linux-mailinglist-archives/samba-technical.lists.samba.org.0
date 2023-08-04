Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C20CE7702A3
	for <lists+samba-technical@lfdr.de>; Fri,  4 Aug 2023 16:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=8qPIk8/dXSJYnJPGcTj9WjibAUYRdQLwOeudI6IoIKo=; b=ppUgyZ8VerHSuz+oLBgLX2hYN1
	hlVOTFu/Y06ED3BM1RbsbfysE8l8hnxJiBo20R0iv/cmsFXas15Inr4p1tKbNJnEHjK4vQpPB2Ge1
	KSieWMyT+D062IMKeaxyE+pglz0NBGt5FfcL7tGXXGv3OaBHOy22hWM3Nims40xJDqapZaLoow0r+
	d1wn36jVHKTHN+vRTpt8u5ufht1oN26jPIhWjJDMVzbbyUCTjGgvOP8ATsxDDErxdgb4TtwxV1/CO
	6Pe0aImE2hmSL3fs+i0RD8twvcB0dX/X2b6NqIq5l+RXvKgUlXZV9vtWzx5FnmuZcPPnvmDBX011I
	HJb7e7cw==;
Received: from ip6-localhost ([::1]:29564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qRvVz-009mZe-NA; Fri, 04 Aug 2023 14:10:51 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:49200) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qRvVu-009mZU-4B
 for samba-technical@lists.samba.org; Fri, 04 Aug 2023 14:10:48 +0000
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a3b7f992e7so1593840b6e.2
 for <samba-technical@lists.samba.org>; Fri, 04 Aug 2023 07:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691158244; x=1691763044;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8qPIk8/dXSJYnJPGcTj9WjibAUYRdQLwOeudI6IoIKo=;
 b=TjXD1V70kjYEIyW5wJ09nFy9HUBCX4UaZ7z/oClzYSMZVHt/n6hIyjmuJ9HMdpjWBr
 y1c5Wtt17cOgvGFPAmBCMfw82+o/H8QGSYCo0b5OGe786C6PZMW/jZUnQlfmn1LcJ9sA
 N+G1oZCsa+d+q2DnDjkwk2KxH51Q9rLZ/E3PIM2R0dyARTKhZAz14MHXtMHNiH7bxuKt
 I5XScOyuLaJWeVLM1z6x4hG7nzcABhn5uqzIqN45luVCM1ybiUs9MxdwNrM5CJGQ1OOq
 EmQZg+L0ePqFZTh8rZiArnz8oUqZ5F1da62hsr6EQvmvtpbZpIX7FZe9GCcHrwNktVRo
 EBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691158244; x=1691763044;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8qPIk8/dXSJYnJPGcTj9WjibAUYRdQLwOeudI6IoIKo=;
 b=Gyufsx1jSgsHYccSNTghh5uuP2zQYr4vjBOIBQa7MqeLbmISse2S8e2sLKcEDiWmHU
 vTSW9Y80iOXgXeJPHYZCOs3O83N84Y85XO7NOBzhPQoYE0meYn0y3dy8KUCk+QEq4X1f
 CZCylv2pkfqZ4yYqNOoShbRdYAxPZ8+/WXc3NTZZgRuTFZR409vreA5trcJBFiOQD5RG
 RaE8OTAijoGitjzgn0jP0JAYpWX7I4HJ5tHNuq3xSXVjMpfdfdj8mvz7R2zWeNGaoFdM
 WqPcSI8iuV3bo0CI8kK1tiJBKjMITU2QWJZ0izGO6zmlbLwHtIc6CUGh9BZYjxCdSZtm
 4kbA==
X-Gm-Message-State: AOJu0YxyaR6EmbhgPE9UdR7YfWXCVQMX5l0B45i8+2eA68GZtWNVGuvg
 oNUuTGZxcaLQDufIOKqjTi2FW0y474r6PRSiIwYptRKUNYM=
X-Google-Smtp-Source: AGHT+IHgElqvTVdZ7zdR/a+E/xyUNHY1cXUre2LKNFROkogawcOQr1O6SPsebrY/pl1IPtIIJWKPSq/wwZ0i97TZ+XI=
X-Received: by 2002:a05:6808:b18:b0:3a5:b231:8590 with SMTP id
 s24-20020a0568080b1800b003a5b2318590mr1902871oij.30.1691158243710; Fri, 04
 Aug 2023 07:10:43 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 4 Aug 2023 07:08:04 -0700
Message-ID: <CACyXjPwLkUOSFWBNnGPnQhRTZCbF7NEr3_9kiY5keMTgaz38Og@mail.gmail.com>
Subject: Samba master as AD seems to return 127.17.0.1 as one of its addresses
 in DNS responses
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

I have built and installed Samba master from about three days ago. I
then configured it as an AD server and started samba.

I now find that in the DNS responses for requests for the domain along
with the actual address of the server there is also, as the first
address 172.17.0.1. I have not yet figured out where this is coming
from but it screws up CLDAP requests when trying to join that domain
with another Samba server.

The CLDAP requests are sent to 172.17.0.1 and never leave the joining serve=
r.

Have I done something wrong?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

