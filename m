Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA364ADB94
	for <lists+samba-technical@lfdr.de>; Mon,  9 Sep 2019 16:58:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=0yvmHICxYLe/iu5qASublnR30OHKYxoBJTQChvRPCAw=; b=SWp/oORf4mTyamg70xi+Hq9PaP
	7WM39VmyHqmXDMey/4sLGoFqKi5fKREnESN/Uww0G5zxJKav0wEHyLZ6kov4/nGdhlYHSMXnZQVpA
	tSX+P75I2Cxx/otm5kExB+FYG4EaeLeVVlvjAUPB13+CL4eQnuwHtyVXlU6dun6ejjONLTLk4+2Q7
	kuUlQTduwOklu5dm2U+0JULWu2lKPk/Kb1tU4Jcmfbjh14NqY6iELN+xsJBCHjxtrM96k74w2/DqL
	b2jGJqe51R/4zqAg9GFHHMoDZt5m9MikJ/RQZe9sBo44mnhwqGjFSRsXJ9SQBdYbsMLbSGRSfZ8oP
	WirHw2NA==;
Received: from localhost ([::1]:42722 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i7L6s-004S1Y-01; Mon, 09 Sep 2019 14:57:42 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36389) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i7L6n-004S1R-PX
 for samba-technical@lists.samba.org; Mon, 09 Sep 2019 14:57:40 +0000
Received: by mail-wr1-x42d.google.com with SMTP id y19so14226404wrd.3
 for <samba-technical@lists.samba.org>; Mon, 09 Sep 2019 07:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:in-reply-to:date:from:to:cc:subject
 :message-id; bh=0yvmHICxYLe/iu5qASublnR30OHKYxoBJTQChvRPCAw=;
 b=ZA2+kBcysKit4jRjr0kt+Zmxn4yuQAWRX+6TIzmS+wErwgWFHDRcdWKEUCePt1I64N
 aIG6HHgtIR4jGO8L6mOkqR/BFtcXfIHAj+d2SQJebogLw9g2RWoplZ4vSa5vEN1Olv+F
 2T0k35vfplwwg3FNBiSfGbqxEqr+y1vrsxtxhRHBTEamPjunj5WE13p4AYvstRbtOAqn
 LiCF35vD4FuYxQzVf3T18No6q1rzpitN38cycHau8T+0O8E8M9sgvYJOx4ZDQSBN+ZU6
 ksS30xsTpXWgRSEcawMy0owCUwml5v7GxGyaMquOg9bQbvr2t2A1Nr/EzOfsAxnCNmlA
 VaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:in-reply-to:date:from
 :to:cc:subject:message-id;
 bh=0yvmHICxYLe/iu5qASublnR30OHKYxoBJTQChvRPCAw=;
 b=JaonynvoYaDbkj8xo+RiT7nHSK2uRwpvYfvK+WZhd3+9exdq9/2MQfQNyNY2mTgdw+
 o3p3BW1Fkyv4f/d+J8niUz9Fo5Mk6vvgSjyG9ZGPRaGASyArH52A8Eyp5vwXifzFhdFS
 KUPiVnn6IgPKcwmsLlAqsf+EbEQRNRqSFAttakZnPaVofJGQ5yxs8g/uGm/M+tiI2uD3
 4yG3g2IFJXcfyoGL65lz0Kw0Yy6/FhZp38ghSGDFd3RBsc1J3MYSNcixHVFQmyRMh5tD
 2NcYpe/oalSl3UN8pk+t+A0E8Ma5Dqufa2FMcHxgauntEaxNWjMdW7ExLN19MsQ11p2R
 63tg==
X-Gm-Message-State: APjAAAW8V22cfUHNikdS2Qn2c8Nw8kfTNa6IN7Y3z0rtH4ow8rqFGt+9
 ZrMJQtlwKOt2FUhMaH+6Mk+Af+SR
X-Google-Smtp-Source: APXvYqy+VTQ5kPNkoGFT0Si0dDbYFnWjm6VGv1wcQkpjbeZUk246OyqIeOZMoywt2iCwGjVwPKX9TA==
X-Received: by 2002:adf:a350:: with SMTP id d16mr18743441wrb.326.1568041056632; 
 Mon, 09 Sep 2019 07:57:36 -0700 (PDT)
Received: from localhost ([154.72.167.57])
 by smtp.gmail.com with ESMTPSA id z11sm12152452wrg.17.2019.09.09.07.57.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 07:57:35 -0700 (PDT)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <87pnk9izju.fsf@suse.com>
Date: Mon, 09 Sep 2019 15:57:31 +0100
To: =?utf-8?q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Subject: Re: Insights for the future of smbcmp
Message-Id: <BWVK5UFOCVX7.3TO1IBW9LVXBB@uncertain>
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
Cc: P Mairo via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon Sep 9, 2019 at 11:33 AM Aur=C3=A9lien Aptel wrote:
> "P Mairo via samba-technical" <samba-technical@lists.samba.org> writes:
> > Can you provide me the file(s) you used ? And the steps to reproduce th=
e
> > bug because it just re-tested it and it works just fine
>=20
> It happens with all the captures I have. I coudn't find a capture where
> it loops correctly. I'm seaching for "res". It doesn't matter if you
> open the file via the CLI or the menu, happens in both.

I think I get what's going on here, thanks for the feedback

> > - If you select something and then search it won't search starting from
> >>   the selection.
> > I think this is questionable, but you are one of the users so I'll do i=
t
> > accordingly
>=20
> This is how most (all?) searches work. Text editors, web browsers, etc
> all search from current cursor position. It is a pretty conventionnal
> way to implement it I would say.
>=20
> Cheers,
> --=20
Can you review my changes ? https://github.com/smbcmp/smbcmp/pull/3
I didn't solve the problem of the faulty loop though, I think the problem i=
s with=20
the word "res" and ask for confirmation.


