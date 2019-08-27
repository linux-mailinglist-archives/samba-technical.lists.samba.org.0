Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC6D9F4F2
	for <lists+samba-technical@lfdr.de>; Tue, 27 Aug 2019 23:19:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cFMOEcKCACKDNPPKNkvL7Uc/DPa1qNdDOzfOJqmouRc=; b=Y2PMPzjAEepNQC71qqWwVuARwA
	r/qHwzJuVRrr0WotVY1RmRs9r54ZgCIH2eEIdP2VQxQh36sk7ROVtTZry1DckD5+r1qacHthFnfjg
	6fRUfkxXhwsquQrTvWSST2a4S+fC63CHz7u14rdhiOUrxzbi2ILKyzWBNNe+mUsnknCoCxaPD3CB9
	jmbjgBcr3N5DMnfW8LqJ2w9hR7H6OCYLVoTc8DrnifXoICnlpzSJ2BZzJ1UQOn8/8M2vEdLblwdBH
	qPdu1XSddCovr2MqnlyxIIhCmk8HzWYokCBQvpBm2aO9Me/+l5VDfLX8jxamZeXA6QvU+84KRbLOG
	s85GTQ6Q==;
Received: from localhost ([::1]:35706 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2ire-008oRe-F9; Tue, 27 Aug 2019 21:18:54 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:45483) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2ira-008oRW-CI
 for samba-technical@lists.samba.org; Tue, 27 Aug 2019 21:18:52 +0000
Received: by mail-lj1-x22b.google.com with SMTP id l1so570701lji.12
 for <samba-technical@lists.samba.org>; Tue, 27 Aug 2019 14:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aouPgtpoPpIA+2/Nr2nkbP2mN8YjuNQCmpt5/CTcPE4=;
 b=EhVsnuB60zIZGGiieo8Fm/TZmD/BlpTE9mv+LaHtTfJX6G5dUpxrhPRdHGUsFitQqg
 ym15bzq1vo1FULL6Tu9jMLjQSztfG0pEiyLCbTa/gwMvJv453zbCH7IWZqH5NXo2OhRP
 wc5gBHveUZzwiOxlVuxvDU8nOrX2b3+gsl3zQoKHecqriWVeqx/raWcVmFHCegGMlVeD
 rA8vahF+N/elMc5R+5QE1GQgwtz618mMT9PESU/jFcKRMnYtUU0/eK82EW84qcNhqSpY
 ZyguRqvrLdkRplL7vcIfzJ8KyHGa/of66s7vHmtScopUJpxG0+IgKDD7tErV1rPfxpYW
 2JTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aouPgtpoPpIA+2/Nr2nkbP2mN8YjuNQCmpt5/CTcPE4=;
 b=VnJnyMTh84zZBlNN0gBgqmZoZpsyVv1gVeFPGM+XO2uoG18l4PBaKWfHuwbVY6hwTh
 Bw7tOF+HqqbLguNXS4VHPE5WsYGXNzEJS2bPgmAhdAerM5XKMgAQwXLAhvWa3CsGXWBj
 rTaxOWu2Khzl24UwNeDKqYiPfqj1AnOtmVwMCURDjHpUwzyDQ5pH37KDtEVjvmuyYkJj
 tTLeWW38HqaQVK8XiJptaVI/vqI/uVfs7vP8zZMPXCqrDKqYYIXzJefjQ6NpekRGxYYe
 zXB3MEDOTXjuaQGCbKu2iwR3FXITqV7VDKBNOO1oLqhXYden++MyMe+nduJvt8nm7gm2
 37aA==
X-Gm-Message-State: APjAAAURqh1KwDg5liMDfbvezbxYoHxKwuYOg9pr1ZpL14eRh1HjBKnS
 8NvUR/M4AQqpqqzNKOCaQcK+2dPpKY2z+2fGR6Q=
X-Google-Smtp-Source: APXvYqxKyhUcfFMZdZ2bkWNsj3sBLYIydYXfJFgv/23/BmmsunVfjxRhngrlLyVOwr/Fce6Tv4b69wSKykw2iAj8LzQ=
X-Received: by 2002:a2e:6111:: with SMTP id v17mr206567ljb.30.1566940727803;
 Tue, 27 Aug 2019 14:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAELK94cBsS_+AfvaNRCkSdsdjLv5os2D_Wuy5ni41t+jrrYDhA@mail.gmail.com>
 <MWHPR2101MB07313A73451E5E60C3AB5D96A0A00@MWHPR2101MB0731.namprd21.prod.outlook.com>
In-Reply-To: <MWHPR2101MB07313A73451E5E60C3AB5D96A0A00@MWHPR2101MB0731.namprd21.prod.outlook.com>
Date: Tue, 27 Aug 2019 22:18:36 +0100
Message-ID: <CAELK94eoFPEXXE4ogKQtEjzg6UrH=dVB5pOVkPSj7zkhz1HmOQ@mail.gmail.com>
Subject: Re: GSOC 2019 - Final report
To: Tom Talpey <ttalpey@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you so much!

Le mar. 27 ao=C3=BBt 2019 =C3=A0 15:33, Tom Talpey <ttalpey@microsoft.com> =
a =C3=A9crit :

> Congratulations, Mairo! It's very nice work and we hope to see more in th=
e
> future.
>
> Tom.
>
> > -----Original Message-----
> > From: samba-technical <samba-technical-bounces@lists.samba.org> On
> Behalf
> > Of P Mairo via samba-technical
> > Sent: Monday, August 26, 2019 9:13 AM
> > To: P Mairo via samba-technical <samba-technical@lists.samba.org>
> > Subject: GSOC 2019 - Final report
> >
> > Hello, here's the link to my final report
> >
> > https://rmpr.github.io/gsoc_2019/
>
>

--=20
https://github.com/RMPR
