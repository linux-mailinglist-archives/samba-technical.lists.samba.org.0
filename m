Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1643A780FC7
	for <lists+samba-technical@lfdr.de>; Fri, 18 Aug 2023 18:03:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Qd35hefSA2qe2fptH0JJAfT7fAiiyeRzwwP6jFQpzVA=; b=J7NJBSJLXWdY3LqOq+f36J7x0R
	2Xgo0isK+YOZdp/rRV73BwLXYYDVaNDHTu3bz+Yl1nkImGq/xYL3Gi13/U81KYBXTuX055e7skP9U
	YqOn5WDhuTUQyEDANNpJBk9yqQ5bqfFb8KpsOusBe3SStMnCEmbGhZmohsj32KRJBCAku9R8TSLKe
	w+WHD2ygHv389jIKIbfsIr/ogqIk8dhEhsuCvPVZO/Fa8J2KMPX7hxxzzxpyRwmKiqQva2tR25n/z
	koxOsyiQ5ElMBlGcnYxvBpJchXZGLft76NPg6fvJ5k5w5P/zWDESNKBFrERDmMzwP7DNkht05QKg8
	KRh2Gp/g==;
Received: from ip6-localhost ([::1]:44156 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qX1w8-00D81l-Id; Fri, 18 Aug 2023 16:02:56 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:42423) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qX1w2-00D81c-Fc
 for samba-technical@lists.samba.org; Fri, 18 Aug 2023 16:02:53 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6424c61c80eso5001746d6.1
 for <samba-technical@lists.samba.org>; Fri, 18 Aug 2023 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692374568; x=1692979368;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Qd35hefSA2qe2fptH0JJAfT7fAiiyeRzwwP6jFQpzVA=;
 b=KTYH+qsGyO0jqAMys872nkf75oX70wD2jNT/iKD5ddrK/mE5jBzeWiufaQwO5SzCcQ
 I+tIAKh3Jeq/k/yejAIpiJAcyKHq9j4T65EMndZEVbP52TEzwvMsmYljv48Et++O2/1G
 QqAIZn/vqPIpyfWxD2RRUZdAkr3kAEVcEn3HSzwzMjzbgv7lf7S4OqgQG3TP9N7X18/K
 H26VPzwmaOH7VHT1sRHKL9BGwNBriFGtJ4o6zJSi2jGAiNKOgCuQyUPj9nrlLbQwxywn
 O3hfjsYOJNoM6PDxlOqL+THayyybnCH5YnBkqGUq5GLFORVazrJBdLqb9heeH18h++mT
 iwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692374568; x=1692979368;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qd35hefSA2qe2fptH0JJAfT7fAiiyeRzwwP6jFQpzVA=;
 b=cTMHD/BvBn8DyWUUwHpQQI+BuNSyqWm89i3Afvs1/s05BAG2m1xNQ9ku1AquSHtSPX
 MwZQJuRMQWe1bDaFqjSaBmgk7YxeAIFk9rd/YZTXwACKk3+7INHgP3k6mZboJ/DViwWE
 TifkadTBgj/tYa4+K7tAC1SlDXbu0kefU/KNaaIhVvyMpDgwk8p5sF/axkFWqjtxV7OK
 lXEgeVv2isswPTNSofpsnaYxDCzo6DhMrErLk2nGAaPBvYfvLS/feFDVu5aVM9zBOAAn
 cnfjynbXIPZQAb3yNjCFmM2s7oKVGGv2T/UNlxmzyDitlrXolC79U/lGOcKpIO5I5pWL
 THoQ==
X-Gm-Message-State: AOJu0YytrzU1/tdXrkJxkp1Zn3WdiULoKjUlrkkwcIvL03OfIUJbVOo0
 ey5qN/bBi2hUQCKuhtYIXx9LItML+mEYGKXBoanwMxcv
X-Google-Smtp-Source: AGHT+IERsaVLURAYEYBWbUd6Ppk1m4HT+8FcWBnOK2QX3xLE5M6cHrHINIIPkJMqoEf6TWsxKdUyYJPrg2dzyhdZoaw=
X-Received: by 2002:a0c:e34d:0:b0:636:1d3f:3d77 with SMTP id
 a13-20020a0ce34d000000b006361d3f3d77mr3041450qvm.14.1692374568047; Fri, 18
 Aug 2023 09:02:48 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 18 Aug 2023 08:59:35 -0700
Message-ID: <CACyXjPwRaW=Nn6XOeMbpNj5YeLHhVnxiLeu42huE2JnSKeEKmA@mail.gmail.com>
Subject: Loading users into a Samba AD DC using LDIF?
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

Hi Folks,

In testing user creation with samba-tool, I found it takes around ten
minutes to create 10,000 users. This was with a VM but with real
hardware we might only expect a small factor of improvement.

Is there a way to use LDIF to load large numbers of users and groups
into Samba as an AD controller?

Of course, that might not be faster, but I am hoping.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

