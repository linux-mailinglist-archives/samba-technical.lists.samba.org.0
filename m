Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F8D707692
	for <lists+samba-technical@lfdr.de>; Thu, 18 May 2023 01:49:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=HqIeDXs/uBIIxxH+qOZtSPprrWbaIl+L9zVQFhOIvh8=; b=iB4HcQfkRScBi+9gJ/fFwzP/RI
	Xfr7OOm4FdLtsnCAC8CcpoStkhSuMGR8bKhUf7JLodK5PPMZhQYJKGJuMeUBVW8T2oSQEBQOKNWmb
	5uW+8JauNcLj4YiCrz8ri11+tK0Dt/hKx3SgGGxdRibNolG3RE/5tp1joQAQ6OtHFYZX4a4xLHx5g
	dWStGtpmkaMJcGGYY8nUyxEkB5bFYlXOSPa6wQNTLV+gRtgPFs8vWOHgxCMBlRx58K1tak4+I+G0C
	pc4HK5ImbDo0Dr2GNbdflFdBGP9/Fy8M9w9HiiSFMOX1k1ffH6pR+HF7PzCME9pAcFrYnOZSBcy5I
	uOFjOZWg==;
Received: from ip6-localhost ([::1]:44282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pzQsi-00AYqy-2h; Wed, 17 May 2023 23:48:32 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:51692) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pzQsd-00AYqp-Hg
 for samba-technical@lists.samba.org; Wed, 17 May 2023 23:48:29 +0000
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f13bfe257aso1585822e87.3
 for <samba-technical@lists.samba.org>; Wed, 17 May 2023 16:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684367305; x=1686959305;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HqIeDXs/uBIIxxH+qOZtSPprrWbaIl+L9zVQFhOIvh8=;
 b=gC52qANOtlsRCKuCl6CrgXpPJx5vD/kjHv2uudMqfHo9dJ2wXAJMSlYNaASfIJvIL0
 G47iKJZR6lihjSHEgsdm7kWZzaxBKXJjYBElcoJQBdnhL+FB/D0JkmG1pAPHYWYHt/8S
 5tfxUM/qgXFAdqxEpys6V5+lZciSKpVcEtzj5berjEYdMzvawhNDJGFa76+bD24LPYsK
 E0p3saqqw3umSioluEO5PniMoMA+ZqXsCV9tkXk5ifeiIPNUvcVEj++31Vm7BCvkktIG
 T5hkv0fLcrRlwPIVUK/7m0BNirWSRiSrS1OsWIJMXw+dDt3UmFq6PLkc47n9sBk0KuGB
 UNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684367305; x=1686959305;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqIeDXs/uBIIxxH+qOZtSPprrWbaIl+L9zVQFhOIvh8=;
 b=BF8hOjCj/7rSukdbr9ZQbuSMZYTWrn8aJnZvpqN/IHKVjhKOUdRNyikWMyHQRxayHQ
 LyvTorzvsCBlrY5Hj8LSVtKrXexalK4ovIdvfX51wTMF/nKy4K7qwLCATcxis+1cOHju
 73OCpT39itZQd7gpt5S0KWkrWj9DSqj2Pgjnpe0K+UU7QARGdPq+bhqII6AXamOj+AA8
 DQUQLXJ9xYO++D+wPQf6ZAg/9LtqCxKDkhyv/PPgihbA7zwxMv0zYV1kEmsIfW903a1C
 HjJpuFJgLyhe6K0Ax2/huYTxqE+gneLli69oBv0W8+kvSiocM0DsdDb5eOIOAxhzuOu6
 gEJg==
X-Gm-Message-State: AC+VfDz8FgHCGi12zFgr9GQ8vll5I36Z7GvWcixl7BDLTwyGKLEMidGn
 6jnYhz6k+Y2kCi7mZ186esFsMPBqU5dPZjC+SGGJ6452SzrtNw==
X-Google-Smtp-Source: ACHHUZ7aYn9WF9pnfcTOamk1w5amgbJbgoRv1fp8WvQhAYZKylWPgNfdtjLAfDCIkexYAKCmoynEFdz6LEEmXkvv13w=
X-Received: by 2002:ac2:5464:0:b0:4eb:5232:5397 with SMTP id
 e4-20020ac25464000000b004eb52325397mr660474lfn.21.1684367304708; Wed, 17 May
 2023 16:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mt=+=Xh+aNdfcFgB-yQuU_6NkUExpkYh5M4a9Axk4V9eQ@mail.gmail.com>
In-Reply-To: <CAH2r5mt=+=Xh+aNdfcFgB-yQuU_6NkUExpkYh5M4a9Axk4V9eQ@mail.gmail.com>
Date: Wed, 17 May 2023 18:48:13 -0500
Message-ID: <CAH2r5ms__suipEpVK3ffQui_4XhJkQvkiuhn-zYkPV4SSYB7-A@mail.gmail.com>
Subject: Re: Linux client test automation improvements
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

And added almost 10 tests to this multichannel test group:

http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/1/=
builds/29

(test run is against current for-next branch for cifs-2.6.git, ie
6.4-rc2 + 2 deferred close related patches)

On Wed, May 17, 2023 at 3:56=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> Migration of our Linux SMB3.1.1 client test automation (cifs.ko) to
> the new host is showing progress, I have added additional tests, and
> the tests run slightly faster overall.  Here is an example of a recent
> run:
>
> http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/=
7/builds/11
>
> With another test group (Azure multichannel) I did see a few
> intermittent test failures although those may be related to the test
> system or network not cifs.ko (see
> http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/=
1/builds/28
> e.g.), still investigating those.
>
> I will be rerunning the ksmbd and samba and samba POSIX test groups
> today with the new setup (adding the additional tests which now work
> with cifs.ko) and then finish by adding the main test group (which
> crosses many server types)
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

